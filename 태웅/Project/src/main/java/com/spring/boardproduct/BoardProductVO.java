package com.spring.boardproduct;

/* 테스트용 테이블
drop table board_product;
create table board_product(                     -- 판매게시판
    board_id varchar2(32) not null,             -- 게시판 ID (기본키)
    seller_id varchar2(16) not null,            -- 작성자 (member_seller테이블 외래키)
    board_num number not null,                  -- 게시판 번호
    title varchar2(100) not null,               -- 게시판 이름
    price number not null,                      -- 판매가
    delivery_price number not null,             -- 배송비
	quantity number not null,                   -- 수량
    satisfaction number(2,1),                   -- 평가점수
    content varchar2(2000) not null,            -- 게시판 내용
    register_date date not null,                -- 게시글 등록일
    category_1 number not null,                 -- 1차 카테고리 (분류)
    category_2 number not null,                 -- 2차 카테고리 (상품)
    category_local number not null,             -- 원산지 코드 (지역 분류)
    sales_producer varchar2(32) not null,       -- 상품정보 (판매생산자)
    product_name varchar2(32) not null,         -- 상품정보 (상품명)
    product_weight varchar2(32) not null,       -- 상품정보 (상품중량)
    product_size varchar2(64) not null,         -- 상품정보 (상품크기)
    product_country varchar2(32) not null,      -- 상품정보 (원산지)
    date_manufacture varchar2(32) not null,     -- 상품정보 (제조년월일)
    best_before_date varchar2(32) not null,     -- 상품정보 (품질유지기한)
    transgenic varchar2(32) not null,           -- 상품정보 (유전자 변형 농수산물 표시)
    storage_method varchar2(32) not null,       -- 상품정보 (보관방법)
    consumer_consulation varchar2(16) not null, -- 상품정보 (소비자상담문의)
	thumbnail_origin varchar2(100),             -- 썸네일 이미지 원본 이름
	thumbnail_thum varchar2(100),               -- 썸네일 이미지 이름
	product_origin_1 varchar2(100),             -- 대표 이미지1 이름
	product_thum_1 varchar2(100),               -- 대표 이미지1 썸네일 이름
	product_origin_2 varchar2(100),             -- 대표 이미지2 이름
	product_thum_2 varchar2(100),               -- 대표 이미지2 썸네일 이름
	product_origin_3 varchar2(100),             -- 대표 이미지3 이름
	product_thum_3 varchar2(100),               -- 대표 이미지3 썸네일 이름
	product_origin_4 varchar2(100),             -- 대표 이미지4 이름
	product_thum_4 varchar2(100),               -- 대표 이미지4 썸네일 이름
	content_origin varchar2(100),               -- 게시글 본문 이미지 이름
    thumbnail_origin_path varchar2(100),        -- 썸네일 원본 경로
    thumbnail_thum_path varchar2(100),          -- 썸네일 썸네일 경로
    product_origin_path varchar2(100),          -- 대표이미지 원본 경로
    product_thum_path varchar2(100),            -- 대표이미지 썸네일 경로
    content_origin_path varchar2(100),          -- 본문이미지 원본 경로
    sale_status char(1) not null,               -- 판매여부 (Y, N으로 구분)
    hit number not null,                        -- 판매수
    read_count number not null,                 -- 조회수
    constraint board_product_board_id_pk primary key(board_id)
);
 */



import java.util.Date;

public class BoardProductVO {              // 판매게시판

