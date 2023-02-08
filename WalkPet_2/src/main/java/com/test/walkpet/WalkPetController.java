package com.test.walkpet;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.walkpet.DAO.MemberDAO;
import com.test.walkpet.DAO.PetDAO;
import com.test.walkpet.DTO.AreaDTO;
import com.test.walkpet.DTO.BoardDTO;
import com.test.walkpet.DTO.DiaryDTO;
import com.test.walkpet.DTO.MateDTO;
import com.test.walkpet.DTO.MemberDTO;
import com.test.walkpet.DTO.NoteDTO;
import com.test.walkpet.DTO.PetDTO;
import com.test.walkpet.DTO.PetDiaryDTO;
import com.test.walkpet.DTO.PetFileDTO;
import com.test.walkpet.DTO.ReviewDTO;
import com.test.walkpet.DTO.ShopDTO;
import com.test.walkpet.DTO.WishDTO;

@Controller
public class WalkPetController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private PetDAO petdao;
	
	@GetMapping("/index")
	public String index(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sessionId");
		
		model.addAttribute("id", id);
		
		if(id != null) {
			List<PetDTO> list = dao.getPet(id);
			MemberDTO mlist = dao.getMember(id);
			List<DiaryDTO> dlist = dao.getDiary(id);
			List<NoteDTO> nlist = dao.getNote(id);
			model.addAttribute("petdto", list);
			session.setAttribute("petdto", list);
			model.addAttribute("mdto", mlist);
			model.addAttribute("diary", dlist);
			session.setAttribute("diary", dlist);
			model.addAttribute("note", nlist);
		}
		
		//카페
		List<ShopDTO> cafe = dao.getCafe();
		model.addAttribute("cafe", cafe);
		
		//음식점
		List<ShopDTO> food = dao.getFood();
		model.addAttribute("food", food);
		
		//쇼핑몰
		List<ShopDTO> shopping = dao.getShopping();
		model.addAttribute("shopping", shopping);
		
		//미용
		List<ShopDTO> beauty = dao.getBeauty();
		model.addAttribute("beauty", beauty);
		
		//숙소
		List<ShopDTO> rest = dao.getRest();
		model.addAttribute("rest", rest);
		
		//동반인 모집
		List<MateDTO> mate = dao.getMate();
		model.addAttribute("mate", mate);
		
		
		//지역 > 서울
		List<AreaDTO> seoul = dao.getSeoul();
		model.addAttribute("seoul", seoul);
		
		System.out.println(seoul);
		
		//지역 > 경기도
		List<AreaDTO> gyeong = dao.getGyeong();
		model.addAttribute("gyeong", gyeong);
		
		
		System.out.println(gyeong);
		
		return "index";
	}
	
	@GetMapping("/elements")
	public String test2() {
		return "elements";
	}
	
	@GetMapping("/generic")
	public String test3() {
		return "generic";
	}
	
	
	
	//@PostMapping(value="/member/mypage")
	@RequestMapping(value="/member/mypage")
	public String mypage(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sessionId");
		session.getAttribute("sessionName");
		
		//찜 목록
		List<WishDTO> wishlist = dao.wishlist(id);
		System.out.println(wishlist);
		model.addAttribute("wishlist", wishlist);
		
		
		//작성한 글 목록
		List<BoardDTO> boardlist = dao.boardlist(id);
		System.out.println(boardlist);
		model.addAttribute("boardlist", boardlist);
		
		
		//작성한 후기 목록
		List<ReviewDTO> reviewlist = dao.reviewlist(id);
		System.out.println(reviewlist);
		model.addAttribute("reviewlist", reviewlist);
		
		
		//카운트
		int wishlistsize = wishlist.size();
		int boardlistsize = boardlist.size();
		int reviewlistsize = reviewlist.size();
		
		model.addAttribute("wishlistsize", wishlistsize);
		model.addAttribute("boardlistsize", boardlistsize);
		model.addAttribute("reviewlistsize", reviewlistsize);
		
		
		//이미지
		String petimg = dao.getpetimg(id);
		System.out.println(petimg);
		model.addAttribute("petimg", petimg);
		
		
		
		return "member.mypage";
	}
	
	//@PostMapping("/member/petdiary")
	@RequestMapping("/member/petdiary")
	public String petdiary(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("sessionId");
		session.getAttribute("sessionName");
		      
		String ddate = (String)req.getParameter("input_date");
		System.out.println(ddate);
		      
		model.addAttribute("ddate", ddate);
		      
		System.out.println("id:" + id);
		      
		if(ddate != null) {
		         
		   Map<String, Object> map = new HashMap();
		   map.put("ddate", ddate);
		   map.put("id", id);
		         
		   List<PetDiaryDTO> mdiary = dao.diarydetail(map);
		   System.out.println(mdiary);
		         
		   model.addAttribute("mdiary", mdiary);
		         
		} else {
		         
		   System.out.println("ddate가 비어있습니다.");
		}
		      
		      
		      
		      
		      
		model.addAttribute("id", id);
		if(id != null) {
		   List<PetDTO> list = dao.getPet(id);
		   MemberDTO mlist = dao.getMember(id);
		   List<DiaryDTO> dlist = dao.getDiary(id);
		   List<NoteDTO> nlist = dao.getNote(id);
		   model.addAttribute("dto", list);
		   model.addAttribute("mdto", mlist);
		   model.addAttribute("diary", dlist);
		   model.addAttribute("note", nlist);
		}
		      
		      
		      
		      
		return "member.petdiary";
	}
	
	@PostMapping("/member/diarywrite")
	public String diarywrite(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		System.out.println(session.getAttribute("sessionId"));
		
		return "member.diarywrite";
	}
	
	@RequestMapping("/member/diarywriteok")
	public String diarywriteok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("sessionId");
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		String content = multi.getParameter("diarycontent");
		MultipartFile attach = multi.getFile("attach");
		
		System.out.println("content:" + content);
		System.out.println("attach:" + attach);
		System.out.println("originalname:" + attach.getOriginalFilename());
		
		String filename = attach.getOriginalFilename();
		String path = req.getRealPath("resources/images");
		
		System.out.println(path);
		
		//파일명 중복 방지
		filename = getFileName(path, filename);
		
		//파일 이동
		File file2 = new File(path + "\\" + filename);
		
		try {
			
			//attach.renameTo(file2)
			attach.transferTo(file2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String petseq = dao.getPetSeq(id);
		System.out.println("petseq:" + petseq);
		
		
		Map<String, Object> map = new HashMap();
		
		map.put("petSeq", petseq);
		map.put("id", id);
		map.put("diaryImg", filename);
		map.put("diaryContent", content);	
		
		int diaryinsert = dao.diaryinsert(map);

		if( diaryinsert == 1) {
			
			List<PetDiaryDTO> diary = dao.insertafterview(map);
			model.addAttribute("diary", diary);
		}
		
		
		return "member.petdiary";
	}

	private String getFileName(String path, String filename) {
		//저장 폴더내의 파일명을 중복되지 않게 만들기
		//path = "resources/images"
		//filename = "catty14.png"
		
		//test.txt -> test(1).txt -> test(2).txt
		int n = 1; //인덱스 숫자
		int index = filename.lastIndexOf("."); //확장자 위치
		
		String tempName = filename.substring(0, index); //"catty14"
		String tempExt = filename.substring(index); //".png"
		
		while (true) {
			
			File file = new File(path + "\\" + filename);
			
			if (file.exists()) {
				//있다. -> 중복 -> 파일명 변경
				filename = String.format("%s(%d).%s", tempName, n, tempExt);
				n++;
			} else {
				//없다. -> 사용 가능한 파일명
				return filename;
			}
		}
		
	}
	
	@PostMapping("/member/note")
	public String note(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("sessionId");
		
		List<NoteDTO> notelist = dao.notelist(id);
		System.out.println(notelist);
		model.addAttribute("notelist", notelist);
		
		return "member.note";
	}
	
	@PostMapping("/member/petinfoupdate")
	public String petinfoupdate(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("sessionId");
		
		List<PetDTO> petinfolist = dao.petinfolist(id);
		System.out.println(petinfolist);
		model.addAttribute("petinfolist", petinfolist);
		
		return "member.petinfoupdate";
	}
	
	@PostMapping("/member/petinfoupdateok")
	public String petinfoupdateok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("sessionId");
		
		String petname = req.getParameter("petname");
		String petvar = req.getParameter("petvar");
		String petgender = req.getParameter("petgender");
		String petage = req.getParameter("petage");
		String petchar = req.getParameter("petchar");
		
		Map<String, Object> map = new HashMap();
		map.put("petname", petname);
		map.put("petvar", petvar);
		map.put("petgender", petgender);
		map.put("petage", petage);
		map.put("petchar", petchar);
		
		int petinfoinsert = dao.petinfoinsert(map);
		
		if(petinfoinsert == 1) {
			
			List<PetDTO> petinfolist = dao.petinfolist(id);
			System.out.println(petinfolist);
			model.addAttribute("petinfolist", petinfolist);
			
		}
		
		
		return "member.petinfoupdate";
	}
	
	@PostMapping("/mapArea")
	public @ResponseBody List<Object> mapArea(String area, Model model, HttpServletResponse resp) {
		
		List<Object> list = dao.getLatLng(area);
		
		model.addAttribute("list", list);
				
		return list;
		
	}
	
