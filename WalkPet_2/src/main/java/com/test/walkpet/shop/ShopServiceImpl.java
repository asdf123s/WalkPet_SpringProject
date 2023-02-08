package com.test.walkpet.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopDAO dao;

	@Override
	public ShopDTO getShop(String shopSeq) {
		return dao.getShop(shopSeq);
	}

	@Override
	public List<ReviewDTO> getReview(String shopSeq) {
		return dao.getReview(shopSeq);
	}
	
}
