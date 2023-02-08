package com.test.walkpet.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.NoteDTO;

@Repository
public class NoteDAO {
	
	@Autowired SqlSessionTemplate template;

	public int add(NoteDTO ndto) {

		return template.insert("note.add", ndto);
	}

}
