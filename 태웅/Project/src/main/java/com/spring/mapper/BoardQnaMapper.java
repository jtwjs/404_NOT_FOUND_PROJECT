package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.boardproduct.BoardQnaVO;

public interface BoardQnaMapper {

	public int insertQna(BoardQnaVO vo);
	public int getQnaNum(String board_id);
	public ArrayList<BoardQnaVO> getBoardQnaList(@Param("board_id")String board_id, 
			@Param("qna_status")int qna_status, @Param("answer_status")int answer_status, 
			@Param("page_num")int page_num, @Param("page_amount")int page_amount, 
			@Param("keyword")String keyword);
	public int getBoardQnaListCount(@Param("board_id")String board_id, 
			@Param("qna_status")int qna_status, @Param("answer_status")int answer_status, 
			@Param("keyword")String keyword);
	public int getCountQna(String board_id);
	public int insertQnaRecommend(@Param("board_id")String board_id, 
			@Param("seller_id")String seller_id, @Param("qna_num")int qna_num, 
			@Param("recommend")String recommend);
	public ArrayList<BoardQnaVO> qnaListAllById(@Param("id")String id,@Param("rowStart")int rowStart,
			@Param("rowEnd")int rowEnd,@Param("startDate")String startDate,@Param("endDate")String endDate);
	public int qnaCountById(@Param("id")String id,@Param("startDate")String startDate,@Param("endDate")String endDate);
}
	