package com.test.walkpet.admin;

import java.util.HashMap;
import java.util.List;

import com.test.walkpet.DTO.MemberDTO;

public interface AdminService {

	List<MemberDTO> memberList();

	MemberDTO memberDetail(String id);

	List<PetDTO> petList(String id);

	int userDel(String id);

	List<BoardImgDTO> boardImgList();

	BoardDTO getBoard(String boardSeq);

	int boardDel(String seq);

	int getBoardTotalCount(String boardCategory);

	List<BoardDTO> boardList(HashMap<String, String> map);

	List<BoardDTO> boardSearchList(HashMap<String, String> map);

	List<MemberDTO> loginlist(AdminDTO dto);

	List<BoardDTO> indexBoardList();

	

}
