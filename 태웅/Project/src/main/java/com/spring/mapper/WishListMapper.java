package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.spring.buyer.WishListVO;

public interface WishListMapper {

	
	public int getWishListOverlapCheck(
			@Param("board_id")String board_id, @Param("buyer_id")String buyer_id);
	public int insertWishList(WishListVO vo);
	public ArrayList<WishListVO> selectWishList(@Param("buyer_id")String buyer_id, 
			@Param("sort_list")int sort_list, 
			@Param("page_num")int page_num, 
			@Param("page_amount")int page_amount);
	public int selectWishListCountOneById(String buyer_id);
	public int deleteWishList(String wish_id);
	public int isWishListWriter(HashMap<String, String> hashmap);
}
