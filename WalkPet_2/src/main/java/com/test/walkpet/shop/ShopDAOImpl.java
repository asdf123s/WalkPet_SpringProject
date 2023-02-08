package com.test.walkpet.shop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDAOImpl implements ShopDAO{
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public ShopDTO getShop(String shopSeq) {
		return template.selectOne("shop.getShop", shopSeq);
	}

	@Override
	public List<ReviewDTO> getReview(String shopSeq) {
		return template.selectList("shop.getReview", shopSeq);
	}
	
}
