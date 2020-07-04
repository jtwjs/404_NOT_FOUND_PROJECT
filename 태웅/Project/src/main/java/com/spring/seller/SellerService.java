package com.spring.seller;



public interface SellerService {
	SellerVO selectOneById(String id);
	boolean duplicateCheck(String id);
	void RegisterSellerAccout(SellerVO seller);
	int UpdateSellerAccount(SellerVO seller);
	int DeleteSellerAccount(String id);
}
