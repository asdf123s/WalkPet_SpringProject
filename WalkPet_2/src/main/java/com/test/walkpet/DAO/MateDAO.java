package com.test.walkpet.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.AreaDTO;
import com.test.walkpet.DTO.MateDTO;
import com.test.walkpet.DTO.MateFileDTO;
import com.test.walkpet.DTO.PetDTO;

@Repository
public class MateDAO {
	
	@Autowired SqlSessionTemplate template;
	
	public int mateadd(MateDTO mdto) {
		
		return template.insert("mate.mateadd", mdto);
	}

	public void mateaddFile(MateFileDTO mfdto) {

		template.insert("mate.mateaddFile", mfdto);
		
	}

	public List<MateDTO> list() {

		return template.selectList("mate.list");
	}

	public List<String> mflist(String mateSeq) {
		
		return template.selectList("mate.mflist", mateSeq);
	}

	public MateDTO view(String mateSeq) {

		return template.selectOne("mate.view", mateSeq);
	}


	public void addTagMate(String tagName) {

		template.insert("mate.addTagMate", tagName);
		
	}

	public String getMateSeq(String mateSeq) {

		return template.selectOne("mate.getMateSeq", mateSeq);
	}
	
	
	
	

	public List<MateDTO> petInfo(String mateSeq) {

		return template.selectList("mate.petInfo", mateSeq);
	}

	
	

	

}
