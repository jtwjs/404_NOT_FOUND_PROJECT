package com.spring.buyer;

import java.util.ArrayList;

public interface BuyerService {

	BuyerVO selectOnById(String id);
	ArrayList<BuyerVO> selectListAll();
	boolean duplicateCheck(String id);
	void RegisterBuyerAccount(BuyerVO buyer);
	int UpdateBuyerAccount(BuyerVO buyer);
	int DeleteBuyerAccount(String id);
    public int getWishListOverlapCheck(String board_id, String buyer_id);
    public int insertWishList(WishListVO vo);
    ArrayList<deliveryVO> deliveryListAll(String id);
}
