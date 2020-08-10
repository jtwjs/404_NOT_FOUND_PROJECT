package com.spring.service;

import java.util.HashMap;
import java.util.List;

public interface ServiceService {

	public int getFaqListCount();
	public List<BoardFaqVO> getFaqBoardList(HashMap<String, Integer> hashmap);
	public int faqBoardInsert(BoardFaqVO board);
    	public int faqBoardDelete(HashMap<String, String> hashmap);
    	public BoardFaqVO getFaqDetail(int num);
    	public BoardFaqVO faqBoardModifyForm(int num);
	public int faqBoardModify(BoardFaqVO modifyboard);

	

	public int getBoardNoticeListCount();
	public List<BoardNoticeVO> getBoardNoticeList(HashMap<String, Integer> hashmap);
	public int boardnoticeInsert(BoardNoticeVO boardnotice);
	public BoardNoticeVO getBoardNoticeDetail(int num);
	public int boardnoticeDelete(HashMap<String, String> hashmap);	
	public BoardNoticeVO boardnoticeModifyForm(int num);
	public int boardnoticeModify(BoardNoticeVO modifyboardnotice);

	
}
