package com.test.walkpet;

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

import com.test.walkpet.DAO.AreaDAO;
import com.test.walkpet.DAO.MateDAO;
import com.test.walkpet.DAO.PetDAO;
import com.test.walkpet.DTO.MateDTO;
import com.test.walkpet.DTO.MateFileDTO;
import com.test.walkpet.DTO.MemberDTO;
import com.test.walkpet.DTO.PetDTO;



@Controller
public class MateController {
	
	@Autowired
	private MateDAO matedao;
	@Autowired
	private AreaDAO areadao;
	@Autowired
	private PetDAO petdao;
	
	//글쓰기 추가
	@GetMapping("/mate/mateadd")
	public String mateadd() {
		
		return "mate.mateadd";
	}
	
	//글쓰기 완료
	@PostMapping("/mate/mateaddok")
	public String mateaddok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, MemberDTO dto) {
		
		MateDTO mdto = new MateDTO();
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		String id = multi.getParameter("id");
		String mateSeq = multi.getParameter("mateSeq");
		String mateSubject = multi.getParameter("mateSubject");
		String mateContent = multi.getParameter("mateContent");
		String regdate = multi.getParameter("regdate");
		String periodState = multi.getParameter("periodState");
		String startDate = multi.getParameter("startDate");
		String endDate = multi.getParameter("endDate");
		String areaName = multi.getParameter("areaName");

		
		//태그
		String tagName = multi.getParameter("tagName");
		
		

		//파일의 참조 객체
		MultipartFile attach = multi.getFile("attach");
		
		mdto.setId(id);
		mdto.setMateSeq(mateSeq);
		mdto.setMateSubject(mateSubject);
		mdto.setMateContent(mateContent);
		mdto.setRegdate(regdate);
		mdto.setPeriodState(periodState);
		mdto.setStartDate(startDate);
		mdto.setEndDate(endDate);
		mdto.setAreaName(areaName);
		
		int result = matedao.mateadd(mdto); //글쓰기
		
		System.out.println(result);
		
		
		
		if(result == 1) {
			
			//원하는 폴더로 이동
			String mateImgName = attach.getOriginalFilename();
			String path = req.getRealPath("/resources/files");
			
			System.out.println(path);
			
			
			//파일 이동
			File file = new File(path + "\\" + mateImgName);
			
			try {
				
				//원하는 폴더로 파일이동함
				attach.transferTo(file);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//방금 추가한 게시글 번호
			mateSeq = matedao.getMateSeq(mateSeq);

			
			//첨부파일 정보 insert
			MateFileDTO mfdto = new MateFileDTO();
			
			mfdto.setMateImgName(mateImgName); //파일명
			mfdto.setMateSeq(mateSeq); //글번호
			
			matedao.mateaddFile(mfdto);
			
			
			return "redirect:/mate/matelist";
		} else {
			return "redirect:/mate/mateadd";
		}
		
	}
	
	
	
	//글쓰기 목록
	@GetMapping("/mate/matelist")
	public String matelist(Model model) {
		
		List<MateDTO> list = matedao.list();
		
		
		
		for(MateDTO mdto : list) {
			List<String> mflist = matedao.mflist(mdto.getMateSeq());
			mdto.setFiles(mflist);
			
			//날짜 자르기
			String start = mdto.getStartDate();
			String end = mdto.getEndDate();
			
			start = start.substring(0,10);
			end = end.substring(0,10);
			
			mdto.setStartDate(start);
			mdto.setEndDate(end);
		}
		
		model.addAttribute("list", list);
		
		
		
		return "mate.matelist";
	}
	
	
	//글쓰기 상세
	@GetMapping("/mate/mateview")
	public String mateview(Model model, String mateSeq) {
		
		MateDTO mdto = matedao.view(mateSeq);
		
		mdto.setFiles(matedao.mflist(mateSeq));
		
		//동물 정보
		List<MateDTO> petInfo = matedao.petInfo(mateSeq);
		System.out.println(petInfo);
		model.addAttribute("petInfo", petInfo);
		
		
		//날짜 자르기
		String start = mdto.getStartDate();
		String end = mdto.getEndDate();
		
		start = start.substring(0,10);
		end = end.substring(0,10);
		
		mdto.setStartDate(start);
		mdto.setEndDate(end);
		
		model.addAttribute("mdto", mdto);
		
		
		return "mate.mateview";
		
	}


}
