package com.test.walkpet.DTO;

import java.util.List;

import lombok.Data;

@Data
public class PetDTO {

	private String petSeq;
	private String petType;
	private String id;
	private String petImgSeq;
	private String petName;
	private String petVar;
	private String petGender;
	private String petAge;
	private String petChar;

	private String petImgName;

	// 파일
	private String attach;

	private List<PetFileDTO> files;

}
