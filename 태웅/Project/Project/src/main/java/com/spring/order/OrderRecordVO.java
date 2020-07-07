package com.spring.order;

import java.util.Date;

public class OrderRecordVO {           // 주문기록

    private int order_id;              // 주문번호 ID
    private String buyer_id;           // 구매자 ID (member_buyer테이블과 비식별관계)
    private int option_id;             // 옵션 ID (board_product_option테이블과 비식별관계)
    private int count;                 // 구매수량
    private int price;                 // 상품 금액
    private int sum_price;             // 총합 금액
    private int board_delivery;        // 배송비
    private String status;             // 주문상태
    private String order_address;      // 배송 주소
    private String order_phone;        // 배송 연락처
    private String order_demand;       // 배송 요구사항
    private String order_delivery;     // 배송사
    private String order_invoicenum;   // 송장번호
    private String order_payment;      // 결제방식
    private String order_account;      // 결제계좌/카드번호
    private Date order_date;           // 결제일
    private char non_member_flag;      // 비회원 여부
    
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSum_price() {
		return sum_price;
	}
	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}
	public int getBoard_delivery() {
		return board_delivery;
	}
	public void setBoard_delivery(int board_delivery) {
		this.board_delivery = board_delivery;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_demand() {
		return order_demand;
	}
	public void setOrder_demand(String order_demand) {
		this.order_demand = order_demand;
	}
	public String getOrder_delivery() {
		return order_delivery;
	}
	public void setOrder_delivery(String order_delivery) {
		this.order_delivery = order_delivery;
	}
	public String getOrder_invoicenum() {
		return order_invoicenum;
	}
	public void setOrder_invoicenum(String order_invoicenum) {
		this.order_invoicenum = order_invoicenum;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	public String getOrder_account() {
		return order_account;
	}
	public void setOrder_account(String order_account) {
		this.order_account = order_account;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public char getNon_member_flag() {
		return non_member_flag;
	}
	public void setNon_member_flag(char non_member_flag) {
		this.non_member_flag = non_member_flag;
	}
}
