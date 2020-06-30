package com.spring.service;

public class BoardFaqVO {    // 자주묻는질문 게시판

    private String faq_id;   // 게시판 등록 ID (기본키)
    private String title;    // 게시판 제목
    private String content;  // 게시판 내용
    private char sortation;  // 분류
    
	public String getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(String faq_id) {
		this.faq_id = faq_id;
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
	public char getSortation() {
		return sortation;
	}
	public void setSortation(char sortation) {
		this.sortation = sortation;
	}
}
