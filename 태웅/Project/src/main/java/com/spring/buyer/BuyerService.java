package com.spring.buyer;

import java.util.ArrayList;

public interface BuyerService {

	public BuyerVO selectOnById(String id);
	public ArrayList<BuyerVO> selectListAll();
	public void RegisterBuyerAccount(BuyerVO buyer);
	public int UpdateBuyerAccount(BuyerVO buyer);
	public int DeleteBuyerAccount(String id);
    public int getWishListOverlapCheck(String board_id, String buyer_id);
    public int insertWishList(WishListVO vo);
    public ArrayList<deliveryVO> deliveryListAll(String id);
    public ArrayList<SavePointVO> savePointListAll(String id,String status,int rowStart, int rowEnd) throws Exception;
    public int listCount(String id, String status) throws Exception;
}
