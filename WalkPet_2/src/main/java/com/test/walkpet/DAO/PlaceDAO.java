package com.test.walkpet.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.placeDTO;

@Repository
public class PlaceDAO {
	
	@Autowired SqlSessionTemplate template;

	public List<placeDTO> list(String shopCategory) {
		
		return template.selectList("walkpet.placeList", shopCategory); //mapper 쿼리문 id와 동일해야함.
	}
	
	public List<placeDTO> list(placeDTO dto) {
		return template.selectList("walkpet.placeChoiceList", dto);
	}
	
}
