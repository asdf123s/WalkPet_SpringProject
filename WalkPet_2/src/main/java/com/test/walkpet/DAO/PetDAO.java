package com.test.walkpet.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.AreaDTO;
import com.test.walkpet.DTO.MemberDTO;
import com.test.walkpet.DTO.PetDTO;
import com.test.walkpet.DTO.PetFileDTO;

@Repository
public class PetDAO {
	
	@Autowired SqlSessionTemplate template;
	
	public int petadd(PetDTO pdto) {

		return template.insert("walkpet.petadd", pdto);
	}

	
	public void addPetFile(PetFileDTO fdto) {
		
		System.out.println(fdto);

		template.insert("walkpet.addPetFile", fdto);
		
	}


	public List<PetFileDTO> petfileList(String petSeq) {

		return template.selectList("walkpet.petfileList", petSeq);
	}

	public String getPetSeq(String petSeq) {

		return template.selectOne("walkpet.getmaxPetSeq");
	}
	
	

	
	
	
//	동반인 동물정보 
	public String petInfo(PetDTO pdto) {
		
		return template.selectOne("mate.petInfo", pdto);
		
	}

//	동물 목록
	public List<PetDTO> petList(String id) {
		
		return template.selectList("walkpet.petList");
	}


	


}
