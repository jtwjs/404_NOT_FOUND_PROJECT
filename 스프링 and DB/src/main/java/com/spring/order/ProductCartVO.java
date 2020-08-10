package com.spring.order;

/* 테스트용 테이블
drop table product_cart;
create table product_cart(          -- 장바구니
    cart_id varchar2(32) not null,  -- 장바구니ID (기본키, 랜덤코드 생성)
    board_id varchar2(32) not null, -- 판매글 ID
    buyer_id varchar2(16) not null, -- 구매자 ID (member_buyer테이블 외래키)
    quantity number,                -- 수량
    constraint product_cart_cart_id_pk primary key(cart_id)
);
 */

public class ProductCartVO {

    private String cart_id;
    private String board_id;
    private String buyer_id;
    private int quantity;
    
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
