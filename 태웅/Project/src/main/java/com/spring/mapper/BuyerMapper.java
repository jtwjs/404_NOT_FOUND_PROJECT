package com.spring.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.spring.buyer.BuyerVO;
@Repository
public interface BuyerMapper {
	BuyerVO selectOneById(String id);
	ArrayList<BuyerVO> selectListAll();
	int selectCountById(String id);
	void InsertBuyerAccount(BuyerVO buyer);
	int UpdateBuyerAccount(BuyerVO buyer);
	int DeleteBuyerAccount(String id);
	
}
