package com.spring.boardproduct;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BoardProductMapper;
import com.spring.mapper.BoardQnaMapper;
import com.spring.mapper.BoardReviewMapper;
import com.spring.mapper.CommentReviewMapper;

@Service("boardProductService")
public class BoardProductServiceImpl implements BoardProductService {

    @Autowired
    private SqlSession sqlSession;
	
    @Autowired
    private BoardReviewMapper mapper;
    
    @Autowired
    private BoardQnaMapper qnaMapper;
    
    public int getBoardNum() {
		
        BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
        int result = boardProductMapper.getBoardNum();
        
        return result;
    }
    
    public int insertBoardProduct(BoardProductVO vo) {
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
        int result = boardProductMapper.insertBoardProduct(vo);
        
        return result;
    }
    
    public BoardProductVO getBoardProductVO(String board_id) {
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
    	BoardProductVO vo = boardProductMapper.getBoardProductVO(board_id);
    	
    	return vo;
    }
    
    public ArrayList<BoardProductVO> getBoardList_category1(
    		int category_1, int sort_list, int page_num, int page_amount){
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
    	ArrayList<BoardProductVO> vo_list = new ArrayList<BoardProductVO>();
    	vo_list = boardProductMapper.getBoardList_category1(category_1, sort_list, page_num, page_amount);
    	
    	return vo_list;
    }
    
    public ArrayList<BoardProductVO> getBoardList_category2(
    		int category_2, int sort_list, int page_num, int page_amount){
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
    	ArrayList<BoardProductVO> vo_list = new ArrayList<BoardProductVO>();
    	vo_list = boardProductMapper.getBoardList_category2(category_2, sort_list, page_num, page_amount);
    	
    	return vo_list;
    }
    
    public ArrayList<BoardProductVO> getBoardList_categoryLocal(
    		int category_local, int sort_list, int page_num, int page_amount){
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
    	ArrayList<BoardProductVO> vo_list = new ArrayList<BoardProductVO>();
    	vo_list = boardProductMapper.getBoardList_categoryLocal(category_local, sort_list, page_num, page_amount);
    	
    	return vo_list;
    }
    
    public int getBoardListSize_1(int category_1) {
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
    	int result = boardProductMapper.getBoardListSize_1(category_1);
    	
    	return result;
    }
    
    public int getBoardListSize_2(int category_2) {
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
    	int result = boardProductMapper.getBoardListSize_2(category_2);
    	
    	return result;
    }

    public int getBoardListSize_local(int category_local) {
	
	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
	int result = boardProductMapper.getBoardListSize_local(category_local);
	
	return result;
}
    
 public int boardReadCountPlus(String board_id) {
    	
    	BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
	    int result = boardProductMapper.boardReadCountPlus(board_id);
	
	    return result;
    }
    
    
    
    // ---------------------------------------------------------------------------------------------
    public int checkReview(String board_id, String buyer_id, String order_id) {
    	
    	BoardReviewMapper boardReviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
	    int result = boardReviewMapper.checkReview(board_id, buyer_id, order_id);
	
	    return result;
    }
    
    public int getReviewTotNum() {
    	
    	BoardReviewMapper boardReviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
	    int result = boardReviewMapper.getReviewTotNum();
	
	    return result;
    }
    
    public int getReviewNum(String board_id) {
    	BoardReviewMapper boardReviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
	    int result = boardReviewMapper.getReviewNum(board_id);
	
	    return result;
    }
    
    public int insertReview(BoardReviewVO vo) {
    	
    	BoardReviewMapper boardReviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
	    int result = boardReviewMapper.insertReview(vo);
	
	    return result;
    }
    
    
    public int getReviewCommentNum(String review_id) {
    	
    	CommentReviewMapper commentReviewMapper = sqlSession.getMapper(CommentReviewMapper.class);
	    int result = commentReviewMapper.getReviewCommentNum(review_id);
	
	    return result;
    }
    
    public int insertReviewComment(CommentReviewVO vo) {
    	
    	CommentReviewMapper commentReviewMapper = sqlSession.getMapper(CommentReviewMapper.class);
    	int result = commentReviewMapper.insertReviewComment(vo);
	
	    return result;
    }
    
    public CommentReviewVO[] getReviewComment(String review_id) {
    	
    	CommentReviewMapper commentReviewMapper = sqlSession.getMapper(CommentReviewMapper.class);
    	CommentReviewVO[] result = commentReviewMapper.getReviewComment(review_id);
	
	    return result;
    }
    
    public int deleteReviewComment(String review_id, int review_cmt_num) {
    	
    	CommentReviewMapper commentReviewMapper = sqlSession.getMapper(CommentReviewMapper.class);
    	int result = commentReviewMapper.deleteReviewComment(review_id, review_cmt_num);
	
	    return result;
    }

	@Override
	public int countReviewById(String buyer_id) {
		int count = mapper.countReviewById(buyer_id);
		return count;
	}

