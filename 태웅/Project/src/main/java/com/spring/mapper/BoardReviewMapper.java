package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.boardproduct.BoardReviewVO;

@Repository
public interface BoardReviewMapper {

	public int checkReview(@Param("board_id")String board_id, 
			@Param("buyer_id")String buyer_id, @Param("order_id")String order_id);
	public int getReviewTotNum();
	public int getReviewNum(String board_id);
	public int insertReview(BoardReviewVO vo);
	public ArrayList<BoardReviewVO> getBoardReviewList(String board_id);
	public int countReviewById(String buyer_id);
	public ArrayList<BoardReviewVO> boardReviewListAllById(@Param("buyer_id")String buyer_id,
			@Param("rowStart")int rowStart, @Param("rowEnd")int rowEnd);
}
