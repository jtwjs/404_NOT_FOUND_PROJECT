package com.spring.boardproduct;

import java.util.Date;

/* 테스트용 테이블
drop table comment_review;
create table comment_review(               -- 상품 리뷰 댓글
    review_cmt_id varchar2(32) not null,   -- 리뷰댓글 ID (기본키)
    review_cmt_num number not null,        -- 리뷰댓글 번호 (각 댓글당 1부터 적용)
    review_id varchar2(32),                -- 상품후기게시판 ID (board_review테이블 외래키)
    content varchar2(200) not null,        -- 글내용
    register_date date not null,           -- 작성일
    seller_id varchar2(16) not null,       -- 작성자 (해당 글의 판매자)
    constraint comment_review_cmt_id_pk primary key(review_cmt_id),
    constraint comment_review_id_fk foreign key(review_id)
        references board_review(review_id) on delete cascade
);
 */

public class CommentReviewVO {      // 상품 리뷰 댓글

    private String review_cmt_id;   // 리뷰댓글 ID (기본키)
    private int review_cmt_num;     // 리뷰댓글 번호 (각 댓글당 1부터 적용)
    private String review_id;       // 상품후기게시판 ID (board_review테이블 외래키)
    private String content;         // 글내용
    private Date register_date;     // 작성일
    private String seller_id;       // 작성자 (해당 글의 판매자)
    
	public String getReview_cmt_id() {
		return review_cmt_id;
	}
	public void setReview_cmt_id(String review_cmt_id) {
		this.review_cmt_id = review_cmt_id;
	}
	public int getReview_cmt_num() {
		return review_cmt_num;
	}
	public void setReview_cmt_num(int review_cmt_num) {
		this.review_cmt_num = review_cmt_num;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
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
