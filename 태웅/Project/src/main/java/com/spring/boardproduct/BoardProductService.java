package com.spring.boardproduct;

import java.util.ArrayList;

public interface BoardProductService {

    public int getBoardNum();
    public int insertBoardProduct(BoardProductVO vo);
    public BoardProductVO getBoardProductVO(String board_id);
    public ArrayList<BoardProductVO> getBoardList_category1(
    		int category_1, int sort_list, int page_num, int page_amount);
    public ArrayList<BoardProductVO> getBoardList_category2(
    		int category_2, int sort_list, int page_num, int page_amount);
    public ArrayList<BoardProductVO> getBoardList_categoryLocal(
    		int category_local, int sort_list, int page_num, int page_amount);
    public int getBoardListSize_1(int category_1);
    public int getBoardListSize_2(int category_2);
    public int getBoardListSize_local(int category_local);
}