//	반려동물 추가하기
	@GetMapping("/pet/petadd")
	public String petadd(MemberDTO dto) {
		
		
		
		return "pet.petadd";
	}
	
	@PostMapping("/pet/petaddok")
	public String petaddok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, MemberDTO dto) {
		
		PetDTO pdto = new PetDTO();

		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		String id = multi.getParameter("id");
		String petSeq = multi.getParameter("petSeq");
		String petType = multi.getParameter("petType");
		String petName = multi.getParameter("petName");
		String petVar = multi.getParameter("petVar");
		String petGender = multi.getParameter("petGender");
		String petAge = multi.getParameter("petAge");
		String petChar = multi.getParameter("petChar");
		
		//파일의 참조 객체
		MultipartFile attach = multi.getFile("attach");
		
		pdto.setId(id);
		pdto.setPetSeq(petSeq);
		pdto.setPetType(petType);
		pdto.setPetName(petName);
		pdto.setPetVar(petVar);
		pdto.setPetGender(petGender);
		pdto.setPetAge(petAge);
		pdto.setPetChar(petChar);
		
		int result = petdao.petadd(pdto); //글쓰기
		
		System.out.println(pdto);
		
		//성공하면 
		if(result == 1) {

			//원하는 폴더로 이동
			String petImgName = attach.getOriginalFilename();
			//파일경로 맞는지 봐야함
			String path = req.getRealPath("/resources/files");
			
			System.out.println(path); //콘솔 찍어보고
			
			//파일명 중복 방지
//			petImgName = getFileName(path, petImgName);
			
			
			//파일이동
			File file = new File(path + "\\" + petImgName);
			
			try {
				attach.transferTo(file);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//방금 추가한 반려동물번호
			petSeq = petdao.getPetSeq(petSeq); //select max(petSeq) from tblPet
			
			//첨부파일 정보 insert
			PetFileDTO fdto = new PetFileDTO();
			
			fdto.setPetImgName(petImgName);//파일명
			fdto.setPetSeq(petSeq); //반려동물 번호
			
			petdao.addPetFile(fdto);
			
			
			return "redirect:/index"; //메인으로 가게
			
		} else {
			return "redirect:/pet.petadd";
		}
		
		
	}
	
	

	//	등록한 거 index에서 보여줘야함
	@GetMapping("/layout/layout")
	public String petList(Model model, String id) {
		
		List<PetDTO> petList = petdao.petList(id);
		
		for(PetDTO pdto : petList) {
			List<PetFileDTO> petfileList = petdao.petfileList(pdto.getPetSeq());
			pdto.setFiles(petfileList);
		}
		
		model.addAttribute("petList", petList);
		
		return "redirect:/layout.layout";
	}
	
}
