package com.test.walkpet.shop;

import lombok.Data;

@Data
public class ReviewDTO {
	private String reviewSeq;
	private String shopSeq;
	private String reviewContent;
	private String reviewImg;
	private String reviewLike;
	private String regdate;
	private String id;
}
