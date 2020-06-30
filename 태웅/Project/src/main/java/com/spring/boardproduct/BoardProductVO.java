package com.spring.boardproduct;

import java.util.Date;

public class BoardProductVO {              // 판매게시판

    private String board_id;               // 게시판 ID (기본키)
    private String seller_id;              // 작성자 (member_seller테이블과 비식별관계)
    private String title;                  // 게시판 이름
    private int price;                     // 판매가
    private int board_delivery;            // 배송비
    private double satisfaction;           // 평가점수
    private String content;                // 게시판 내용
    private Date register_date;            // 게시글 등록일
    private String category;               // 상품 카테고리
    private String sales_producer;         // 상품정보 (판매생산자)
    private String product_name;           // 상품정보 (상품명)
    private String product_weight;         // 상품정보 (상품중량)
    private String product_size;           // 상품정보 (상품크기)
    private String product_country;        // 상품정보 (원산지)
    private String date_manufacture;       // 상품정보 (제조년월일)
    private String best_before_date;       // 상품정보 (품질유지기한)
    private String transgenic;             // 상품정보 (유전자 변형 농수산물 표시)
    private String storage_method;         // 상품정보 (보관방법)
    private String consumer_consulation;   // 상품정보 (소비자상담문의)
    private char sale_status;              // 판매여부 (Y, N으로 구분)
    private int hit;                       // 조회수
    
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBoard_delivery() {
		return board_delivery;
	}
	public void setBoard_delivery(int board_delivery) {
		this.board_delivery = board_delivery;
	}
	public double getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(double satisfaction) {
		this.satisfaction = satisfaction;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSales_producer() {
		return sales_producer;
	}
	public void setSales_producer(String sales_producer) {
		this.sales_producer = sales_producer;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_weight() {
		return product_weight;
	}
	public void setProduct_weight(String product_weight) {
		this.product_weight = product_weight;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_country() {
		return product_country;
	}
	public void setProduct_country(String product_country) {
		this.product_country = product_country;
	}
	public String getDate_manufacture() {
		return date_manufacture;
	}
	public void setDate_manufacture(String date_manufacture) {
		this.date_manufacture = date_manufacture;
	}
	public String getBest_before_date() {
		return best_before_date;
	}
	public void setBest_before_date(String best_before_date) {
		this.best_before_date = best_before_date;
	}
	public String getTransgenic() {
		return transgenic;
	}
	public void setTransgenic(String transgenic) {
		this.transgenic = transgenic;
	}
	public String getStorage_method() {
		return storage_method;
	}
	public void setStorage_method(String storage_method) {
		this.storage_method = storage_method;
	}
	public String getConsumer_consulation() {
		return consumer_consulation;
	}
	public void setConsumer_consulation(String consumer_consulation) {
		this.consumer_consulation = consumer_consulation;
	}
	public char getSale_status() {
		return sale_status;
	}
	public void setSale_status(char sale_status) {
		this.sale_status = sale_status;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
