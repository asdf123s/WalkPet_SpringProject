package com.test.walkpet.annotation;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.test.walkpet.DTO.MemberDTO;
import com.test.walkpet.admin.BoardDTO;

public interface AdminInterfaceDAO {
	
	@Select("select * from tblMember")
	List<MemberDTO> memberList();
	
	
	@Select("select * from tblBoard order by regdate desc")
	List<BoardDTO> indexBoardList();	
	

}
