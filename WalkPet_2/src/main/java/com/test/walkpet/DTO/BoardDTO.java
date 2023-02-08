package com.test.walkpet.DTO;

import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {
	
	private String boardSeq;
	private String id;
	private String boardCategory;
	private String subject;
	private String content;
	private String regdate;
	private String viewCnt;
	private String imgName;
	
	private List<FileDTO> files;

}
