package com.test.walkpet.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.AreaDTO;
import com.test.walkpet.DTO.BoardDTO;
import com.test.walkpet.DTO.DiaryDTO;
import com.test.walkpet.DTO.MateDTO;
import com.test.walkpet.DTO.MemberDTO;
import com.test.walkpet.DTO.NoteDTO;
import com.test.walkpet.DTO.PetDTO;
import com.test.walkpet.DTO.PetDiaryDTO;
import com.test.walkpet.DTO.ReviewDTO;
import com.test.walkpet.DTO.ShopDTO;
import com.test.walkpet.DTO.WishDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate template;

	
	  public List<MemberDTO> loginlist(MemberDTO dto) {
	  
		  return template.selectList("walkpet.login", dto); 
	  }


	public List<PetDiaryDTO> diarydetail(Map<String, Object> map) {

		return template.selectList("walkpet.diarydetail", map);
	}


	public String getPetSeq(String id) {
		
		return template.selectOne("walkpet.getPetSeq", id);
	}


	public int diaryinsert(Map<String, Object> map) {
		
		return template.insert("walkpet.diaryinsert", map);
	}


	public List<PetDiaryDTO> insertafterview(Map<String, Object> map) {
		
		return template.selectList("walkpet.insertafterview", map);
	}


	public List<WishDTO> wishlist(String id) {
		
		return template.selectList("walkpet.wishlist", id);
	}


	public List<BoardDTO> boardlist(String id) {

		return template.selectList("walkpet.boardlist", id);
	}


	public List<ReviewDTO> reviewlist(String id) {

		return template.selectList("walkpet.reviewlist", id);
	}


	public List<NoteDTO> notelist(String id) {

		return template.selectList("walkpet.notelist", id);
	}


	public String getpetimg(String id) {

		return template.selectOne("walkpet.getpetimg", id);
	}


	public List<PetDTO> petinfolist(String id) {
		
		return template.selectList("walkpet.petinfolist", id);
	}


	public int petinfoinsert(Map<String, Object> map) {
		
		return template.update("walkpet.petinfoinsert", map);
	}
	
public List<PetDTO> getPet(String id) {
		
		return template.selectList("walkpet.getpet", id);
	}

	public MemberDTO findpw(MemberDTO dto) {
		
		return template.selectOne("walkpet.findpw", dto);
	}

	public MemberDTO findid(MemberDTO dto) {
		
		return template.selectOne("walkpet.findid", dto);
	}

	public int idCheck(String id) {
		
		return template.selectOne("walkpet.idcheck", id);
	}

	public int signup(MemberDTO dto) {
		
		return template.insert("walkpet.signup", dto);
	}

	public MemberDTO getMember(String id) {
		
		return template.selectOne("walkpet.getmember", id);
	}

	public List<ShopDTO> getCafe() {
		
		return template.selectList("walkpet.getcafe");
	}

	public List<ShopDTO> getFood() {
		
		return template.selectList("walkpet.getfood");
	}
	
	public List<ShopDTO> getShopping() {
		
		return template.selectList("walkpet.getshopping");
	}
	public List<ShopDTO> getBeauty() {
		
		return template.selectList("walkpet.getbeauty");
	}
	public List<ShopDTO> getRest() {
		
		return template.selectList("walkpet.getrest");
	}

	public List<MateDTO> getMate() {
		
		return template.selectList("walkpet.getmate");
	}

	public List<DiaryDTO> getDiary(String id) {
		// TODO Auto-generated method stub
		return template.selectList("walkpet.getdiary", id);
	}

	public List<NoteDTO> getNote(String id) {
		// TODO Auto-generated method stub
		return template.selectList("walkpet.getnote", id);
	}

	public List<Object> getLatLng(String area) {
		// TODO Auto-generated method stub
		return template.selectList("walkpet.getlatlng", area);
	}

	public List<AreaDTO> getSeoul() {
		// TODO Auto-generated method stub
		return template.selectList("walkpet.getseoul");
	}

	public List<AreaDTO> getGyeong() {
		// TODO Auto-generated method stub
		return template.selectList("walkpet.getgyeong");
	}

}
