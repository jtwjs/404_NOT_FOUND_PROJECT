/*구매자*/
create table member_buyer(          -- 구매자 테이블
    buyer_id varchar2(16) not null, -- 구매자 ID (기본키)
    password varchar2(100) not null, -- 비밀번호 (*암호화때문에 크기늘림)
    name varchar2(16) not null,     -- 이름
    tel varchar2(13) not null,      -- 연락처
    email varchar2(33) not null,    -- 이메일
    address varchar2(100) not null, -- 주소
    buyer_num number not null,      -- 구매자 등록번호
    grade char(1) default 0 not null,         -- 구매자 등급
    member_type varchar(10) default 'BUYER' not null,    -- 멤버타입 (구매자:B 판매자:S 관리자:A)
    del_flag char(1) default 'N' not null,      -- 탈퇴여부 (Y,N으로 구분해서 보관)
    join_date date default sysdate not null,        -- 회원가입일
    wthdr_date date,                -- 회원탈퇴일
    save_point number  default 0 not null,     -- 적립금
    profile_img varchar2(200),          --프로필사진
    last_loginDate date default sysdate,                --마지막접속일자
    constraint member_buyer_buyer_id_pk primary key(buyer_id)
);
select * from member_buyer;

desc member_buyer;
/*buyer_num Sequence*/
CREATE SEQUENCE buyer_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;
--     select buyer_num_seq.nextval from DUAL;
--     select buyer_num_seq.currval from dual;   
    
    select * from member_buyer;
    select count(*) from member_buyer where buyer_Id = 'asdf95032';
commit;
     
     /*판매자*/
     create table member_seller(               -- 판매자 테이블
    seller_id varchar2(16) not null,      -- 판매자 ID (기본키)
    password varchar2(100) not null,       -- 비밀번호(*암호화때문에 크기늘림)
    shop_name varchar2(16) not null,      -- 상호명
    representative varchar2(16) not null, -- 대표자
    address varchar2(100) not null,       -- 주소
    manager_phone varchar2(13) not null,  -- 담당자 연락처
    manager_email varchar2(33) not null,  -- 담당자 이메일
    manager_name varchar2(16) not null,   -- 담당자 이름
    mail_order_report_num varchar2(20) not null,  -- 통신판매신고번호
    mail_order_report_img varchar2(200) not null,
    bank_name varchar2(20) not null,
    bank_account varchar2(20) not null,   -- 정산대금입금계좌
    seller_reg_num number not null,       -- 판매자 등록번호
    seller_grade char(1) default 0 not null,        -- 판매자 등급 
    member_type varchar2(10) default 'SELLER' not null,          -- 멤버타입 (판매자) (구매자:B 판매자:S 관리자:A)
    del_flag char(1) default 'N' not null,            -- 탈퇴여부 (Y,N으로 구분)
    join_date date default sysdate not null,              -- 회원가입일
    wthdr_date date,                        -- 회원탈퇴일
    profile_img varchar2(200),
    last_loginDate date default sysdate,
    constraint member_seller_seller_id_pk primary key(seller_id)
);

CREATE SEQUENCE seller_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;
     
     select * from member_buyer;
     select * from member_seller;
    
    
 create table board_faq(          -- 자주묻는질문 게시판
num number not null,         -- 리스트 번호 (기본키)
title varchar2(50),          -- 게시판 제목
content varchar2(2000),      -- 게시판 내용
boarddate date,
constraint board_faq_num_pk primary key(num)
);

create table board_notice(            -- 공지사항

    num number not null,                -- 공지사항 글번호
    title varchar2(1600) not null,      -- 공지사항 제목
    content varchar2(4000) not null,    -- 공지사항 글내용
    hit number not null,                   -- 조회수
    register_date date not null            -- 공지사항 등록일
    
);
/*상품등록*/
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



/*위시리스트*/
drop table wish_list;
create table wish_list(
    wish_id varchar2(32) not null,         -- 위시리스트 ID값 (기본키, 랜덤생성)
    buyer_id varchar2(16) not null,        -- 구매자 ID (member_buyer테이블 외래키)
    board_id varchar2(32) not null,        -- 판매게시판 ID (board_product테이블 외래키)
    constraint wish_list_wish_id_pk primary key(wish_id)
);


/*주문기록*/
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
/*장바구니*/
drop table product_cart;
create table product_cart(          -- 장바구니
    cart_id varchar2(32) not null,  -- 장바구니ID (기본키, 랜덤코드 생성)
    board_id varchar2(32) not null, -- 판매글 ID
    buyer_id varchar2(16) not null, -- 구매자 ID (member_buyer테이블 외래키)
    quantity number,                -- 수량
    constraint product_cart_cart_id_pk primary key(cart_id)
);
 
 