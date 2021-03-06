/*모든 계정 테이블*/
CREATE Table all_account(
account_id varchar2(16) not null,
account_pw varchar2(100) not null,
account_type varchar2(10) not null,
constraint all_account_pk primary key(account_id)
);

UPDATE order_record SET order_date = to_date('20/08/04', 'YY/MM/DD') where order_date = to_date('20/08/06', 'YY/MM/DD');
UPDATE order_record SET non_member_flag = 'N' where order_num between 6 and 9;
select * from order_record;
select * from board_qna;
select * from all_account;
select * from member_buyer;
select * from list_delivery;
drop table list_delivery;

commit;

update member_buyer set join_date = '20/08/04' where name = '최예나';
update member_buyer set join_date = '20/08/04' where name = '나북희';
update member_buyer set join_date = '20/07/03' where name = '권은비';
update member_buyer set join_date = '20/07/03' where name = '이채연';
update member_buyer set join_date = '20/08/03' where name = '히토미';
update member_buyer set join_date = '20/07/31' where name = '조유리';

commit;

select * from board_notice;


select *from board_product;
update board_product set register_date = '20/08/02' where seller_id = 'seller01';
update board_product set register_date = '20/07/30' where seller_id = 'seller03';
update board_product set register_date = '20/05/02' where seller_id = 'seller11';
update board_product set register_date = '20/05/02' where seller_id = 'seller10';
update board_product set register_date = '20/07/02' where seller_id = 'seller12';

SELECT a.*
            FROM all_account a
                LEFT OUTER JOIN member_buyer b ON a.account_id = b.buyer_id 
                LEFT OUTER JOIN member_seller s ON a.account_id = s.seller_id 
            WHERE (b.del_flag != 'Y' OR s.del_flag != 'Y' OR a.account_type = 'ADMIN') AND a.account_id = 'seller02';

create table admin(                 -- 愿�由ъ옄 �뀒�씠釉�
    admin_id varchar2(16) not null, -- 愿�由ъ옄 ID (湲곕낯�궎)
    password varchar2(100) not null, -- 鍮꾨�踰덊샇
    name varchar2(16) not null,     -- �씠由�
    admin_num number not null,      -- 愿�由ъ옄 踰덊샇
    member_type varchar(10) default 'ADMIN' not null,    -- 硫ㅻ쾭���엯 (愿�由ъ옄)
    constraint admin_admin_id_pk primary key(admin_id)
);

insert into admin 
values ('admin','{bcrypt}$2a$10$UgciI5e8vDo2uZlnRDSL4eZlPwkWMyd4pOCj90wja8UWqkX.GSAqu','관리자',admin_num_seq.nextval,'ADMIN');


CREATE SEQUENCE admin_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;
    

create or replace trigger TRG_admin_account
AFTER INSERT ON admin
for each row
BEGIN
insert into all_account (account_ID, account_pw, account_type)
values (:new.admin_id, :new.password, :new.member_type);
END;

create table member_buyer(          -- 援щℓ�옄 �뀒�씠釉�
    buyer_id varchar2(16) not null, -- 援щℓ�옄 ID (湲곕낯�궎)
    password varchar2(100) not null, -- 鍮꾨�踰덊샇 (*�븫�샇�솕�븣臾몄뿉 �겕湲곕뒛由�)
    name varchar2(16) not null,     -- �씠由�
    tel varchar2(13) not null,      -- �뿰�씫泥�
    email varchar2(33) not null,    -- �씠硫붿씪
    address varchar2(100) not null, -- 二쇱냼
    buyer_num number not null,      -- 援щℓ�옄 �벑濡앸쾲�샇
    grade char(1) default 1 not null,         -- 援щℓ�옄 �벑湲�
    member_type varchar(10) default 'BUYER' not null,    -- 硫ㅻ쾭���엯 (援щℓ�옄:B �뙋留ㅼ옄:S 愿�由ъ옄:A)
    del_flag char(1) default 'N' not null,      -- �깉�눜�뿬遺� (Y,N�쑝濡� 援щ텇�빐�꽌 蹂닿�)
    join_date date default sysdate not null,        -- �쉶�썝媛��엯�씪
    wthdr_date date,                -- �쉶�썝�깉�눜�씪
    save_point number  default 0 not null,     -- �쟻由쎄툑
    profile_img varchar2(200) ,          --�봽濡쒗븘�궗吏�
    profile_img_path varchar2(100),
    last_loginDate date default sysdate,                --留덉�留됱젒�냽�씪�옄
    constraint member_buyer_buyer_id_pk primary key(buyer_id)
);

