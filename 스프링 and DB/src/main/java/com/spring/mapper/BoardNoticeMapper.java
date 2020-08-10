package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.service.BoardNoticeVO;

public interface BoardNoticeMapper {
	
	public int getBoardNoticeListCount();
	public List<BoardNoticeVO> getBoardNoticeList(HashMap<String, Integer> hashmap);	
	public int boardnoticeInsert(BoardNoticeVO boardnotice);       
	public int BoardNoticeDelete(int num);
	public int isBoardNoticeWriter(HashMap<String, String> hashmap);
	public BoardNoticeVO getBoardNoticeDetail(int num);
	public int boardnoticeModify(BoardNoticeVO modifyboardnotice); 
	public void setReadCountUpdate(int num);

}
