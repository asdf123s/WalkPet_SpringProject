package com.test.walkpet.admin;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<MemberDTO> memberList() {
		return template.selectList("admin.memberList");
	}

	@Override
	public MemberDTO memberDetail(String id) {
		return template.selectOne("admin.memberDetail", id);
	}

	@Override
	public List<PetDTO> petList(String id) {
		return template.selectList("admin.petList", id);
	}

	@Override
	public int userDel(String id) {
		return template.update("admin.userDel", id);
	}

	@Override
	public List<BoardImgDTO> boardImgList() {
		return template.selectList("admin.boardImgList");
	}

	@Override
	public BoardDTO getBoard(String boardSeq) {
		return template.selectOne("admin.getBoard", boardSeq);
	}

	@Override
	public int boardDel(String boardSeq) {
		return template.delete("admin.boardDel", boardSeq);
	}

	@Override
	public int getBoardTotalcount(String boardCategory) {
		return template.selectOne("admin.boardCount", boardCategory);
	}

	@Override
	public List<BoardDTO> boardList(HashMap<String, String> map) {
		return template.selectList("admin.boardList", map);
	}

	@Override
	public List<BoardDTO> boardSearchList(HashMap<String, String> map) {
		return template.selectList("admin.boardSearchList", map);
	}

	@Override
	public List<MemberDTO> loginlist(AdminDTO dto) {
		return template.selectList("admin.login", dto);
	}

	@Override
	public List<BoardDTO> indexBoardList() {
		return template.selectList("admin.indexBoardList");
	}
	
}
