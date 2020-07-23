package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.boardproduct.BoardProductVO;
@Repository
public interface BoardProductMapper {

    public int getBoardNum();
    public int insertBoardProduct(BoardProductVO vo);
    public BoardProductVO getBoardProductVO(String board_id);
    public ArrayList<BoardProductVO> getBoardList_category1(
    		@Param("category_1")int category_1, @Param("sort_list")int sort_list, 
    		@Param("page_num")int page_num, @Param("page_amount")int page_amount);
    public ArrayList<BoardProductVO> getBoardList_category2(
    		@Param("category_2")int category_1, @Param("sort_list")int sort_list, 
    		@Param("page_num")int page_num, @Param("page_amount")int page_amount);
    public ArrayList<BoardProductVO> getBoardList_categoryLocal(
    		@Param("category_local")int category_local, @Param("sort_list")int sort_list, 
    		@Param("page_num")int page_num, @Param("page_amount")int page_amount);
    public int getBoardListSize_1(int category_1);
    public int getBoardListSize_2(int category_2);
    public int getBoardListSize_local(int category_local);
    public int boardReadCountPlus(String board_id);
}
