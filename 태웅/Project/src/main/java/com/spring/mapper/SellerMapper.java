package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
    public int  getSellerListCount();
    public List<SellerVO> SelectAllSellerList(HashMap<String, Object> hashmap);
    public int AdminUpdateSellerList(SellerVO seller);
	

}
