package com.spring.boardproduct;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BoardProductMapper;

@Service("boardProductService")
public class BoardProductServiceImpl implements BoardProductService {

    @Autowired
    private SqlSession sqlSession;
	
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
}
