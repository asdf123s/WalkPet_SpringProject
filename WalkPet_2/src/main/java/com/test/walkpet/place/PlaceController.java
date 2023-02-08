package com.test.walkpet.place;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.test.walkpet.DAO.PlaceDAO;
import com.test.walkpet.DTO.placeDTO;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceDAO pdao;
	
	@GetMapping("place/cafe")
	public String cafe(Model model) {
		
		List<placeDTO> list = pdao.list("카페");
		
		model.addAttribute("placeList", list);
		
		return "place.cafe";
	}
	
	@GetMapping("place/food")
	public String food(Model model) {
		
		List<placeDTO> list = pdao.list("음식점");
		
		model.addAttribute("placeList", list);
		
		return "place.food";
	}
	
	@GetMapping("place/shopping")
	public String shopping(Model model) {
		
		List<placeDTO> list = pdao.list("쇼핑몰");
		
		model.addAttribute("placeList", list);
		
		return "place.shopping";
	}
	
	@GetMapping("place/beauty")
	public String beauty(Model model) {
		
		List<placeDTO> list = pdao.list("미용");
		
		model.addAttribute("placeList", list);
		
		return "place.beauty";
	}
	
	@GetMapping("place/accommodation")
	public String accommodation(Model model) {
		
		List<placeDTO> list = pdao.list("숙소");
		
		model.addAttribute("placeList", list);
		
		return "place.accommodation";
	}
	
	@ResponseBody
	@RequestMapping(value= "place/place_choice", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String place_choice(HttpServletRequest req, Model model) {		
		
		String addr = req.getParameter("addr");
		String shopCategory = req.getParameter("shopCategory");
		
		placeDTO pdto = new placeDTO();
		pdto.setAreaName(addr);
		pdto.setShopCategory(shopCategory);
		
		List<placeDTO> list = pdao.list(pdto);
		System.out.println(addr);
		System.out.println(shopCategory);
		System.out.println(list);
		
		model.addAttribute("placeList", list);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for(placeDTO dto : list) {
			JsonObject jobj = new JsonObject();
			jobj.addProperty("likeCount", dto.getLikeCount());
			jobj.addProperty("shopSeq", dto.getShopSeq());
			jobj.addProperty("areaName", dto.getAreaName());
			jobj.addProperty("shopCategory", dto.getShopCategory());
			jobj.addProperty("shopName", dto.getShopName());
			jobj.addProperty("lat", dto.getLat());
			jobj.addProperty("longg", dto.getLongg());
			jobj.addProperty("shopAddress", dto.getShopAddress());
			jobj.addProperty("tel", dto.getTel());
			jobj.addProperty("hours", dto.getHours()); 
			jobj.addProperty("shopImgImage", dto.getShopImgImage());
			
			jlist.add(jobj);
		}
	
		jdata.add("jlist", jlist);

		return gson.toJson(jdata);
		
	}

}
