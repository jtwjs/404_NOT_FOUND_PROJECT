create table member_buyer(          -- ������ ���̺�
    buyer_id varchar2(16) not null, -- ������ ID (�⺻Ű)
    password varchar2(16) not null, -- ��й�ȣ
    name varchar2(16) not null,     -- �̸�
    tel varchar2(13) not null,      -- ����ó
    email varchar2(33) not null,    -- �̸���
    address varchar2(100) not null, -- �ּ�
    buyer_num number not null,      -- ������ ��Ϲ�ȣ
    grade char(1) not null,         -- ������ ���
    member_type char(1) not null,    -- ���Ÿ�� (������)
    del_flag char(1) not null,      -- Ż�𿩺� (Y,N���� �����ؼ� ����)
    join_date date not null,        -- ȸ��������
    wthdr_date date,                -- ȸ��Ż����
    save_point number  default 0 not null,     -- ������
    constraint member_buyer_buyer_id_pk primary key(buyer_id)
);


/*buyer_num Sequence*/
CREATE SEQUENCE buyer_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;