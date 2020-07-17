package com.spring.buyer;

import java.util.ArrayList;
import java.util.HashMap;

public interface BuyerService {

	public BuyerVO selectOneById(String id);
	public ArrayList<BuyerVO> selectListAll();
	public void RegisterBuyerAccount(BuyerVO buyer);
	public int UpdateBuyerAccount(BuyerVO buyer);
	public int DeleteBuyerAccount(String id);
    public int getWishListOverlapCheck(String board_id, String buyer_id);
    public int insertWishList(WishListVO vo);
    public ArrayList<deliveryVO> deliveryListAll(String id);
    public ArrayList<SavePointVO> savePointListAll(String id,String status,int rowStart, int rowEnd) throws Exception;
    public int listCount(String id, String status) throws Exception;
    public int InsertListDeliveryList(deliveryVO delivery);
    public deliveryVO getListDeliveryDetail(int num);
    public deliveryVO ListDeliveryModifyForm(int num);
    public int ListDeliveryModify(deliveryVO delivery);
    public int ListDeliveryDelete(HashMap<String, String> hashmap);
    public int UpdateListDeliverList(deliveryVO delivery);
//    public deliveryVO getDefaultAddressOneById(String id);
    
}
