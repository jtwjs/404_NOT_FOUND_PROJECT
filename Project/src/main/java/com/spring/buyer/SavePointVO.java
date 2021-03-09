package com.spring.buyer;

import java.util.Date;

public class SavePointVO {
	
	private String status;
	private String content;
	private String contentTitle;
	private String contentDetail;
	private String applicationDate;
	private String id;
	private String board_title;
	private String board_id;
	private int point;
	private String orderId;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	public String getContentDetail() {
		return contentDetail;
	}
	public void setContentDetail(String contentDetail) {
		this.contentDetail = contentDetail;
	}
	public String getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(String applicationDate) {
		this.applicationDate = applicationDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderNum) {
		this.orderId = orderNum;
	}
	
	
}