/*buyer_num Sequence*/
CREATE SEQUENCE buyer_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;
--     select buyer_num_seq.nextval from DUAL;
--     select buyer_num_seq.currval from dual;   

select * from save_point;
/*적립금 테이블*/     
create table save_point (
 sp_status varchar2(4) not null, --적립, 사용
 sp_point number not null,
 sp_content varchar2(100) not null,
 --주문결제 적립 +[상품명], 상품후기 작성으로 인한 적립금 지급, 적립금 결제 + [상품명]
 order_id varchar2(32) not null,
 sp_application_date date default sysdate not null,
 buyer_id varchar2(16) not null,
 point_num number not null,
constraint save_point_fk foreign key(buyer_id)
        references member_buyer(buyer_id) on delete cascade,
constraint save_point_pk primary key(point_num)
);

/*point_num Sequence*/
CREATE SEQUENCE point_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE; 

create or replace trigger TRG_buyer_account
AFTER INSERT ON member_buyer
for each row
BEGIN
insert into all_account (account_ID, account_pw, account_type)
values (:new.buyer_id, :new.password, :new.member_type);
END;

create or replace trigger TRG_buyer_savePoint --구매자 적립금 update 
AFTER INSERT ON save_point
for each row
DECLARE 
    status varchar2(4) := :new.sp_status;
BEGIN 
IF status = '적립' THEN
    UPDATE member_buyer SET save_point = save_point+:new.sp_point
    WHERE buyer_id = :new.buyer_id;
ELSE 
    UPDATE member_buyer SET save_point = save_point-:new.sp_point
    WHERE buyer_id = :new.buyer_id;
END IF;
END;


create table list_delivery(                 -- 개인저장 배송지 목록
    num number default(1),                    -- 배송지 번호 
    buyer_id varchar2(16) not null,         -- 구매자 ID(member_buyer테이블 외래키)
    delivery_name varchar2(20) default '가입한 주소' not null,    -- 배송지명
    address varchar2(100) not null,          -- 배송지 주소
    default_address char(1) default 'Y',       --기본배송지 구분 (Y=기본배송지, N=배송지)
    receiver_name varchar2(20) not null,    -- 수령인
    receiver_phone varchar2(13) not null,   -- 연락처  
    constraint list_delivery_buyer_id_fk foreign key(buyer_id)
    references member_buyer(buyer_id) on delete cascade
);

CREATE SEQUENCE delivery_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;   

