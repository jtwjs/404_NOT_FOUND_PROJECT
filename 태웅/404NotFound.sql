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
    save_point number  default 0 not null,     -- 적립금
    constraint member_buyer_buyer_id_pk primary key(buyer_id)
);


/*buyer_num Sequence*/
CREATE SEQUENCE buyer_num_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOCYCLE;