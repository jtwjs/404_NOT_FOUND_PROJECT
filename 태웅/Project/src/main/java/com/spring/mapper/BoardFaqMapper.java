package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.service.BoardFaqVO;

public interface BoardFaqMapper {
	public int getFaqListCount();
	public List<BoardFaqVO> getFaqBoardList(HashMap<String, Integer> hashmap);
	public int faqBoardInsert(BoardFaqVO board); 
	public int faqBoardDelete(int num);
	public int isFaqBoardWriter(HashMap<String, String> hashmap);
	public BoardFaqVO getFaqDetail(int num);
	public int faqBoardModify(BoardFaqVO modifyboard);
}
