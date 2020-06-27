package com.spring.boardproduct;

public class BoardProductOptionVO {

    private int option_id;       // 옵션 ID (기본키)
    private int board_id;        // 게시판 ID (board_product테이블과 비식별관계)
    private int option_num;      // 옵션 번호
    private String option_name;  // 옵션 이름
    private int option_price;    // 옵션 가격
    private int inventory;       // 상품재고량
    
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getOption_num() {
		return option_num;
	}
	public void setOption_num(int option_num) {
		this.option_num = option_num;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public int getOption_price() {
		return option_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
}
