package com.spring.buyer;

public class WishListVO {
	
    private String wish_id;    // 위시리스트 ID값 (기본키)
    private String buyer_id;   // 구매자 ID (member_buyer테이블 외래키)
    private int board_id;      // 판매게시판 ID (board_product테이블 외래키)
	
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

}
