package com.test.walkpet.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.walkpet.DTO.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<MemberDTO> memberList() {
		return adminDAO.memberList();
	}

	@Override
	public MemberDTO memberDetail(String id) {
		return adminDAO.memberDetail(id);
	}

	@Override
	public List<PetDTO> petList(String id) {
		return adminDAO.petList(id);
	}

	@Override
	public int userDel(String id) {
		return adminDAO.userDel(id);
	}


	@Override
	public List<BoardImgDTO> boardImgList() {
		return adminDAO.boardImgList();
	}

	@Override
	public BoardDTO getBoard(String boardSeq) {
		return adminDAO.getBoard(boardSeq);
	}

	@Override
	public int boardDel(String boardSeq) {
		return adminDAO.boardDel(boardSeq);
	}

	@Override
	public int getBoardTotalCount(String boardCategory) {
		return adminDAO.getBoardTotalcount(boardCategory);
	}

	@Override
	public List<BoardDTO> boardList(HashMap<String, String> map) {
		return adminDAO.boardList(map);
	}

	@Override
	public List<BoardDTO> boardSearchList(HashMap<String, String> map) {
		return adminDAO.boardSearchList(map);
	}

	@Override
	public List<MemberDTO> loginlist(AdminDTO dto) {
		return adminDAO.loginlist(dto);
	}

	@Override
	public List<BoardDTO> indexBoardList() {
		return adminDAO.indexBoardList();
	}

	
	
}
