package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.boardproduct.BoardProductVO;
import com.spring.buyer.BuyerVO;
import com.spring.buyer.WishListVO;
import com.spring.buyer.deliveryVO;
@Repository
public interface BuyerMapper {
	BuyerVO selectOneById(String id);
	ArrayList<BuyerVO> selectListAll();
	int selectCountById(String id);
	void InsertBuyerAccount(BuyerVO buyer);
	int UpdateBuyerAccount(BuyerVO buyer);
	int DeleteBuyerAccount(String id);
	void UpdateLoginDateBy(String id);
	
	
	
	
	ArrayList<deliveryVO> deliveryListAll(String id);
}
