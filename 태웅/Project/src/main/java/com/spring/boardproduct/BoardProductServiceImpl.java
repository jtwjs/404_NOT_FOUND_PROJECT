package com.spring.boardproduct;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BoardProductMapper;
import com.spring.mapper.BoardReviewMapper;
import com.spring.mapper.CommentReviewMapper;

@Service("boardProductService")
public class BoardProductServiceImpl implements BoardProductService {

    @Autowired
    private SqlSession sqlSession;
	
    @Autowired
    private BoardReviewMapper mapper;
    
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
    
    public ArrayList<BoardReviewVO> getBoardReviewList(String board_id) {
    	
    	BoardReviewMapper boardReviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
    	ArrayList<BoardReviewVO> result = boardReviewMapper.getBoardReviewList(board_id);
	
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


    
    
}
