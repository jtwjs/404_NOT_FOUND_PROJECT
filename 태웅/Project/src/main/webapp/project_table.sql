drop table member_buyer;
create table member_buyer(          -- 구매자 테이블
    buyer_id varchar2(16) not null, -- 구매자 ID (기본키)
    password varchar2(16) not null, -- 비밀번호
    name varchar2(16) not null,     -- 이름
    tel varchar2(13) not null,      -- 연락처
    email varchar2(33) not null,    -- 이메일
    address varchar2(100) not null, -- 주소
    buyer_num number not null,      -- 구매자 등록번호
    grade char(1) not null,         -- 구매자 등급
    member_type char(1) not null,    -- 멤버타입 (구매자)
    del_flag char(1) not null,      -- 탈퇴여부 (Y,N으로 구분해서 보관)
    join_date date not null,        -- 회원가입일
    wthdr_date date,                -- 회원탈퇴일
    save_point number not null,     -- 적립금
    constraint member_buyer_buyer_id_pk primary key(buyer_id)
);

drop table member_seller;
create table member_seller(               -- 판매자 테이블
    seller_id varchar2(16) not null,      -- 판매자 ID (기본키)
    password varchar2(16) not null,       -- 비밀번호
    license varchar2(16) not null,        -- 사업자등록번호
    shop_name varchar2(16) not null,      -- 상호명
    representative varchar2(16) not null, -- 대표자
    manager_phone varchar2(13) not null,  -- 담당자 연락처
    manager_email varchar2(33) not null,  -- 담당자 이메일
    manager_name varchar2(16) not null,   -- 담당자 이름
    corp_reg_num varchar2(12) not null,   -- 법인등록번호
    sales_ref_num varchar2(20) not null,  -- 통신판매신고번호
    method_payment varchar2(20) not null, -- 정산대금수령방법
    bank_account varchar2(20) not null,   -- 정산대금입금계좌
    seller_reg_num number not null,       -- 판매자 등록번호
    seller_grade char(1) not null,        -- 판매자 등급
    member_type char(1) not null,          -- 멤버타입 (판매자)
    del_flag char(1) not null,            -- 탈퇴여부 (Y,N으로 구분)
    join_date date not null,              -- 회원가입일
    wdf_date date,                        -- 회원탈퇴일
    constraint member_seller_seller_id_pk primary key(seller_id)
);

drop table admin;
create table admin(                 -- 관리자 테이블
    admin_id varchar2(16) not null, -- 관리자 ID (기본키)
    password varchar2(16) not null, -- 비밀번호
    name varchar2(16) not null,     -- 이름
    admin_num number not null,      -- 관리자 번호
    member_type char(1) not null,    -- 멤버타입 (관리자)
    constraint admin_admin_id_pk primary key(admin_id)
);

drop table list_delivery;
create table list_delivery(                 -- 개인저장 배송지 목록
    buyer_id varchar2(16) not null,         -- 구매자 ID(member_buyer테이블 외래키)
    delivery_name varchar2(20) not null,    -- 배송지명
    address varchar2(50) not null,          -- 배송지 주소
    receiver_name varchar2(20) not null,    -- 수령인
    receiver_phone varchar2(13) not null,   -- 연락처
    constraint list_delivery_buyer_id_fk foreign key(buyer_id)
        references member_buyer(buyer_id) on delete cascade
);

