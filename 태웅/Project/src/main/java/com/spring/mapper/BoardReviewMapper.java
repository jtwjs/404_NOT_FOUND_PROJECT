package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.boardproduct.BoardReviewVO;

@Repository
public interface BoardReviewMapper {

	public int checkReview(@Param("board_id") String board_id, @Param("buyer_id") String buyer_id,
			@Param("order_id") String order_id);

	public int getReviewTotNum();

	public int getReviewNum(String board_id);

	public int insertReview(BoardReviewVO vo);

	public ArrayList<BoardReviewVO> getBoardReviewList(@Param("board_id") String board_id,
			@Param("page_num") int page_num, @Param("page_amount") int page_amount);

	public int countReviewById(String buyer_id);

	public ArrayList<BoardReviewVO> boardReviewListAllById(@Param("buyer_id") String buyer_id,
			@Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);

	public double getAvgSatisfaction(String board_id);

	// 관리자 댓글 관리 페이지
	public int getAdminBoardReviewCount();

	public List<BoardReviewVO> SelectAdminBoardReviewAllList(HashMap<String, Object> hashmap);

	// 댓글 삭제
	public int AdminBoardReviewDelete(int review_num);

	public int isAdminBoardReviewList(HashMap<String, String> hashmap);
}
