package com.spring.seller;

import java.util.ArrayList;

import com.spring.boardproduct.BoardProductVO;

public interface SellerService {
	SellerVO selectOneById(String id);
	boolean duplicateCheck(String id);
	void RegisterSellerAccout(SellerVO seller);
	int UpdateSellerAccount(SellerVO seller);
	int DeleteSellerAccount(String id);
	void UpdateProfileImg(SellerVO account);
	ArrayList<BoardProductVO> selectProductListById(String id);
}
