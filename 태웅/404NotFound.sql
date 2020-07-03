/*������*/
create table member_buyer(          -- ������ ���̺�
    buyer_id varchar2(16) not null, -- ������ ID (�⺻Ű)
    password varchar2(16) not null, -- ��й�ȣ
    name varchar2(16) not null,     -- �̸�
    tel varchar2(13) not null,      -- ����ó
    email varchar2(33) not null,    -- �̸���
    address varchar2(100) not null, -- �ּ�
    buyer_num number not null,      -- ������ ��Ϲ�ȣ
    grade char(1) default 0 not null,         -- ������ ���
    member_type char(1) default 'B' not null,    -- ���Ÿ�� (������:B �Ǹ���:S ������:A)
    del_flag char(1) default 'N' not null,      -- Ż�𿩺� (Y,N���� �����ؼ� ����)
    join_date date default sysdate not null,        -- ȸ��������
    wthdr_date date,                -- ȸ��Ż����
    save_point number  default 0 not null,     -- ������
    profile_img varchar2(150),
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
    password varchar2(16) not null,       -- ��й�ȣ
    license varchar2(16) not null,        -- ����ڵ�Ϲ�ȣ
    shop_name varchar2(16) not null,      -- ��ȣ��
    representative varchar2(16) not null, -- ��ǥ��
    manager_phone varchar2(13) not null,  -- ����� ����ó
    manager_email varchar2(33) not null,  -- ����� �̸���
    manager_name varchar2(16) not null,   -- ����� �̸�
    corp_reg_num varchar2(12) not null,   -- ���ε�Ϲ�ȣ
    sales_ref_num varchar2(20) not null,  -- ����ǸŽŰ��ȣ
    method_payment varchar2(20) not null, -- �����ݼ��ɹ��
    bank_account varchar2(20) not null,   -- �������Աݰ���
    seller_reg_num number not null,       -- �Ǹ��� ��Ϲ�ȣ
    seller_grade char(1) default 0 not null,        -- �Ǹ��� ���  (������:B �Ǹ���:S ������:A)
    member_type char(1) default 'S' not null,          -- ���Ÿ�� (�Ǹ���)
    del_flag char(1) default 'N' not null,            -- Ż�𿩺� (Y,N���� ����)
    join_date date default sysdate not null,              -- ȸ��������
    wdf_date date,                        -- ȸ��Ż����
    constraint member_seller_seller_id_pk primary key(seller_id)
);

CREATE SEQUENCE seller_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;
     