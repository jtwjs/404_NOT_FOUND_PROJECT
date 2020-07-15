package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.buyer.WishListVO;

public interface WishListMapper {

	
	public int getWishListOverlapCheck(
			@Param("board_id")String board_id, @Param("buyer_id")String buyer_id);
	public int insertWishList(WishListVO vo);
}
