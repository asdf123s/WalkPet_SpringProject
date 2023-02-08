package com.test.walkpet.shop;

import java.util.List;

public interface ShopDAO {

	ShopDTO getShop(String shopSeq);

	List<ReviewDTO> getReview(String shopSeq);

}
