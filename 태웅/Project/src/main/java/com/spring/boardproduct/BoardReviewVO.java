package com.spring.boardproduct;

import java.util.Date;

/* 테스트용 테이블
drop table board_review;
create table board_review(              -- 상품후기 게시판
    review_id varchar2(32) not null,    -- 리뷰글 ID (기본키)
    review_num number not null,         -- 리뷰글 번호
    board_id varchar2(32) not null,     -- 게시판 ID
    buyer_id varchar2(32) not null,     -- 구매자 ID
    order_id varchar2(32) not null,     -- 주문번호 (order_record테이블 외래키)
    title varchar2(100) not null,       -- 판매글 제목
    content varchar2(200) not null,     -- 글내용
    satisfaction number(2,1) not null,  -- 구매만족도(별점)
    register_date date not null,        -- 작성일
    review_img_path varchar2(50),       -- 작성 후기글 이미지 경로
    review_img_name varchar2(100),       -- 작성 후기글 이미지 이름
    constraint board_review_review_id_pk primary key(review_id)
);
 */

public class BoardReviewVO {         // 상품후기 게시판

    private String review_id;        // 리뷰글 ID (기본키)
    private int review_num;          // 리뷰글 번호
    private String board_id;         // 게시판 ID
    private String order_id;         // 주문번호
    private String buyer_id;         // 구매자 ID
    private String title;            // 판매글 제목
    private String content;          // 글내용
    private double satisfaction;     // 구매만족도(별점)
    private Date register_date;      // 작성일
    private String review_img_path;  // 작성 후기글 이미지 경로
    private String review_img_name;  // 작성 후기글 이미지 이름
    
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
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
    
	
    
	
}
