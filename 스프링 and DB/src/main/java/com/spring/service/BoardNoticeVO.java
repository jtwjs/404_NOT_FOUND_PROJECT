package com.spring.service;

import java.sql.Date;

public class BoardNoticeVO {      // 고객센터 공지사항	

	private int num;
    private String title;         // 공지사항 제목
    private String content;       // 공지사항 글내용
    private int hit;              // 조회수
    private Date register_date;   // 공지사항 등록일
    
    
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
    
    
    
}