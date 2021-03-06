package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.buyer.BuyerVO;
import com.spring.buyer.SavePointVO;
import com.spring.buyer.deliveryVO;
@Repository
public interface BuyerMapper {
	public BuyerVO selectOneById(String id);
	public ArrayList<BuyerVO> selectListAll();
	public 	int selectCountById(String id);
	public void InsertBuyerAccount(BuyerVO buyer);
	public int DeleteBuyerAccount(String id);
	public void UpdateLoginDateBy(String id);	
	
	public void InsertSavePoint(@Param("id")String id,@Param("sp_status")String sp_status, @Param("savingDetails")String savingDetails,
				@Param("point")int point, @Param("board_title")String board_title,@Param("orderId")String orderId);
	public ArrayList<SavePointVO> savePointListAll(@Param("id")String id,@Param("status")String status,
													@Param("rowStart") int rowStart,@Param("rowEnd") int rowEnd);
	public int savePointCountById(@Param("id")String id, @Param("status")String status);
	public int UpdateBuyerAccount(BuyerVO buyer);
	public int BuyerConfirmPassword(BuyerVO buyer);
	public int UpdateBuyerPassword(BuyerVO buyer);
	public ArrayList<deliveryVO> deliveryListAll(String id);
	public int InsertListDeliveryList(deliveryVO delivery);
	public deliveryVO getListDeliveryDetail(@Param("id")String id, @Param("num")String num);
	public int ListDeliveryModify(deliveryVO deliver);	
	public int ListDeliveryDelete(@Param("id")String id, @Param("num")String num); 		
    public int isListDelivery(HashMap<String, String> hashmap);
    public int UpdateListDeliverList(deliveryVO delivery);      
    public deliveryVO getDefaultDeliveryList(String id);  
    public void UpdateDefaultAddress(@Param("id")String id,@Param("address")String address);
    public void BuyerGradeSetting(BuyerVO buyer);
  //구매자 회원 리스트
    public int getBuyerListCount();
    public List<BuyerVO> SelectAllMemberBuyerList(HashMap<String, Object> hashmap);
    public int AdminUpdateBuyerList(BuyerVO buyer);
    
    //구매자 비활성 회원 리스트
    public int getDelflagListCount();
    public List<BuyerVO> SelectAllDelflagList(HashMap<String, Object> hashmap);
    public int AdminUpdateBuyerDelflagList(BuyerVO buyer);
    
}
