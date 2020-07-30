package com.spring.boardproduct;

import java.util.Date;

/* 테스트용 테이블
drop table board_qna;
create table board_qna(                -- 상품 문의 게시판
    qna_num number not null,           -- Qna게시판 ID (기본키)
    board_id varchar2(32) not null,    -- 게시판 ID (board_product테이블 외래키)
    seller_id varchar2(32) not null,   -- 판매자 ID
    buyer_id varchar2(32) not null,    -- 작성자
    qna_status number not null,        -- 문의종류
    answer_status number not null,     -- 답변여부
    register_date date not null,       -- 등록일자
    title varchar2(200) not null,      -- 글제목
    content varchar2(500) not null,    -- 글내용
    recommend varchar2(500),           -- 답변
    recommend_date date,               -- 답변일
    secret_flag number not null,       -- 비밀글 여부
    constraint board_qna_qna_num_pk primary key(qna_num)
);
 */

public class BoardQnaVO {         // 상품문의게시판

    private int qna_num;          // Qna게시판 ID (기본키)
    private String board_id;      // 게시판 ID (board_product테이블 외래키)
    private String seller_id;     // 판매자 ID
    private String buyer_id;      // 작성자
    private int qna_status;       // 문의 종류
    private int answer_status;    // 답변여부
    private Date register_date;   // 등록일자
    private String title;         // 글제목
    private String content;       // 글내용
    private String recommend;     // 답변
    private Date recommend_date;  // 답변일
    private int secret_flag;      // 비밀글 여부
    
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getQna_status() {
		return qna_status;
	}
	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}
	public int getAnswer_status() {
		return answer_status;
	}
	public void setAnswer_status(int answer_status) {
		this.answer_status = answer_status;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
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
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public Date getRecommend_date() {
		return recommend_date;
	}
	public void setRecommend_date(Date recommend_date) {
		this.recommend_date = recommend_date;
	}
	public int getSecret_flag() {
		return secret_flag;
	}
	public void setSecret_flag(int secret_flag) {
		this.secret_flag = secret_flag;
	}
    
    
	
}
