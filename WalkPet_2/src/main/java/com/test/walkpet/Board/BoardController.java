package com.test.walkpet.Board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.walkpet.DTO.CommentDTO;
import com.test.walkpet.DTO.FileDTO;
import com.test.walkpet.DAO.BoardDAO;
import com.test.walkpet.DTO.BoardDTO;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO dao;

	@GetMapping("/board/galary")
	public String galary(HttpServletRequest req, HttpSession session, HttpServletResponse resp, Model model, String boardSeq) {

		
		 List<BoardDTO> galary = dao.galary();
		 
		 for(BoardDTO galary2 : galary) {
			 
			 String date = galary2.getRegdate();
			 
			 date = date.substring(0, 16);
			 
			 galary2.setRegdate(date);
			 
			 String content = galary2.getContent();
				
				if (content.length() > 70) {
					content = content.substring(0, 70);
					galary2.setContent(content + "....");
				}
			 
		 }
		 
		 model.addAttribute("galary", galary);
		 

		return "board.galary";
	}
	 
	
	@GetMapping("/board/dogBoard")
	public String dogBoard(HttpServletRequest req, HttpSession session, HttpServletResponse resp, Model model) {

		
		 List<BoardDTO> dogBoard = dao.dogBoard();
		 
		 for(BoardDTO dogBoard2 : dogBoard) {
			 
			 String date = dogBoard2.getRegdate();
			 
			 date = date.substring(0, 16);
			 
			 dogBoard2.setRegdate(date);
			 
			 String content = dogBoard2.getContent();
				
				if (content.length() > 70) {
					content = content.substring(0, 70);
					dogBoard2.setContent(content + "....");
				}
			 
		 }
		 
		 model.addAttribute("dogBoard", dogBoard);
		 

		return "board.dogBoard";
	}
	
	@GetMapping("/board/catBoard")
	public String catBoard(HttpServletRequest req, HttpSession session, HttpServletResponse resp, Model model) {

		
		 List<BoardDTO> catBoard = dao.catBoard();
		 
		 for(BoardDTO catBoard2 : catBoard) {
			 
			 String date = catBoard2.getRegdate();
			 
			 date = date.substring(0, 16);
			 
			 catBoard2.setRegdate(date);
			 
			 String content = catBoard2.getContent();
				
				if (content.length() > 70) {
					content = content.substring(0, 70);
					catBoard2.setContent(content + "....");
				}
			 
		 }
		 
		 model.addAttribute("catBoard", catBoard);
		 

		return "board.catBoard";
	}
	
	@GetMapping("/board/friendsBoard")
	public String friendsBoard(HttpServletRequest req, HttpSession session, HttpServletResponse resp, Model model) {

		
		 List<BoardDTO> friendsBoard = dao.friendsBoard();
		 
		 for(BoardDTO friendsBoard2 : friendsBoard) {
			 
			 String date = friendsBoard2.getRegdate();
			 
			 date = date.substring(0, 16);
			 
			 friendsBoard2.setRegdate(date);
			 
			 String content = friendsBoard2.getContent();
				
				if (content.length() > 70) {
					content = content.substring(0, 70);
					friendsBoard2.setContent(content + "....");
				}
			 
		 }
		 
		 model.addAttribute("friendsBoard", friendsBoard);
		 

		return "board.friendsBoard";
	}
	

	@GetMapping("/board/boardDetail")
	public String boardDetail(HttpServletRequest req, HttpSession session, String boardSeq, HttpServletResponse resp, Model model) {

		
		BoardDTO boardDetail = dao.boardDetail(boardSeq);
		List<CommentDTO> commentList = dao.commentList(boardSeq);
		BoardDTO boardView = dao.boardView(boardSeq);
		
	
		model.addAttribute("boardDetail", boardDetail);
		model.addAttribute("commentList", commentList);
		model.addAttribute("boardView",boardView);

		return "board.boardDetail";
	}
	
	
	
	@GetMapping("/board/add")
	public String add(HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		
		return "board.add";
	}
	
	@PostMapping(value="/board/commentok")
	public String commentok(HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		
		CommentDTO dto = new CommentDTO();
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		String id = "test";
		String commentTxt = multi.getParameter("commentTxt");
		String boardSeq = multi.getParameter("boardSeq");
		
		dto.setId(id);
		dto.setBoardSeq(boardSeq);
		dto.setCommentTxt(commentTxt);
		
		int result = dao.commentAdd(dto); //????????????
		
		return "redirect:/board/boardDetail.do?boardSeq="+boardSeq;
		
	}
	
	
	@PostMapping(value="/board/addok")
	public String addok(HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		
		BoardDTO dto = new BoardDTO();
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		String id = "test";
		//String id = multi.getParameter("id");
		String boardCategory = multi.getParameter("boardCategory");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		
		dto.setId("test");
		//dto.setId(id);
		dto.setBoardCategory(boardCategory);
		dto.setSubject(subject);
		dto.setContent(content);
		
		int result = dao.add(dto); //?????????
		
		List<MultipartFile> files = multi.getFiles("attach");
		String path = req.getRealPath("/resources/images");
		
		System.out.println(path);
		
		for (MultipartFile file : files) {
			
			//System.out.println(file.isEmpty());
			
			if (!file.isEmpty()) {
				String filename = getFileName(path, file.getOriginalFilename());
				
				try {
					file.transferTo(new File(path + "\\" + filename));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				//???????????? ?????? insert
				FileDTO fdto = new FileDTO();
				
				fdto.setImgName(filename); //?????????
				fdto.setImgSize(file.getSize() + "");
				fdto.setImgType(file.getContentType());
				
				dao.addFile(fdto);
				
			}
			
		}
		
		if(dto.getBoardCategory().equals("???????????? ?????????")) {
			
			return "redirect:/board/galary";
			
		} else if(dto.getBoardCategory().equals("?????????")) {
			
			return "redirect:/board/dogBoard";
			
		} else if(dto.getBoardCategory().equals("?????????")) {
			
			return "redirect:/board/catBoard";
			
		} else if(dto.getBoardCategory().equals("?????? ?????????")) {
			
			return "redirect:/board/friendsBoard";
			
		}
		
		return "redirect:/index";
				
	}

		private String getFileName(String path, String filename) {
		
		//?????? ???????????? ???????????? ???????????? ?????? ?????????
		//path = "resources/files"
		//filename = "test.txt"
		
		//test.txt > test(1).txt > test(2).txt
		int n = 1; //????????? ??????
		int index = filename.lastIndexOf("."); //????????? ??????
		
		String tempName = filename.substring(0, index); //"test"
		String tempExt = filename.substring(index); //".txt"
		
		while (true) {
			
			File file = new File(path + "\\" + filename);
			
			if (file.exists()) {
				//??????. > ?????? > ????????? ??????
				filename = String.format("%s(%d)%s", tempName, n, tempExt);
				n++;				
			} else {
				//??????. > ?????? ????????? ?????????
				return filename;
			}
			
		}
		
	}
		
	@GetMapping(value="/board/del")
	public String del(HttpServletRequest req, HttpSession session, HttpServletResponse resp, String boardSeq, Model model) {
					
		model.addAttribute("seq", boardSeq);
			
		return "board.del";
	}
	


}
