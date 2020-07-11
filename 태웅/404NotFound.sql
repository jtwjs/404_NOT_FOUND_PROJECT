/*������*/
create table member_buyer(          -- ������ ���̺�
    buyer_id varchar2(16) not null, -- ������ ID (�⺻Ű)
    password varchar2(100) not null, -- ��й�ȣ (*��ȣȭ������ ũ��ø�)
    name varchar2(16) not null,     -- �̸�
    tel varchar2(13) not null,      -- ����ó
    email varchar2(33) not null,    -- �̸���
    address varchar2(100) not null, -- �ּ�
    buyer_num number not null,      -- ������ ��Ϲ�ȣ
    grade char(1) default 0 not null,         -- ������ ���
    member_type varchar(10) default 'BUYER' not null,    -- ���Ÿ�� (������:B �Ǹ���:S ������:A)
    del_flag char(1) default 'N' not null,      -- Ż�𿩺� (Y,N���� �����ؼ� ����)
    join_date date default sysdate not null,        -- ȸ��������
    wthdr_date date,                -- ȸ��Ż����
    save_point number  default 0 not null,     -- ������
    profile_img varchar2(200),          --�����ʻ���
    last_loginDate date default sysdate,                --��������������
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
     
     /*�Ǹ���*/
     create table member_seller(               -- �Ǹ��� ���̺�
    seller_id varchar2(16) not null,      -- �Ǹ��� ID (�⺻Ű)
    password varchar2(100) not null,       -- ��й�ȣ(*��ȣȭ������ ũ��ø�)
    shop_name varchar2(16) not null,      -- ��ȣ��
    representative varchar2(16) not null, -- ��ǥ��
    address varchar2(100) not null,       -- �ּ�
    manager_phone varchar2(13) not null,  -- ����� ����ó
    manager_email varchar2(33) not null,  -- ����� �̸���
    manager_name varchar2(16) not null,   -- ����� �̸�
    mail_order_report_num varchar2(20) not null,  -- ����ǸŽŰ��ȣ
    mail_order_report_img varchar2(200) not null,
    bank_name varchar2(20) not null,
    bank_account varchar2(20) not null,   -- �������Աݰ���
    seller_reg_num number not null,       -- �Ǹ��� ��Ϲ�ȣ
    seller_grade char(1) default 0 not null,        -- �Ǹ��� ��� 
    member_type varchar2(10) default 'SELLER' not null,          -- ���Ÿ�� (�Ǹ���) (������:B �Ǹ���:S ������:A)
    del_flag char(1) default 'N' not null,            -- Ż�𿩺� (Y,N���� ����)
    join_date date default sysdate not null,              -- ȸ��������
    wthdr_date date,                        -- ȸ��Ż����
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
    
    
 create table board_faq(          -- ���ֹ������� �Խ���
num number not null,         -- ����Ʈ ��ȣ (�⺻Ű)
title varchar2(50),          -- �Խ��� ����
content varchar2(2000),      -- �Խ��� ����
boarddate date,
constraint board_faq_num_pk primary key(num)
);

create table board_notice(            -- ��������

    num number not null,                -- �������� �۹�ȣ
    title varchar2(1600) not null,      -- �������� ����
    content varchar2(4000) not null,    -- �������� �۳���
    hit number not null,                   -- ��ȸ��
    register_date date not null            -- �������� �����
    
);
/*��ǰ���*/
drop table board_product;
create table board_product(                     -- �ǸŰԽ���
    board_id varchar2(32) not null,             -- �Խ��� ID (�⺻Ű)
    seller_id varchar2(16) not null,            -- �ۼ��� (member_seller���̺� �ܷ�Ű)
    board_num number not null,                  -- �Խ��� ��ȣ
    title varchar2(100) not null,               -- �Խ��� �̸�
    price number not null,                      -- �ǸŰ�
    delivery_price number not null,             -- ��ۺ�
	quantity number not null,                   -- ����
    satisfaction number(2,1),                   -- ������
    content varchar2(2000) not null,            -- �Խ��� ����
    register_date date not null,                -- �Խñ� �����
    category_1 number not null,                 -- 1�� ī�װ� (�з�)
    category_2 number not null,                 -- 2�� ī�װ� (��ǰ)
    category_local number not null,             -- ������ �ڵ� (���� �з�)
    sales_producer varchar2(32) not null,       -- ��ǰ���� (�ǸŻ�����)
    product_name varchar2(32) not null,         -- ��ǰ���� (��ǰ��)
    product_weight varchar2(32) not null,       -- ��ǰ���� (��ǰ�߷�)
    product_size varchar2(64) not null,         -- ��ǰ���� (��ǰũ��)
    product_country varchar2(32) not null,      -- ��ǰ���� (������)
    date_manufacture varchar2(32) not null,     -- ��ǰ���� (���������)
    best_before_date varchar2(32) not null,     -- ��ǰ���� (ǰ����������)
    transgenic varchar2(32) not null,           -- ��ǰ���� (������ ���� ����깰 ǥ��)
    storage_method varchar2(32) not null,       -- ��ǰ���� (�������)
    consumer_consulation varchar2(16) not null, -- ��ǰ���� (�Һ��ڻ�㹮��)
	thumbnail_origin varchar2(100),             -- ����� �̹��� ���� �̸�
	thumbnail_thum varchar2(100),               -- ����� �̹��� �̸�
	product_origin_1 varchar2(100),             -- ��ǥ �̹���1 �̸�
	product_thum_1 varchar2(100),               -- ��ǥ �̹���1 ����� �̸�
	product_origin_2 varchar2(100),             -- ��ǥ �̹���2 �̸�
	product_thum_2 varchar2(100),               -- ��ǥ �̹���2 ����� �̸�
	product_origin_3 varchar2(100),             -- ��ǥ �̹���3 �̸�
	product_thum_3 varchar2(100),               -- ��ǥ �̹���3 ����� �̸�
	product_origin_4 varchar2(100),             -- ��ǥ �̹���4 �̸�
	product_thum_4 varchar2(100),               -- ��ǥ �̹���4 ����� �̸�
	content_origin varchar2(100),               -- �Խñ� ���� �̹��� �̸�
    thumbnail_origin_path varchar2(100),        -- ����� ���� ���
    thumbnail_thum_path varchar2(100),          -- ����� ����� ���
    product_origin_path varchar2(100),          -- ��ǥ�̹��� ���� ���
    product_thum_path varchar2(100),            -- ��ǥ�̹��� ����� ���
    content_origin_path varchar2(100),          -- �����̹��� ���� ���
    sale_status char(1) not null,               -- �Ǹſ��� (Y, N���� ����)
    hit number not null,                        -- �Ǹż�
    read_count number not null,                 -- ��ȸ��
    constraint board_product_board_id_pk primary key(board_id)
);



/*���ø���Ʈ*/
drop table wish_list;
create table wish_list(
    wish_id varchar2(32) not null,         -- ���ø���Ʈ ID�� (�⺻Ű, ��������)
    buyer_id varchar2(16) not null,        -- ������ ID (member_buyer���̺� �ܷ�Ű)
    board_id varchar2(32) not null,        -- �ǸŰԽ��� ID (board_product���̺� �ܷ�Ű)
    constraint wish_list_wish_id_pk primary key(wish_id)
);


/*�ֹ����*/
drop table order_record;
create table order_record(                   -- �ֹ����
    order_num number not null,               -- �ֹ���ȣ (�⺻Ű)
    order_id varchar2(32) not null,          -- �ֹ���ȣ ID
    board_id varchar2(32) not null,          -- ��ǰ�Ǹű� ID (member_buyer���̺� �ܷ�Ű)
    board_title varchar2(100) not null,      -- ��ǰ�Ǹű� ����
	seller_id varchar2(16) not null,         -- �Ǹ��� ID
	buyer_id varchar2(16) not null,          -- ������ ID
    amount number not null,                  -- ���ż���
    price number not null,                   -- ��ǰ �ݾ�
    delivery_price number not null,          -- ��ۺ�
    use_point number not null,               -- ����� ������
	tot_price number not null,               -- ���� �ݾ�
    status varchar2(16) not null,            -- �ֹ�����
    buyer_name varchar2(16) not null,        -- �ֹ��� �̸�
    buyer_phone varchar2(13) not null,       -- �ֹ��� ��ȣ
    buyer_email varchar2(33) not null,       -- �ֹ��� �̸���
    order_postalCode varchar2(5) not null,   -- �����ȣ
    order_address varchar2(100) not null,    -- ��� �ּ�
    order_name varchar2(16) not null,        -- ������ ��
    order_phone varchar2(13) not null,       -- ��� ����ó
    order_demand varchar2(200),              -- ��� �䱸����
    order_delivery varchar2(10) not null,    -- ��ۻ�
    order_invoicenum varchar2(20),           -- �����ȣ
    order_payment varchar2(20) not null,     -- �������
    order_account varchar2(20) not null,     -- ��������/ī���ȣ
    order_date date not null,                -- ������
    non_member_flag char(1) not null,        -- ��ȸ�� ���� ('Y', 'N' ���� ����)
    constraint order_record_order_num_pk primary key(order_num)
);
/*��ٱ���*/
drop table product_cart;
create table product_cart(          -- ��ٱ���
    cart_id varchar2(32) not null,  -- ��ٱ���ID (�⺻Ű, �����ڵ� ����)
    board_id varchar2(32) not null, -- �Ǹű� ID
    buyer_id varchar2(16) not null, -- ������ ID (member_buyer���̺� �ܷ�Ű)
    quantity number,                -- ����
    constraint product_cart_cart_id_pk primary key(cart_id)
);
 
 