    private String board_id;               // 게시판 ID (기본키)
    private String seller_id;              // 작성자 (member_seller테이블 외래키)
    private int board_num;                 // 게시판 번호
    private String title;                  // 게시판 이름
    private int price;                     // 판매가
    private int delivery_price;            // 배송비
    private int quantity;                  // 재고량
    private double satisfaction;           // 평가점수
    private String content;                // 게시판 내용
    private Date register_date;            // 게시글 등록일
    private int category_1;                // 1차 카테고리 (분류)
    private int category_2;                // 2차 카테고리 (상품)
    private int category_local;            // 원산지 코드 (지역 분류)
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
    private String thumbnail_origin;       // 썸네일 이미지 원본이름
    private String thumbnail_thum;         // 썸네일 이미지 이름
    private String product_origin_1;       // 대표 이미지1 이름
    private String product_thum_1;         // 대표 이미지1 썸네일 이름
    private String product_origin_2;       // 대표 이미지2 이름
    private String product_thum_2;         // 대표 이미지2 썸네일 이름
    private String product_origin_3;       // 대표 이미지3 이름
    private String product_thum_3;         // 대표 이미지3 썸네일 이름
    private String product_origin_4;       // 대표 이미지4 이름
    private String product_thum_4;         // 대표 이미지4 썸네일 이름
    private String thumbnail_origin_path;  // 썸네일 원본 경로
    private String thumbnail_thum_path;    // 썸네일 썸네일 경로
    private String product_origin_path;    // 대표이미지 원본 경로
    private String product_thum_path;      // 대표이미지 썸네일 경로
    private String content_origin_path;    // 본문이미지 원본 경로
    private String content_origin;         // 본문 이미지 이름
    private char sale_status;              // 판매여부 (Y, N으로 구분)
    private int hit;                       // 판매수
    private int read_count;                // 조회수
    
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
	public int getDelivery_price() {
		return delivery_price;
	}
	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
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
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getCategory_1() {
		return category_1;
	}
	public void setCategory_1(int category_1) {
		this.category_1 = category_1;
	}
	public int getCategory_2() {
		return category_2;
	}
	public void setCategory_2(int category_2) {
		this.category_2 = category_2;
	}
	public int getCategory_local() {
		return category_local;
	}
	public void setCategory_local(int category_local) {
		this.category_local = category_local;
	}
	public String getThumbnail_origin() {
		return thumbnail_origin;
	}
	public void setThumbnail_origin(String thumbnail_origin) {
		this.thumbnail_origin = thumbnail_origin;
	}
	public String getThumbnail_thum() {
		return thumbnail_thum;
	}
	public void setThumbnail_thum(String thumbnail_thum) {
		this.thumbnail_thum = thumbnail_thum;
	}
	public String getProduct_origin_1() {
		return product_origin_1;
	}
	public void setProduct_origin_1(String product_origin_1) {
		this.product_origin_1 = product_origin_1;
	}
	public String getProduct_thum_1() {
		return product_thum_1;
	}
	public void setProduct_thum_1(String product_thum_1) {
		this.product_thum_1 = product_thum_1;
	}
	public String getProduct_origin_2() {
		return product_origin_2;
	}
	public void setProduct_origin_2(String product_origin_2) {
		this.product_origin_2 = product_origin_2;
	}
	public String getProduct_thum_2() {
		return product_thum_2;
	}
	public void setProduct_thum_2(String product_thum_2) {
		this.product_thum_2 = product_thum_2;
	}
	public String getProduct_origin_3() {
		return product_origin_3;
	}
	public void setProduct_origin_3(String product_origin_3) {
		this.product_origin_3 = product_origin_3;
	}
	public String getProduct_thum_3() {
		return product_thum_3;
	}
	public void setProduct_thum_3(String product_thum_3) {
		this.product_thum_3 = product_thum_3;
	}
	public String getProduct_origin_4() {
		return product_origin_4;
	}
	public void setProduct_origin_4(String product_origin_4) {
		this.product_origin_4 = product_origin_4;
	}
	public String getProduct_thum_4() {
		return product_thum_4;
	}
	public void setProduct_thum_4(String product_thum_4) {
		this.product_thum_4 = product_thum_4;
	}
	public String getContent_origin() {
		return content_origin;
	}
	public void setContent_origin(String content_origin) {
		this.content_origin = content_origin;
	}
	public String getThumbnail_origin_path() {
		return thumbnail_origin_path;
	}
	public void setThumbnail_origin_path(String thumbnail_origin_path) {
		this.thumbnail_origin_path = thumbnail_origin_path;
	}
	public String getThumbnail_thum_path() {
		return thumbnail_thum_path;
	}
	public void setThumbnail_thum_path(String thumbnail_thum_path) {
		this.thumbnail_thum_path = thumbnail_thum_path;
	}
	public String getProduct_origin_path() {
		return product_origin_path;
	}
	public void setProduct_origin_path(String product_origin_path) {
		this.product_origin_path = product_origin_path;
	}
	public String getProduct_thum_path() {
		return product_thum_path;
	}
	public void setProduct_thum_path(String product_thum_path) {
		this.product_thum_path = product_thum_path;
	}
	public String getContent_origin_path() {
		return content_origin_path;
	}
	public void setContent_origin_path(String content_origin_path) {
		this.content_origin_path = content_origin_path;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
}
