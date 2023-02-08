package com.test.walkpet.DTO;

import java.util.List;

import lombok.Data;

@Data
public class MateDTO {

	//동반인
	private String mateSeq;
	private String id;
	private String mateSubject;
	private String mateContent;
	private String regdate;
	private String periodState;
	private String startDate;
	private String endDate;
	private String areaName;
	
	private String attach;
	private List<String> files;
	
	//태그-동반인
	private String tagMateSeq;
	private String tagSeq;
	
	//태그
	private String tagName;
	
	private String petImgName;
	
	
	private String petSeq;
	private String petType;
	private String petName;
	private String petVar;
	private String petGender;
	private String petAge;
	private String petChar;
}
