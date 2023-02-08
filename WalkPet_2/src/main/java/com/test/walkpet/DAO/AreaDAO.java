package com.test.walkpet.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.AreaDTO;

@Repository
public class AreaDAO {
	
	@Autowired SqlSession template;

	public String getAreaName(String areaName) {
		
		return template.selectOne("mate.getAreaName", areaName);
	}

	public String areaadd(AreaDTO adto) {

		return template.selectOne("mate.areaadd", adto);
		
	}
	
	

}