drop table board_product;
create table board_product(                     -- 판매게시판
    board_id number not null,                   -- 게시판 ID (기본키)
    seller_id varchar2(16) not null,            -- 작성자 (member_seller테이블 외래키)
    title varchar2(100) not null,               -- 게시판 이름
    price number not null,                      -- 판매가
    board_delivery number not null,             -- 배송비
    satisfaction number(2,1),                   -- 평가점수
    content varchar2(2000) not null,            -- 게시판 내용
    register_date date not null,                -- 게시글 등록일
    category varchar2(16) not null,             -- 상품 카테고리
    sales_producer varchar2(16) not null,       -- 상품정보 (판매생산자)
    product_name varchar2(16) not null,         -- 상품정보 (상품명)
    product_weight varchar2(16) not null,       -- 상품정보 (상품중량)
    product_size varchar2(16) not null,         -- 상품정보 (상품크기)
    product_country varchar2(16) not null,      -- 상품정보 (원산지)
    date_manufacture varchar2(16) not null,     -- 상품정보 (제조년월일)
    best_before_date varchar2(16) not null,     -- 상품정보 (품질유지기한)
    transgenic varchar2(16) not null,           -- 상품정보 (유전자 변형 농수산물 표시)
    storage_method varchar2(16) not null,       -- 상품정보 (보관방법)
    consumer_consulation varchar2(16) not null, -- 상품정보 (소비자상담문의)
    sale_status char(1) not null,               -- 판매여부 (Y, N으로 구분)
    hit number not null,                        -- 조회수
    constraint board_product_board_id_pk primary key(board_id),
    constraint board_product_seller_id_fk foreign key(seller_id)
        references member_seller(seller_id) on delete cascade
);

drop table board_product_option;
create table board_product_option(       -- 판매 옵션
    option_id number not null,           -- 옵션 ID (기본키)
    board_id number not null,            -- 게시판 ID (board_product테이블 외래키)
    option_num number not null,          -- 옵션 번호
    option_name varchar2(30) not null,   -- 옵션 이름
    option_price number not null,        -- 옵션 가격
    inventory number not null,           -- 상품재고량
    constraint option_option_id_pk primary key(option_id),
    constraint option_board_id_fk foreign key(board_id)
        references board_product(board_id) on delete cascade
);

drop table order_record;
create table order_record(                   -- 주문기록
    order_id number not null,                -- 주문번호 ID
    buyer_id varchar2(16) not null,          -- 구매자 ID (member_buyer테이블 외래키)
    option_id number not null,               -- 옵션 ID (board_product_option테이블 외래키)
    count number not null,                   -- 구매수량
    price number not null,                   -- 상품 금액
    sum_price number not null,               -- 총합 금액
    board_delivery number not null,          -- 배송비
    status varchar2(16) not null,            -- 주문상태
    order_address varchar2(100) not null,    -- 배송 주소
    order_phone varchar2(13) not null,       -- 배송 연락처
    order_demand varchar2(100),              -- 배송 요구사항
    order_delivery varchar2(10) not null,    -- 배송사
    order_invoicenum varchar2(20) not null,  -- 송장번호
    order_payment varchar2(20) not null,     -- 결제방식
    order_account varchar2(20) not null,     -- 결제계좌/카드번호
    order_date date not null,                -- 결제일
    non_member_flag char(1) not null,        -- 비회원 여부
    constraint order_record_order_id_pk primary key(order_id),
    constraint order_record_buyer_id_fk foreign key(buyer_id)
        references member_buyer(buyer_id) on delete cascade,
    constraint order_record_option_id_fk foreign key(option_id)
        references board_product_option(option_id) on delete cascade
);

drop table product_cart;
create table product_cart(          -- 장바구니
    cart_id varchar2(10) not null,  -- 장바구니ID (기본키, 랜덤코드 생성)
    buyer_id varchar2(16) not null, -- 구매자 ID (member_buyer테이블 외래키)
    option_id number not null,      -- 옵션 ID (board_product_option테이블 외래키)
    count number,                   -- 수량
    constraint product_cart_cart_id_pk primary key(cart_id),
    constraint product_cart_buyer_id_fk foreign key(buyer_id)
        references member_buyer(buyer_id) on delete cascade,
    constraint product_cart_option_id_fk foreign key(option_id)
        references board_product_option(option_id) on delete cascade
);

drop table qna;
create table qna(                    -- 고객센터 qna
    service_qna_id number not null,  -- 고객문의 게시글 ID (기본키)
    buyer_id varchar2(16) not null,  -- 구매자 ID (member_buyer테이블 외래키)
    sortation char(1) not null,      -- 문의게시글 분류
    answer_status char(1) not null,  -- 답변여부
    title varchar2(50) not null,     -- 제목
    content varchar2(2000) not null, -- 글내용
    register_date date not null,     -- 등록일
    hit number not null,             -- 조회수
    qna_cmt varchar2(200),           -- 댓글
    constraint qna_service_qna_id_pk primary key(service_qna_id),
    constraint qna_buyer_id_fk foreign key(buyer_id)
        references member_buyer(buyer_id) on delete cascade
);

