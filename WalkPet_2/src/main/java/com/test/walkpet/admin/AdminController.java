package com.test.walkpet.admin;

import java.io.UnsupportedEncodingException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.walkpet.DTO.MemberDTO;
import com.test.walkpet.annotation.AdminInterfaceDAO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminInterfaceDAO adminInterfaceDAO;
	
	
	@GetMapping("/admin/user")
	public String user(Model model) {
		
		List<MemberDTO> list = adminService.memberList();
		
		model.addAttribute("memberList", list);
		
		return "admin.user";
	}
	
	@GetMapping("/admin/userDetail")
	public String userDetail(Model model, String id) {
		
		MemberDTO dto = adminService.memberDetail(id);
		List<PetDTO> petList = adminService.petList(id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("petList", petList);
		
		return "admin.userDetail";
		
	}
	
	@GetMapping("/admin/userDel")
	public String userDel(Model model, String id) {
		
		int n = adminService.userDel(id);
		
		if(n == 1) {
			return "redirect:/admin/user";
		}else {
			return "redirect:/admin/userDetail?id="+id;
		}
		
	}
	
	
	@GetMapping("/admin/boardList")
	public String imgBoard(Model model, String boardCategory, String page, String word, HttpServletRequest req) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		List<BoardImgDTO> imglist = adminService.boardImgList();

		int nowPage = 0;
		int begin = 0;
		int end = 0;
		int pageSize = 8;
		int totalCount = 0;
		int totalPage = 0;

		if (page == null || page == "")
			nowPage = 1;
		else nowPage = Integer.parseInt(page);
			

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		String isSearch = "n"; // n(목록) y(검색)

		if (word == null || word == "" || word.equals("")) {
			isSearch = "n";
		} else {
			isSearch = "y";
		}

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("word", word);
		map.put("isSearch", isSearch);
		
		map.put("boardCategory", boardCategory);

		map.put("begin", begin + "");
		map.put("end", end + "");
		
		List<BoardDTO> list;
		
		if(isSearch.equals("n")) {
			list = adminService.boardList(map);
		}else {
			list = adminService.boardSearchList(map);
		}

		model.addAttribute("map", map);
		
		totalCount = adminService.getBoardTotalCount(boardCategory);
		totalPage = (int) (Math.ceil((double) totalCount / pageSize));

		String pagebar = "";
		int blockSize = 8;
		int n = 0;
		int loop = 0;

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		if (n == 1) {
			pagebar += String.format("<a href='#!' style='cursor:not-allowed;' class='pagebtn'>◀</a>");
		} else {
			pagebar += String.format("<a href='/walkpet/admin/boardList?boardCategory=%s&page=%d' class='pagebtn'>◀</a>",boardCategory, n - 1);
		}

		// 1 > 10
		
		while (!(loop > blockSize || n > totalPage)) {

			if (nowPage == n) {
				// 현재페이지 23페이지였을때 23을 눌렀을때
				pagebar += String.format("<div class=\"nowpage\"><a href='#!' class='pagebtn'>%d</a></div>", n);
			} else {
				pagebar += String.format(" <a href='/walkpet/admin/boardList?boardCategory=%s&page=%d' class='pagebtn'>%d</a>",boardCategory, n, n);
			}

			loop++;
			n++;
		}

		if (n > totalPage) {
			pagebar += String.format(" <a href='#!' style='cursor:not-allowed;' class='pagebtn'>▶</a>");
		} else {
				pagebar += String.format(" <a href='/walkpet/admin/boardList?boardCategory=%s&page=%d' class='pagebtn'>▶</a>",boardCategory, n);
			
		}
		model.addAttribute("pagebar", pagebar);
		
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("type", boardCategory);
		model.addAttribute("imgList", imglist);
		
		return "admin.boardList";
		
	}
	
	@GetMapping("/admin/boardDetail")
	public String boardDetail(Model model, String seq) {
		
		BoardDTO dto = adminService.getBoard(seq);
		List<BoardImgDTO> imglist = adminService.boardImgList();
		
		model.addAttribute("imgList", imglist);
		model.addAttribute("dto", dto);
		
		return "admin.boardDetail";
		
	}
	
	@GetMapping("/admin/boardDel")
	public String boardDel(Model model, String seq, HttpServletRequest req) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		BoardDTO dto = adminService.getBoard(seq);
		int n = adminService.boardDel(seq);
		
		
		
		if(n == 1) {
			return "redirect:/admin/boardList?boardCategory=" + dto.getBoardCategory();
		}else {
			return "redirect:/admin/boardDetail?seq="+seq;
		}
		
	}
	
	
	@GetMapping("/admin/login")
	public String login() {
		return "admin.login";
	}
	
	@PostMapping(value="/admin/loginok")
	public String loginok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, AdminDTO dto) {
		
		dto.setAdminId((String)req.getParameter("id"));
		dto.setAdminPw((String)req.getParameter("pw"));
		
		String id = dto.getAdminId();
		String pw = dto.getAdminPw();
		
		List<MemberDTO> loginok = adminService.loginlist(dto);
		
		
		
		if (!loginok.isEmpty()) {
			
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionPw", pw);
			
			return "redirect:/admin/index";
		} else {
			
			return "redirect:/member/login";
		}
		
	}
	
	@GetMapping("/admin/index")
	public String index(Model model) {
		
		List<MemberDTO> memberList = adminInterfaceDAO.memberList();
		List<BoardDTO> boardList = adminInterfaceDAO.indexBoardList();
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("memberList", memberList);
		
		return "admin.index";
	}
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("sessionId");
		session.removeAttribute("sessionPw");
		
		return "redirect:/index";
	}
	
}
