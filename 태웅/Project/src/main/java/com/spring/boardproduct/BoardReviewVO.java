package com.spring.boardproduct;

import java.util.Date;

/* 테스트용 테이블
drop table board_review;
create table board_review(              -- 상품후기 게시판
    review_id varchar2(32) not null,    -- 게시판 ID (기본키)
    review_num number not null,         -- 게시판 번호
    order_id varchar2(32) not null,     -- 주문번호 (order_record테이블 외래키)
    title varchar2(50) not null,        -- 글제목
    content varchar2(200) not null,     -- 글내용
    satisfaction number(2,1) not null,  -- 구매만족도(별점)
    register_date date not null,        -- 작성일
    read_count number not null,         -- 조회수
    review_img_path varchar2(50),       -- 작성 후기글 이미지 경로
    review_img_name varchar2(50),       -- 작성 후기글 이미지 이름
    constraint board_review_review_id_pk primary key(review_id)
);
 */

public class BoardReviewVO {         // 상품후기 게시판

    private String reivew_id;        // 게시판 ID (기본키)
    private int reivew_num;          // 게시판 번호
    private String order_id;         // 주문번호
    private String buyer_id;         // 구매자 ID
    private String title;            // 글제목
    private String content;          // 글내용
    private double satisfaction;     // 구매만족도(별점)
    private Date register_date;      // 작성일
    private int read_count;          // 조회수
    private String review_img_path;  // 작성 후기글 이미지 경로
    private String review_img_name;  // 작성 후기글 이미지 이름
    
	public String getReivew_id() {
		return reivew_id;
	}
	public void setReivew_id(String reivew_id) {
		this.reivew_id = reivew_id;
	}
	public int getReivew_num() {
		return reivew_num;
	}
	public void setReivew_num(int reivew_num) {
		this.reivew_num = reivew_num;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
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
	public double getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(double satisfaction) {
		this.satisfaction = satisfaction;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public String getReview_img_path() {
		return review_img_path;
	}
	public void setReview_img_path(String review_img_path) {
		this.review_img_path = review_img_path;
	}
	public String getReview_img_name() {
		return review_img_name;
	}
	public void setReview_img_name(String review_img_name) {
		this.review_img_name = review_img_name;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
    

    
	
}
