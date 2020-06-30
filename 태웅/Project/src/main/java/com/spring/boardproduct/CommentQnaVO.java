package com.spring.boardproduct;

import java.util.Date;

public class CommentQnaVO {     // 상품qna댓글

   private int qna_cmt_id;      // 문의댓글 ID (기본키)
   private int qna_id;          // 문의게시판 ID (board_qna테이블 외래키)
   private String seller_id;    // 작성자(판매자)
   private Date register_date;  // 작성일
   private String content;      // 글내용
   
public int getQna_cmt_id() {
	return qna_cmt_id;
}
public void setQna_cmt_id(int qna_cmt_id) {
	this.qna_cmt_id = qna_cmt_id;
}
public int getQna_id() {
	return qna_id;
}
public void setQna_id(int qna_id) {
	this.qna_id = qna_id;
}
public String getSeller_id() {
	return seller_id;
}
public void setSeller_id(String seller_id) {
	this.seller_id = seller_id;
}
public Date getRegister_date() {
	return register_date;
}
public void setRegister_date(Date register_date) {
	this.register_date = register_date;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
}
