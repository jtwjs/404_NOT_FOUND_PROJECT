package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.boardproduct.BoardReviewVO;

public interface BoardReviewMapper {

	public int checkReview(@Param("board_id")String board_id, 
			@Param("buyer_id")String buyer_id, @Param("order_id")String order_id);
	public int getReviewTotNum();
	public int getReviewNum(String board_id);
	public int insertReview(BoardReviewVO vo);
	public ArrayList<BoardReviewVO> getBoardReviewList(String board_id);
}