create or replace trigger TRG_Buyer_delivery
AFTER INSERT ON member_buyer
for each row
BEGIN
insert into list_delivery (BUYER_ID, ADDRESS, RECEIVER_NAME, RECEIVER_PHONE)
values (:new.buyer_id, :new.address, :new.name, :new.tel);
END;
     
   
 create table member_seller(               -- �뙋留ㅼ옄 �뀒�씠釉�
seller_id varchar2(16) not null,      -- �뙋留ㅼ옄 ID (湲곕낯�궎)
password varchar2(100) not null,       -- 鍮꾨�踰덊샇(*�븫�샇�솕�븣臾몄뿉 �겕湲곕뒛由�)
shop_name varchar2(16) not null,      -- �긽�샇紐�
representative varchar2(16) not null, -- ���몴�옄
address varchar2(100) not null,       -- 二쇱냼
manager_phone varchar2(13) not null,  -- �떞�떦�옄 �뿰�씫泥�
manager_email varchar2(33) not null,  -- �떞�떦�옄 �씠硫붿씪
manager_name varchar2(16) not null,   -- �떞�떦�옄 �씠由�
mail_order_report_num varchar2(20) not null,  -- �넻�떊�뙋留ㅼ떊怨좊쾲�샇
mail_order_report_img varchar2(200) not null,
mail_order_report_img_path varchar2(100) not null,
bank_name varchar2(20) not null,
bank_account varchar2(20) not null,   -- �젙�궛��湲덉엯湲덇퀎醫�
seller_reg_num number not null,       -- �뙋留ㅼ옄 �벑濡앸쾲�샇
seller_grade number(2,1) default 0 not null,        -- �뙋留ㅼ옄 �벑湲� 
member_type varchar2(10) default 'SELLER' not null,          -- 硫ㅻ쾭���엯 (�뙋留ㅼ옄) (援щℓ�옄:B �뙋留ㅼ옄:S 愿�由ъ옄:A)
del_flag char(1) default 'N' not null,            -- �깉�눜�뿬遺� (Y,N�쑝濡� 援щ텇)
join_date date default sysdate not null,              -- �쉶�썝媛��엯�씪
wthdr_date date,                        -- �쉶�썝�깉�눜�씪
profile_img varchar2(200),
profile_img_path varchar2(100),
last_loginDate date default sysdate,
constraint member_seller_seller_id_pk primary key(seller_id)
);

CREATE SEQUENCE seller_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;     

create or replace trigger TRG_seller_account
AFTER INSERT ON member_seller
for each row
BEGIN
insert into all_account (account_ID, account_pw, account_type)
values (:new.seller_id, :new.password, :new.member_type);
END;    
    
create table board_faq(          -- �옄二쇰Щ�뒗吏덈Ц 寃뚯떆�뙋
num number not null,         -- 由ъ뒪�듃 踰덊샇 (湲곕낯�궎)
title varchar2(50),          -- 寃뚯떆�뙋 �젣紐�
content varchar2(2000),      -- 寃뚯떆�뙋 �궡�슜
boarddate date,
constraint board_faq_num_pk primary key(num)
);

create table board_notice(            -- 怨듭��궗�빆
    num number not null,                -- 怨듭��궗�빆 湲�踰덊샇
    title varchar2(1600) not null,      -- 怨듭��궗�빆 �젣紐�
    content varchar2(4000) not null,    -- 怨듭��궗�빆 湲��궡�슜
    hit number not null,                   -- 議고쉶�닔
    register_date date not null            -- 怨듭��궗�빆 �벑濡앹씪
    
);

