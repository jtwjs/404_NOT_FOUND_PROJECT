package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BoardFaqMapper;
import com.spring.mapper.BoardNoticeMapper;

@Service("serviceService")
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private SqlSession sqlSession;
	
	
	
	
	@Override
	public int getFaqListCount() {
		BoardFaqMapper boardFaqMapper = sqlSession.getMapper(BoardFaqMapper.class);
		int res = boardFaqMapper.getFaqListCount();
		return res;
	}
	
	@Override
	public List<BoardFaqVO> getFaqBoardList(HashMap<String, Integer> hashmap) {
		BoardFaqMapper boardFaqMapper = sqlSession.getMapper(BoardFaqMapper.class);
		
		List<BoardFaqVO> faqboardlist = boardFaqMapper.getFaqBoardList(hashmap);
		return faqboardlist;
	}
	
	@Override
	public int faqBoardInsert(BoardFaqVO board) {
		BoardFaqMapper boardFaqMapper = sqlSession.getMapper(BoardFaqMapper.class);
		int res = boardFaqMapper.faqBoardInsert(board);
		
		System.out.println("serviceImpl: " + board.getNum());
		System.out.println("serviceImpl: " + board.getTitle());
		System.out.println("serviceImpl: " + board.getContent());
		
		return res;
	}

	@Override
	public int faqBoardDelete(HashMap<String, String> hashmap) {
		BoardFaqMapper boardFaqMapper = sqlSession.getMapper(BoardFaqMapper.class);
		int res =  boardFaqMapper.isFaqBoardWriter(hashmap);
		int num = Integer.parseInt(hashmap.get("num"));
		if (res == 1) {
			res =  boardFaqMapper.faqBoardDelete(num);
		}
		return res;
	}
	
	@Override
	public BoardFaqVO getFaqDetail(int num) {
		BoardFaqMapper boardFaqMapper = sqlSession.getMapper(BoardFaqMapper.class);
		BoardFaqVO board = boardFaqMapper.getFaqDetail(num);
		return board;
	}
	
	@Override
	public BoardFaqVO faqBoardModifyForm(int num) {
		BoardFaqMapper boardFaqMapper = sqlSession.getMapper(BoardFaqMapper.class);
		BoardFaqVO board = boardFaqMapper.getFaqDetail(num);
		return board;
	}
	
	@Override
	public int faqBoardModify(BoardFaqVO modifyboard) {
		BoardFaqMapper boardFaqMapper = sqlSession.getMapper(BoardFaqMapper.class);
		int res =  boardFaqMapper.faqBoardModify(modifyboard);
		return res;
	}

	@Override
	public int getBoardNoticeListCount() {
		BoardNoticeMapper boardnoticeMapper = sqlSession.getMapper(BoardNoticeMapper.class);
		int res = boardnoticeMapper.getBoardNoticeListCount();
		return res;
	}	


	@Override
	public List<BoardNoticeVO> getBoardNoticeList(HashMap<String, Integer> hashmap) {
		BoardNoticeMapper boardnoticeMapper = sqlSession.getMapper(BoardNoticeMapper.class);
		
		List<BoardNoticeVO> boardNoticelist = boardnoticeMapper.getBoardNoticeList(hashmap);
		return boardNoticelist;
	}
	
	@Override
	public int boardnoticeInsert(BoardNoticeVO boardnotice) {
		BoardNoticeMapper boardnoticeMapper = sqlSession.getMapper(BoardNoticeMapper.class);
		int res = boardnoticeMapper.boardnoticeInsert(boardnotice);
		
		System.out.println("serviceImpl: " + boardnotice.getNum());
		System.out.println("serviceImpl: " + boardnotice.getTitle());
		System.out.println("serviceImpl: " + boardnotice.getContent());
		System.out.println("serviceImpl: " + boardnotice.getHit());
		System.out.println("serviceImpl: " + boardnotice.getRegister_date());
		
		return res;
	}
	

	@Override
	public BoardNoticeVO getBoardNoticeDetail(int num) {
		BoardNoticeMapper boardnoticeMapper = sqlSession.getMapper(BoardNoticeMapper.class);
		boardnoticeMapper.setReadCountUpdate(num);
		BoardNoticeVO boardnotice = boardnoticeMapper.getBoardNoticeDetail(num);
		
		return boardnotice;
	}



	@Override
	public BoardNoticeVO boardnoticeModifyForm(int num) {
		BoardNoticeMapper boardnoticeMapper = sqlSession.getMapper(BoardNoticeMapper.class);
		BoardNoticeVO boardnotice = boardnoticeMapper.getBoardNoticeDetail(num);
		return boardnotice;
	}

	@Override
	public int boardnoticeModify(BoardNoticeVO modifyboardnotice) {
		BoardNoticeMapper boardnoticeMapper = sqlSession.getMapper(BoardNoticeMapper.class);
		int res =  boardnoticeMapper.boardnoticeModify(modifyboardnotice);
		return res;
	}

	@Override
	public int boardnoticeDelete(HashMap<String, String> hashmap) {
		BoardNoticeMapper boardnoticeMapper = sqlSession.getMapper(BoardNoticeMapper.class);
		int res =  boardnoticeMapper.isBoardNoticeWriter(hashmap);
		int num = Integer.parseInt(hashmap.get("num"));
		if (res == 1) {
			res =  boardnoticeMapper.BoardNoticeDelete(num);
		}
		return res;
	}
}
