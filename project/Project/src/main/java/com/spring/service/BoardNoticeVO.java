package com.spring.service;

import java.util.Date;

public class BoardNoticeVO {      // 고객센터 공지사항

    private String notice_id;     // 공지사항 게시글 ID (기본키)
    private String title;         // 공지사항 제목
    private String content;       // 공지사항 글내용
    private Date register_date;   // 공지사항 등록일
    private int hit;              // 조회수
    
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
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
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
