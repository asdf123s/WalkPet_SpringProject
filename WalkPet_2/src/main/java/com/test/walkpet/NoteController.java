package com.test.walkpet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.walkpet.DAO.NoteDAO;
import com.test.walkpet.DTO.NoteDTO;

@Controller
public class NoteController {
	
	@Autowired private NoteDAO notedao;
	
	@GetMapping("/note/noteadd")
	public String noteadd(Model model) {
		
		return "note.noteadd";
	}
	
	@PostMapping("/note/noteaddok")
	public String noteaddok(NoteDTO ndto) {
		
		int result = notedao.add(ndto);
		
		if(result == 1) {
			return "redirect:/mate/matelist";
		} else {
			return "redirect:/note/noteadd";
		}
		
	}
	

}
