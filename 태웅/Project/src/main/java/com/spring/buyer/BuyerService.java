package com.spring.buyer;

import org.springframework.stereotype.Service;

public interface BuyerService {

	BuyerVO selectOnById(String id);
	boolean duplicateCheck(String id);
	void RegisterBuyerAccount(BuyerVO buyer);
	int UpdateBuyerAccount(BuyerVO buyer);
	int DeleteBuyerAccount(String id); 
}
