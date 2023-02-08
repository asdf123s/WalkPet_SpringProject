package com.test.walkpet;

public class Dummy {
	
	public static void main(String[] args) {
		
		int n = 1;
		
		for(int i=1; i<=98; i++) {
			for(int j=1; j<=3; j++) {
				System.out.printf("insert into tblShopImg (shopimgSeq, shopImgImage, shopSeq) values (shopimgseq.nextVal, 'shop_%d_%d.jpeg', %d); \n", n, j, n);
			}
			n++;
		}
		
		
	}

}
