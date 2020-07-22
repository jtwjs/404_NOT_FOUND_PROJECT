package com.spring.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.spring.boardproduct.BoardProductVO;
import com.spring.seller.SellerVO;


@Repository
public interface SellerMapper {

	SellerVO selectOneById(String id);
	void InsertSellerAccout(SellerVO account);
	int DeleteSellerAccount(String id);
	void UpdateLoginDateBy(String id);
	ArrayList<BoardProductVO> selectProductListById(String id);

	int UpdateSellerAccount(SellerVO seller);
	int SellerConfirmPassword(SellerVO seller);
	int UpdateSellerPassword(SellerVO seller);
	

}
