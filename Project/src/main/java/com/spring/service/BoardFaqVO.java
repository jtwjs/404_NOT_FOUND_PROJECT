package com.spring.service;

import java.sql.Date;

public class BoardFaqVO {    // 자주묻는질문 게시판

    private int num;		 // 리스트 번호
    private String title;    // 게시판 제목
    private String content;  // 게시판 내용
    
    private Date boarddate;
    
    
    public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	
}
