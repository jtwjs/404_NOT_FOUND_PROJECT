package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
    public int updateSatisfaction(
    		@Param("board_id")String board_id, @Param("satisfaction")double satisfaction);
    public ArrayList<BoardProductVO> getBestBoardProductList();
    public ArrayList<BoardProductVO> getSearchBoardProductList(@Param("keyword")String keyword, 
    		@Param("minCategory_1")int minCategory_1, @Param("maxCategory_1")int maxCategory_1, 
    		@Param("minCategory_2")int minCategory_2, @Param("maxCategory_2")int maxCategory_2, 
    		@Param("minCategory_local")int minCategory_local, 
    		@Param("maxCategory_local")int maxCategory_local, @Param("min_price")int min_price, 
    		@Param("max_price")int max_price, @Param("sort_list")int sort_list, 
    		@Param("page_num")int page_num, @Param("page_amount")int page_amount);
    //관리자 게시판 관리 페이지     
    public int getAdminBoardProductCount();
    public List<BoardProductVO> SelectAdminBoardAllList(HashMap<String, Object> hashmap);
    
    //삭제기능
    public int AdminBoardProductDelete(int board_num); 	
    public int isAdminBoardList(HashMap<String, String> hashmap);
    
    
    
}
