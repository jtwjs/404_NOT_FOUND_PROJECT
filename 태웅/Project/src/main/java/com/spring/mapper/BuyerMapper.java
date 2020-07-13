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
	
	
	public int getWishListOverlapCheck(
			@Param("board_id")String board_id, @Param("buyer_id")String buyer_id);
	public int insertWishList(WishListVO vo);
	
	ArrayList<deliveryVO> deliveryListAll(String id);
}
