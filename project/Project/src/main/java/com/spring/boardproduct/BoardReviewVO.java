package com.spring.boardproduct;

import java.util.Date;

public class BoardReviewVO {      // 상품후기 게시판

    private int reivew_id;        // 게시판 ID (기본키)
    private int order_id;         // 주문번호 (order_record테이블 외래키)
    private int option_id;        // 옵션 ID (board_production_option테이블 외래키)
    private String title;         // 글제목
    private String content;       // 글내용
    private double satisfaction;  // 구매만족도(별점)
    private Date register_date;   // 작성일
    
	public int getReivew_id() {
		return reivew_id;
	}
	public void setReivew_id(int reivew_id) {
		this.reivew_id = reivew_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
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
}
