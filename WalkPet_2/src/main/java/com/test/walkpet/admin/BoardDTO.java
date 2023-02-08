package com.test.walkpet.admin;

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
	
	
}
