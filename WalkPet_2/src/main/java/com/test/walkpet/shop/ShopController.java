package com.test.walkpet.shop;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {
	
	@Autowired
	private ShopService service;
	
	@GetMapping("/shop/shopDetail")
	public String shopDetail(HttpSession session, Model model, String seq) {
		
		ShopDTO dto = service.getShop(seq);
		
		List<ReviewDTO> review = service.getReview(seq);
		
		System.err.println(review);
		
		for(ReviewDTO rdto : review) {
			String[] regdate = rdto.getRegdate().split(" ");
			String date = regdate[0];
			
			rdto.setRegdate(date);
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("review",review);
		
		return "shop.shopDetail";
	}
	
}
