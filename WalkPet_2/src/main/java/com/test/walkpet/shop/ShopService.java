package com.test.walkpet.shop;

import java.util.List;

public interface ShopService {

	ShopDTO getShop(String shopSeq);

	List<ReviewDTO> getReview(String seq);

}