create table board_product(                     -- �뙋留ㅺ쾶�떆�뙋
    board_id varchar2(32) not null,             -- 寃뚯떆�뙋 ID (湲곕낯�궎)
    seller_id varchar2(16) not null,            -- �옉�꽦�옄 (member_seller�뀒�씠釉� �쇅�옒�궎)
    board_num number not null,                  -- 寃뚯떆�뙋 踰덊샇
    title varchar2(100) not null,               -- 寃뚯떆�뙋 �씠由�
    price number not null,                      -- �뙋留ㅺ�
    delivery_price number not null,             -- 諛곗넚鍮�
	quantity number not null,                   -- �닔�웾
    satisfaction number(2,1),                   -- �룊媛��젏�닔
    content varchar2(2000) not null,            -- 寃뚯떆�뙋 �궡�슜
    register_date date not null,                -- 寃뚯떆湲� �벑濡앹씪
    category_1 number not null,                 -- 1李� 移댄뀒怨좊━ (遺꾨쪟)
    category_2 number not null,                 -- 2李� 移댄뀒怨좊━ (�긽�뭹)
    category_local number not null,             -- �썝�궛吏� 肄붾뱶 (吏��뿭 遺꾨쪟)
    sales_producer varchar2(32) not null,       -- �긽�뭹�젙蹂� (�뙋留ㅼ깮�궛�옄)
    product_name varchar2(32) not null,         -- �긽�뭹�젙蹂� (�긽�뭹紐�)
    product_weight varchar2(32) not null,       -- �긽�뭹�젙蹂� (�긽�뭹以묐웾)
    product_size varchar2(64) not null,         -- �긽�뭹�젙蹂� (�긽�뭹�겕湲�)
    product_country varchar2(32) not null,      -- �긽�뭹�젙蹂� (�썝�궛吏�)
    date_manufacture varchar2(32) not null,     -- �긽�뭹�젙蹂� (�젣議곕뀈�썡�씪)
    best_before_date varchar2(32) not null,     -- �긽�뭹�젙蹂� (�뭹吏덉쑀吏�湲고븳)
    transgenic varchar2(32) not null,           -- �긽�뭹�젙蹂� (�쑀�쟾�옄 蹂��삎 �냽�닔�궛臾� �몴�떆)
    storage_method varchar2(32) not null,       -- �긽�뭹�젙蹂� (蹂닿�諛⑸쾿)
    consumer_consulation varchar2(16) not null, -- �긽�뭹�젙蹂� (�냼鍮꾩옄�긽�떞臾몄쓽)
	thumbnail_origin varchar2(100),             -- �뜽�꽕�씪 �씠誘몄� �썝蹂� �씠由�
	thumbnail_thum varchar2(100),               -- �뜽�꽕�씪 �씠誘몄� �씠由�
	product_origin_1 varchar2(100),             -- ���몴 �씠誘몄�1 �씠由�
	product_thum_1 varchar2(100),               -- ���몴 �씠誘몄�1 �뜽�꽕�씪 �씠由�
	product_origin_2 varchar2(100),             -- ���몴 �씠誘몄�2 �씠由�
	product_thum_2 varchar2(100),               -- ���몴 �씠誘몄�2 �뜽�꽕�씪 �씠由�
	product_origin_3 varchar2(100),             -- ���몴 �씠誘몄�3 �씠由�
	product_thum_3 varchar2(100),               -- ���몴 �씠誘몄�3 �뜽�꽕�씪 �씠由�
	product_origin_4 varchar2(100),             -- ���몴 �씠誘몄�4 �씠由�
	product_thum_4 varchar2(100),               -- ���몴 �씠誘몄�4 �뜽�꽕�씪 �씠由�
	content_origin varchar2(100),               -- 寃뚯떆湲� 蹂몃Ц �씠誘몄� �씠由�
    thumbnail_origin_path varchar2(100),        -- �뜽�꽕�씪 �썝蹂� 寃쎈줈
    thumbnail_thum_path varchar2(100),          -- �뜽�꽕�씪 �뜽�꽕�씪 寃쎈줈
    product_origin_path varchar2(100),          -- ���몴�씠誘몄� �썝蹂� 寃쎈줈
    product_thum_path varchar2(100),            -- ���몴�씠誘몄� �뜽�꽕�씪 寃쎈줈
    content_origin_path varchar2(100),          -- 蹂몃Ц�씠誘몄� �썝蹂� 寃쎈줈
    sale_status char(1) not null,               -- �뙋留ㅼ뿬遺� (Y, N�쑝濡� 援щ텇)
    hit number not null,                        -- �뙋留ㅼ닔
    read_count number not null,                 -- 議고쉶�닔
    constraint board_product_board_id_pk primary key(board_id)
);

create table wish_list(
    wish_id varchar2(32) not null,         -- 위시리스트 ID값 (기본키, 랜덤생성)
    buyer_id varchar2(16) not null,        -- 구매자 ID (member_buyer테이블 외래키)
    board_id varchar2(32) not null,        -- 판매게시판 ID (board_product테이블 외래키)
    title varchar2(100) not null,               -- 게시판 이름
    price number not null,                      -- 판매가
    thumbnail_thum varchar2(100),               -- 썸네일 이미지 이름
    thumbnail_thum_path varchar2(100),          -- 썸네일 썸네일 경로
    constraint wish_list_wish_id_pk primary key(wish_id)
);

