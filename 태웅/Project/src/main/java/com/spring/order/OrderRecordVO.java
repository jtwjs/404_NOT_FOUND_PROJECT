package com.spring.order;

import java.util.Date;

/* 테스트용 테이블
drop table order_record;
create table order_record(                   -- 주문기록
    order_num number not null,               -- 주문번호 (기본키)
    order_id varchar2(32) not null,          -- 주문번호 ID
    board_id varchar2(32) not null,          -- 상품판매글 ID (member_buyer테이블 외래키)
    board_title varchar2(100) not null,      -- 상품판매글 제목
	seller_id varchar2(16) not null,         -- 판매자 ID
	buyer_id varchar2(16) not null,          -- 구매자 ID
    amount number not null,                  -- 구매수량
    price number not null,                   -- 상품 금액
    delivery_price number not null,          -- 배송비
    use_point number not null,               -- 사용한 적립금
	tot_price number not null,               -- 총합 금액
    status varchar2(16) not null,            -- 주문상태
    buyer_name varchar2(16) not null,        -- 주문자 이름
    buyer_phone varchar2(13) not null,       -- 주문자 번호
    buyer_email varchar2(33) not null,       -- 주문자 이메일
    order_postalCode varchar2(5) not null,   -- 우편번호
    order_address varchar2(100) not null,    -- 배송 주소
    order_name varchar2(16) not null,        -- 받으실 분
    order_phone varchar2(13) not null,       -- 배송 연락처
    order_demand varchar2(200),              -- 배송 요구사항
    order_delivery varchar2(10) not null,    -- 배송사
    order_invoicenum varchar2(20),           -- 송장번호
    order_payment varchar2(20) not null,     -- 결제방식
    order_account varchar2(20) not null,     -- 결제계좌/카드번호
    order_date date not null,                -- 결제일
    non_member_flag char(1) not null,        -- 비회원 여부 ('Y', 'N' 으로 구분)
    constraint order_record_order_num_pk primary key(order_num)
);
 */

public class OrderRecordVO {           // 주문기록

    private int order_num;             // 주문번호 (기본키)
    private String order_id;           // 주문번호 ID
    private String board_id;           // 상품판매글 ID
    private String board_title;        // 상품판매글 제목
    private String seller_id;          // 판매자 ID
    private String buyer_id;           // 구매자 ID (member_buyer테이블과 비식별관계)
    private int amount;                // 구매수량
    private int price;                 // 상품 금액
    private int delivery_price;        // 배송비
    private int use_point;             // 사용한 적립금
    private int tot_price;             // 총합 금액
    private String status;             // 주문상태
    private String buyer_name;         // 주문자 이름
    private String buyer_phone;        // 주문자 번호
    private String buyer_email;        // 주문자 이메일
    private String order_postalCode;   // 우편번호
    private String order_address;      // 배송 주소
    private String order_name;         // 받으실 분
    private String order_phone;        // 배송 연락처
    private String order_demand;       // 배송 요구사항
    private String order_delivery;     // 배송사
    private String order_invoicenum;   // 송장번호
    private String order_payment;      // 결제방식
    private String order_account;      // 결제계좌/카드번호
    private String order_date;           // 결제일
    private char non_member_flag;      // 비회원 여부 ('Y', 'N' 으로 구분)
    
    private String thumbnail_thum;
    private String thumbnail_thum_path;
    
    private boolean reviewCheck;
    
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDelivery_price() {
		return delivery_price;
	}
	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrder_postalCode() {
		return order_postalCode;
	}
	public void setOrder_postalCode(String order_postalCode) {
		this.order_postalCode = order_postalCode;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
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
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public char getNon_member_flag() {
		return non_member_flag;
	}
	public void setNon_member_flag(char non_member_flag) {
		this.non_member_flag = non_member_flag;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_phone() {
		return buyer_phone;
	}
	public void setBuyer_phone(String buyer_phone) {
		this.buyer_phone = buyer_phone;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getThumbnail_thum() {
		return thumbnail_thum;
	}
	public void setThumbnail_thum(String thumbnail_thum) {
		this.thumbnail_thum = thumbnail_thum;
	}
	public String getThumbnail_thum_path() {
		return thumbnail_thum_path;
	}
	public void setThumbnail_thum_path(String thumbnail_thum_path) {
		this.thumbnail_thum_path = thumbnail_thum_path;
	}
	public boolean isReviewCheck() {
		return reviewCheck;
	}
	public void setReviewCheck(boolean reviewCheck) {
		this.reviewCheck = reviewCheck;
	}
	
	
	
}
