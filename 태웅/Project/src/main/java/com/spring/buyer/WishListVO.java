package com.spring.buyer;

/* 테스트용 테이블
drop table wish_list;
create table wish_list(
    wish_id varchar2(32) not null,         -- 위시리스트 ID값 (기본키, 랜덤생성)
    buyer_id varchar2(16) not null,        -- 구매자 ID (member_buyer테이블 외래키)
    board_id varchar2(32) not null,        -- 판매게시판 ID (board_product테이블 외래키)
    title varchar2(100) not null,          -- 게시판 이름
    price number not null,                 -- 판매가
    thumbnail_thum varchar2(100),          -- 썸네일 이미지 이름
    thumbnail_thum_path varchar2(100),     -- 썸네일 썸네일 경로
    constraint wish_list_wish_id_pk primary key(wish_id)
);
 */

public class WishListVO {
	
    private String wish_id;              // 위시리스트 ID값 (기본키)
    private String buyer_id;             // 구매자 ID (member_buyer테이블 외래키)
    private String board_id;             // 판매게시판 ID (board_product테이블 외래키)
    private String title;                // 게시판 이름
    private int price;                   // 판매가
    private String thumbnail_thum;       // 썸네일 이미지 이름
    private String thumbnail_thum_path;  // 썸네일 이미지 경로
	
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
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
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

}
