package com.spring.buyer;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface BuyerService {

	public BuyerVO selectOneById(String id);
	public ArrayList<BuyerVO> selectListAll();
	public void RegisterBuyerAccount(BuyerVO buyer);
	public int UpdateBuyerAccount(BuyerVO buyer);
	public void BuyerGradeSetting(BuyerVO buyer);
	public int DeleteBuyerAccount(String id);
    public int getWishListOverlapCheck(String board_id, String buyer_id);
    public int insertWishList(WishListVO vo);
   
    public void InsertSavePoint(String id,String sp_status, String savingDetails, int point, String board_title,String orderId);
    public ArrayList<SavePointVO> savePointListAll(String id,String status,int rowStart, int rowEnd) throws Exception;
    public int listCount(String id, String status) throws Exception;

    public int selectWishListCountOneById(String buyer_id);
    public ArrayList<WishListVO> selectWishList(String buyer_id, int sort_list, int page_num, int page_amount);
    public int deleteWishList(HashMap<String, String> hashmap);
    public ArrayList<deliveryVO> deliveryListAll(String id);
    public int InsertListDeliveryList(deliveryVO delivery);
    public deliveryVO getListDeliveryDetail(int num);    
    public deliveryVO ListDeliveryModifyForm(int num);    
    public int ListDeliveryModify(deliveryVO delivery);
    public int ListDeliveryDelete(HashMap<String, String> hashmap);
    public int UpdateListDeliverList(deliveryVO delivery);    
    public deliveryVO getDefaultDeliveryList(String id);  
    public void UpdateDefaultAddress(BuyerVO buyer);
    
    
}
