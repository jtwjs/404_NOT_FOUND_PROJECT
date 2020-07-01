package com.spring.mapper;

import org.springframework.stereotype.Repository;

import com.spring.buyer.BuyerVO;
@Repository
public interface BuyerMapper {
	BuyerVO selectOneById(String id);
	void InsertBuyerAccount(BuyerVO buyer);
	int UpdateBuyerAccount(BuyerVO buyer);
	int DeleteBuyerAccount(String id);
	
}