	@Override
	public ArrayList<BoardReviewVO> boardReviewListAllById(String buyer_id, int rowStart, int rowEnd) {
		ArrayList<BoardReviewVO> list = mapper.boardReviewListAllById(buyer_id, rowStart, rowEnd);
		return list;
	}

	@Override
	 public ArrayList<BoardProductVO> getBestBoardProductList(){
   	 
   	 BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
   	 ArrayList<BoardProductVO> result = boardProductMapper.getBestBoardProductList();
	
	    return result;
   	 
    }

	@Override
	 public ArrayList<BoardProductVO> getSearchBoardProductList(String keyword, int minCategory_1, 
	     		int maxCategory_1, int minCategory_2, int maxCategory_2, int minCategory_local, 
	     		int maxCategory_local, int min_price, int max_price, 
	     		int sort_list, int page_num, int page_amount){
	    	 
	    	 BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
	    	 ArrayList<BoardProductVO> result 
	    	     = boardProductMapper.getSearchBoardProductList(keyword, minCategory_1, maxCategory_1, 
	    	    		 minCategory_2, maxCategory_2, minCategory_local, maxCategory_local, 
	    	    		 min_price, max_price, sort_list, page_num, page_amount);
	 	
	 	    return result;
	     }

	@Override
	 public ArrayList<BoardReviewVO> getBoardReviewList(String board_id, 
	    		int page_num, int page_amount) {
	    	
	    	BoardReviewMapper boardReviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
	    	ArrayList<BoardReviewVO> result 
	    	    = boardReviewMapper.getBoardReviewList(board_id, page_num, page_amount);
		
		    return result;
	    }

	@Override
	public int updateSatisfaction(String board_id, double satisfaction) {
     	
   	 BoardProductMapper boardReviewMapper = sqlSession.getMapper(BoardProductMapper.class);
	    int result = boardReviewMapper.updateSatisfaction(board_id, satisfaction);
	
	    return result;
    }

	@Override
  public double getAvgSatisfaction(String board_id) {
    	
    	BoardReviewMapper boardReviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
	    double result = boardReviewMapper.getAvgSatisfaction(board_id);
	
	    return result;
    }

	  public int insertQna(BoardQnaVO vo) {
	    	
	    	BoardQnaMapper boardQnaMapper = sqlSession.getMapper(BoardQnaMapper.class);
	    	int result = boardQnaMapper.insertQna(vo);
		
		    return result;
	    }
	    
	    public int getQnaNum(String board_id) {
	    	
	    	BoardQnaMapper boardQnaMapper = sqlSession.getMapper(BoardQnaMapper.class);
	    	int result = boardQnaMapper.getQnaNum(board_id);
		
		    return result;
	    }
	    
	    public ArrayList<BoardQnaVO> getBoardQnaList(String board_id, int qna_status, 
	    		int answer_status, int page_num, int page_amount, String keyword){
	    	
	    	BoardQnaMapper boardQnaMapper = sqlSession.getMapper(BoardQnaMapper.class);
	    	ArrayList<BoardQnaVO> result = boardQnaMapper.getBoardQnaList(
	    			board_id, qna_status, answer_status, page_num, page_amount, keyword);
		
	    	
		    return result;
	    }
	    
	    public int getBoardQnaListCount(String board_id, int qna_status, 
	    		int answer_status, String keyword){
	    	
	    	BoardQnaMapper boardQnaMapper = sqlSession.getMapper(BoardQnaMapper.class);
	    	int result = boardQnaMapper.getBoardQnaListCount(
	    			board_id, qna_status, answer_status, keyword);
	    	
		    return result;
	    }
	    
	    public int getCountQna(String board_id) {
	    	
	    	BoardQnaMapper boardQnaMapper = sqlSession.getMapper(BoardQnaMapper.class);
	    	int result = boardQnaMapper.getCountQna(board_id);
		
		    return result;
	    }
	    
	    public int insertQnaRecommend(String board_id, String seller_id, int qna_num, String recommend) {
	    	
	    	BoardQnaMapper boardQnaMapper = sqlSession.getMapper(BoardQnaMapper.class);
	    	int result = boardQnaMapper.insertQnaRecommend(board_id, seller_id, qna_num, recommend);
		
		    return result;
	    }

		@Override
		public ArrayList<BoardQnaVO> qnaListAllById(String id, int rowStart, int rowEnd,String startDate,String endDate) {
			ArrayList<BoardQnaVO> list = qnaMapper.qnaListAllById(id, rowStart, rowEnd,startDate, endDate);
			return list;
		}

		@Override
		public int qnaCountById(String id,String startDate, String endDate) {
			int count = qnaMapper.qnaCountById(id,startDate,endDate);
			return count;
		}
		
		@Override
	   public ArrayList<BoardProductVO> getSellerBestList(String seller_id, String board_id){
		    	 
    	 BoardProductMapper boardProductMapper = sqlSession.getMapper(BoardProductMapper.class);
    	 ArrayList<BoardProductVO> result 
    	     = boardProductMapper.getSellerBestList(seller_id, board_id);
 	    return result;
     }
	    
    
}
