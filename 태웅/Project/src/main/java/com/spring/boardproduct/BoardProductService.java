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
    public int boardReadCountPlus(String board_id);
    public ArrayList<BoardProductVO> getBestBoardProductList();
    public ArrayList<BoardProductVO> getSearchBoardProductList(String keyword, int minCategory_1, 
    		int maxCategory_1, int minCategory_2, int maxCategory_2, int minCategory_local, 
    		int maxCategory_local, int min_price, int max_price, 
    		int sort_list, int page_num, int page_amount);
    
    
    public int checkReview(String board_id, String buyer_id, String order_id);
    public int getReviewTotNum();
    public int getReviewNum(String board_id);
    public int insertReview(BoardReviewVO vo);
    public ArrayList<BoardReviewVO> getBoardReviewList(String board_id, int page_num, int page_amount);
    public int updateSatisfaction(String board_id, double satisfaction);
    
    
    public int getReviewCommentNum(String review_id);
    public int insertReviewComment(CommentReviewVO vo);
    public CommentReviewVO[] getReviewComment(String review_id);
    public int deleteReviewComment(String review_id, int review_cmt_num);
    public double getAvgSatisfaction(String board_id);
    
    
    public int countReviewById(String buyer_id);
	public ArrayList<BoardReviewVO> boardReviewListAllById(String buyer_id,int rowStart,int rowEnd);
	
	
    
}
