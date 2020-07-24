package com.spring.admin;

import java.util.HashMap;
import java.util.List;

import com.spring.buyer.BuyerVO;
import com.spring.seller.SellerVO;

public interface AdminService {
	boolean duplicateCheck(String id);
	
	
	public AdminVO selectOneById(String id);
	
	public int getAllAccountCount();
	
	//구매자 회원 리스트
  	public int getBuyerListCount();
  	public List<BuyerVO> SelectAllMemberBuyerList(HashMap<String, Object> hashmap);
  	public int AdminUpdateBuyerList(BuyerVO buyer);
  	
    //구매자 비활성 회원 리스트 
    public int getDelflagListCount();
    public List<BuyerVO> SelectAllDelflagList(HashMap<String, Object> hashmap);
    public int AdminUpdateBuyerDelflagList(BuyerVO buyer);
    
    
    
    
    
    
    
//================= 기석 작업 ================================================  
    
  //판매자 회원 리스트
    public int  getSellerListCount();
    public List<SellerVO> SelectAllSellerList(HashMap<String, Object> hashmap);
    public int AdminUpdateSellerList(SellerVO seller);
    
  //판매자 비활성 회원 리스트
    public int getSellerDelflagListCount();    
    public List<SellerVO> SelectAllSellerDelflagList(HashMap<String, Object> hashmap);
    public int AdminUpdateSellerDelflagList(SellerVO seller);
	

}
