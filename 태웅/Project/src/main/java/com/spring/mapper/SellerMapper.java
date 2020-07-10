package com.spring.mapper;

import org.springframework.stereotype.Repository;

import com.spring.seller.SellerVO;


@Repository
public interface SellerMapper {

	SellerVO selectOneById(String id);
	int selectCountById(String id);
	void InsertSellerAccout(SellerVO buyer);
	int UpdateSellerAccount(SellerVO buyer);
	int DeleteSellerAccount(String id);
	void UpdateLoginDateBy(String id);
}
