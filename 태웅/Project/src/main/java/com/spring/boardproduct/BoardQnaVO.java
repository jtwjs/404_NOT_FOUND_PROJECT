package com.spring.boardproduct;

import java.util.Date;

public class BoardQnaVO {       // 상품문의게시판

    private int qna_num;        // Qna게시판 ID (기본키)
    private int board_id;       // 게시판 ID (board_product테이블 외래키)
    private int qna_status;     // 문의 종류
    private char anser_status;  // 답변여부
    private String buyer_id;    // 작성자
    private Date regiser_date;  // 등록일자
    private String title;       // 글제목
    private String content;     // 글내용
    private char secret_flag;   // 비밀글 여부
    
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public char getAnser_status() {
		return anser_status;
	}
	public void setAnser_status(char anser_status) {
		this.anser_status = anser_status;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public Date getRegiser_date() {
		return regiser_date;
	}
	public void setRegiser_date(Date regiser_date) {
		this.regiser_date = regiser_date;
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
	public char getSecret_flag() {
		return secret_flag;
	}
	public void setSecret_flag(char secret_flag) {
		this.secret_flag = secret_flag;
	}
	public int getQna_status() {
		return qna_status;
	}
	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}
}