create table product_cart(          -- �옣諛붽뎄�땲
    cart_id varchar2(32) not null,  -- �옣諛붽뎄�땲ID (湲곕낯�궎, �옖�뜡肄붾뱶 �깮�꽦)
    board_id varchar2(32) not null, -- �뙋留ㅺ� ID
    buyer_id varchar2(16) not null, -- 援щℓ�옄 ID (member_buyer�뀒�씠釉� �쇅�옒�궎)
    quantity number,                -- �닔�웾
    constraint product_cart_cart_id_pk primary key(cart_id)
);


create table board_review(              -- 상품후기 게시판
    review_id varchar2(32) not null,    -- 리뷰글 ID (기본키)
    review_num number not null,         -- 리뷰글 번호
    board_id varchar2(32) not null,     -- 게시판 ID
    buyer_id varchar2(32) not null,     -- 구매자 ID
    order_id varchar2(32) not null,     -- 주문번호 (order_record테이블 외래키)
    title varchar2(100) not null,       -- 판매글 제목
    content varchar2(200) not null,     -- 글내용
    satisfaction number(2,1) not null,  -- 구매만족도(별점)
    delivery_satisfaction number(2,1) not null,  -- 배달 속도
    register_date date not null,        -- 작성일
    review_img_path varchar2(50),       -- 작성 후기글 이미지 경로
    review_img_name varchar2(100),       -- 작성 후기글 이미지 이름
    constraint board_review_review_id_pk primary key(review_id)
);

create or replace trigger TRG_board_review
AFTER INSERT ON board_review
for each row
BEGIN
insert into save_point (SP_STATUS, SP_POINT, SP_CONTENT, order_id, SP_APPLICATION_DATE, BUYER_ID, POINT_NUM)
values ('적립', '500', '상품후기 작성으로 인한 적립금 지급+',:new.order_id,sysdate,:new.buyer_id,point_num_seq.nextval);
update member_buyer SET save_point = save_point + 500 WHERE buyer_id = :new.buyer_id;
END;

create table comment_review(               -- 상품 리뷰 댓글
    review_cmt_id varchar2(32) not null,   -- 리뷰댓글 ID (기본키)
    review_cmt_num number not null,        -- 리뷰댓글 번호 (각 댓글당 1부터 적용)
    review_id varchar2(32),                -- 상품후기게시판 ID (board_review테이블 외래키)
    content varchar2(200) not null,        -- 글내용
    register_date date not null,           -- 작성일
    seller_id varchar2(16) not null,       -- 작성자 (해당 글의 판매자)
    constraint comment_review_cmt_id_pk primary key(review_cmt_id),
    constraint comment_review_id_fk foreign key(review_id)
        references board_review(review_id) on delete cascade
);

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

alter table order_record modify seller_id varchar2(32);
alter table order_record modify buyer_id varchar2(32);

select * from order_record; 

commit;

/*상품문의*/
create table board_qna(                -- 상품 문의 게시판
    qna_id varchar2(50) not null,            -- Qna게시판 ID (기본키)
    qna_num number not null,           -- Qna게시판 ID (기본키)
    board_id varchar2(32) not null,    -- 게시판 ID (board_product테이블 외래키)
    seller_id varchar2(32) not null,   -- 판매자 ID
    buyer_id varchar2(32) not null,    -- 작성자
    qna_status number not null,        -- 문의종류
    answer_status number not null,     -- 답변여부
    register_date date not null,       -- 등록일자
    title varchar2(200) not null,      -- 글제목
    content varchar2(500) not null,    -- 글내용
    recommend varchar2(500),           -- 답변
    recommend_date date,               -- 답변일
    secret_flag number not null,       -- 비밀글 여부
    constraint board_qna_qna_id_pk primary key(qna_id)
);



----------------------------------------------------------------------
--
--SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;



