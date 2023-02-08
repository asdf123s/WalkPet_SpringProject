package com.test.walkpet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.walkpet.DAO.MemberDAO;
import com.test.walkpet.DTO.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	
	@GetMapping("/member/login")
	public String login() {
		return "member.login";
	}
	
	@PostMapping(value="/member/loginok")
	public String loginok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, MemberDTO dto) {
		
		dto.setId((String)req.getParameter("id"));
		dto.setPw((String)req.getParameter("pw"));
		
		String id = dto.getId();
		String pw = dto.getPw();
		
		List<MemberDTO> loginok = dao.loginlist(dto);
		
		System.out.println(loginok);
		
		if (!loginok.isEmpty()) {

			session.setAttribute("sessionId", id);
			session.setAttribute("sessionPw", pw);
			
			session.setAttribute("sessionName", loginok.get(0).getName());
			
			return "redirect:/index";
		} else {
			return "member.loginok";
		}
		
	}
	
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionId");
		session.removeAttribute("sessionPw");
		
		return "redirect:/index";
	}
	
	@GetMapping("/member/findPw")
	public String findPw() {
		return "member.findPw";
	}
	
	@PostMapping("/member/findPwOk")
	public String findPwOk(String id, String jumin, MemberDTO dto, Model model) {
		
		System.out.println(dto);
		
		MemberDTO findpw = dao.findpw(dto);
		System.out.println(findpw);
		model.addAttribute("dto", findpw);
		
		return "member.findPwOk";
		
	}
	
	@GetMapping("/member/findId")
	public String findId() {
		return "member.findId";
	}
	
	@PostMapping("/member/findIdOk")
	public String findIdOk(String name, String jumin, MemberDTO dto, Model model) {
		
		System.out.println(dto);
		
		MemberDTO findid = dao.findid(dto);
		System.out.println(findid);
		model.addAttribute("dto", findid);
		
		return "member.findIdOk";
		
	}
	
	@GetMapping("/member/signup")
	public String signup(String memId) {
		
		System.out.println(memId); 
		
		return "member.signup";
	}
	
	
	@PostMapping("/member/idCheck")
	public String idCheck(String id, Model model, HttpServletResponse resp) {
		
		System.out.println(id);
		int result = dao.idCheck(id);
		
		System.out.println(result);
		model.addAttribute("result", result);
		//return "redirect:/member/signup?result=" + result;
		
		resp.setContentType("application/json");
		
		try {
			PrintWriter writer;
			writer = resp.getWriter();
			writer.print(result);
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "";
		
		
	}
	
	
	@PostMapping("/member/signupOk")
	public String signupOk(MemberDTO dto, Model model) {

		int result = dao.signup(dto);
		
		model.addAttribute("result", result);
		model.addAttribute("dto", dto);
		return "member.signupOk";
	}

}
