package com.spring.service;

import java.util.Date;

public class QnaVO {              // 고객센터 qna

    private int service_qna_id;   // 고객문의 게시글 ID (기본키)
    private String buyer_id;      // 구매자 ID (member_buyer테이블 외래키)
    private char sortation;       // 문의게시글 분류
    private char answer_status;   // 답변여부
    private String title;         // 제목
    private String content;       // 글내용
    private Date register_date;   // 등록일
    private int hit;              // 조회수
    private String qna_cmt;       // 댓글
    
	public int getService_qna_id() {
		return service_qna_id;
	}
	public void setService_qna_id(int service_qna_id) {
		this.service_qna_id = service_qna_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public char getSortation() {
		return sortation;
	}
	public void setSortation(char sortation) {
		this.sortation = sortation;
	}
	public char getAnswer_status() {
		return answer_status;
	}
	public void setAnswer_status(char answer_status) {
		this.answer_status = answer_status;
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
	public String getQna_cmt() {
		return qna_cmt;
	}
	public void setQna_cmt(String qna_cmt) {
		this.qna_cmt = qna_cmt;
	}
}
