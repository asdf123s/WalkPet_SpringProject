package com.test.walkpet.DAO;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.BoardDTO;
import com.test.walkpet.DTO.CommentDTO;
import com.test.walkpet.DTO.FileDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	

	@Override
	public List<BoardDTO> galary() {
		
		return template.selectList("board.galary");
		
	}

	@Override
	public int add(BoardDTO dto) {
		
		return template.insert("board.add", dto);
		
	}

	@Override
	public void addFile(FileDTO fdto) {
		
		template.insert("board.addFile", fdto);	
		
	}

	@Override
	public List<BoardDTO> dogBoard() {
		
		return template.selectList("board.dogBoard");

	}

	@Override
	public List<BoardDTO> catBoard() {
		
		return template.selectList("board.catBoard");
		
	}

	@Override
	public List<BoardDTO> friendsBoard() {
		
		return template.selectList("board.friendsBoard");
		
	}

	@Override
	public BoardDTO boardDetail(String boardSeq) {
		
		return template.selectOne("board.boardDetail", boardSeq);
		
	}

	
	 @Override public int commentAdd(CommentDTO dto) {
	 
		 return template.insert("board.commentAdd", dto); 
	 }

	@Override
	public List<CommentDTO> commentList(String boardSeq) {
		
		return template.selectList("board.commentList", boardSeq);
		
	}
	
	@Override
	public int del(String boardSeq) {
		
		return template.delete("board.del", boardSeq);
	}

	@Override
	public BoardDTO boardView(String boardSeq) {
		
		return template.selectOne("board.boardView", boardSeq);
		
	}

	

	 



	

}