drop table board_notice;
create table board_notice(            -- 공지사항
    notice_id number not null,        -- 공지사항 게시글 ID (기본키)
    title varchar2(16) not null,      -- 공지사항 제목
    content varchar2(2000) not null,  -- 공지사항 글내용
    register_date date not null,      -- 공지사항 등록일
    hit number not null,              -- 조회수
    constraint board_notice_notice_id_pk primary key(notice_id)
);

drop table board_faq;
create table board_faq(          -- 자주묻는질문 게시판
    faq_id number not null,      -- 게시판 등록 ID (기본키)
    title varchar2(50),          -- 게시판 제목
    content varchar2(2000),      -- 게시판 내용
    sortation char(1),           -- 분류
    constraint board_faq_faq_id_pk primary key(faq_id)
);

drop table board_review;
create table board_review(              -- 상품후기 게시판
    review_id number not null,          -- 게시판 ID (기본키)
    order_id number not null,           -- 주문번호 (order_record테이블 외래키)
    option_id number not null,          -- 옵션 ID (board_product_option테이블 외래키)
    title varchar2(50) not null,        -- 글제목
    content varchar2(200) not null,     -- 글내용
    satisfaction number(2,1) not null,  -- 구매만족도(별점)
    register_date date not null,        -- 작성일
    constraint board_review_review_id_pk primary key(review_id),
    constraint board_review_order_id_fk foreign key(order_id)
        references order_record(order_id) on delete cascade,
    constraint board_review_option_id_fk foreign key(option_id)
        references board_product_option(option_id) on delete cascade
);

drop table comment_review;
create table comment_review(         -- 상품 리뷰 댓글
    review_cmt_id number not null,   -- 리뷰댓글 ID (기본키)
    review_id number not null,       -- 상품후기게시판 ID (board_review테이블 외래키)
    content varchar2(200) not null,  -- 글내용
    register_date date not null,     -- 작성일
    seller_id varchar2(16) not null, -- 작성자
    constraint comment_review_cmt_id_pk primary key(review_cmt_id),
    constraint comment_review_id_fk foreign key(review_id)
        references board_review(review_id) on delete cascade
);

drop table board_qna;
create table board_qna(              -- 상품 문의 게시판
    qna_id number not null,          -- Qna게시판 ID (기본키)
    board_id number not null,        -- 게시판 ID (board_product테이블 외래키)
    anser_status char(1) not null,   -- 답변여부
    buyer_id varchar2(16) not null,  -- 작성자
    regiser_date date not null,      -- 등록일자
    title varchar2(50) not null,     -- 글제목
    content varchar2(200) not null,  -- 글내용
    secret_flag char(1) not null,    -- 비밀글 여부
    constraint board_qna_qna_id_pk primary key(qna_id),
    constraint board_qna_board_id_fk foreign key(board_id)
        references board_product(board_id)
);

drop table comment_qna;
create table comment_qna(            -- 상품qna 댓글
    qna_cmt_id number not null,      -- 문의댓글 ID (기본키)
    qna_id number not null,          -- 문의게시판 ID (board_qna테이블 외래키)
    seller_id varchar2(16) not null, -- 작성자(판매자)
    register_date date not null,     -- 작성일
    content varchar2(200) not null,  -- 글내용
    constraint comment_qna_qna_cmt_id_pk primary key(qna_cmt_id),
    constraint comment_qna_qna_id_fk foreign key(qna_id)
        references board_qna(qna_id)
);

drop table wish_list;
create table wish_list(
    wish_id varchar2(10) not null,   -- 위시리스트 ID값 (기본키)
    buyer_id varchar2(16) not null,  -- 구매자 ID (member_buyer테이블 외래키)
    board_id number not null,        -- 판매게시판 ID (board_product테이블 외래키)
    constraint wish_list_wish_id_pk primary key(wish_id),
    constraint wish_list_buyer_id_fk foreign key(buyer_id)
        references member_buyer(buyer_id),
    constraint wish_list_board_id_fk foreign key(board_id)
        references board_product(board_id)
);