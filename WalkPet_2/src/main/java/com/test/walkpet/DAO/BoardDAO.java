package com.test.walkpet.DAO;

import java.util.List;

import com.test.walkpet.DTO.BoardDTO;
import com.test.walkpet.DTO.CommentDTO;
import com.test.walkpet.DTO.FileDTO;

public interface BoardDAO {

	int add(BoardDTO dto);

	List<BoardDTO> galary();

	void addFile(FileDTO fdto);

	List<BoardDTO> dogBoard();

	List<BoardDTO> catBoard();

	List<BoardDTO> friendsBoard();

	BoardDTO boardDetail(String boardSeq);

	int commentAdd(CommentDTO dto);

	List<CommentDTO> commentList(String boardSeq);

	int del(String boardSeq);

	BoardDTO boardView(String boardSeq);
	
	
	 
	 

}
