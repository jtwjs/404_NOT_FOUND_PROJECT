package com.spring.boardproduct;

import java.util.Date;

public class CommentReviewVO {   // 상품 리뷰 댓글

    private int review_cmt_id;   // 리뷰댓글 ID
    private int review_id;       // 상품후기게시판 ID (board_review테이블 외래키)
    private String content;      // 글내용
    private Date register_date;  // 작성일
    private String seller_id;    // 작성자
    
	public int getReview_cmt_id() {
		return review_cmt_id;
	}
	public void setReview_cmt_id(int review_cmt_id) {
		this.review_cmt_id = review_cmt_id;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
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
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
}
