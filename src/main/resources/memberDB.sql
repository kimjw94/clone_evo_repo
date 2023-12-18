
-- 	아이디/패스워드/이름/닉네임/주소/판매작 구매자여부 n/회사명 n/회사주소 n/계좌 n/fk 시리얼 넘버 n/
Create table EVO_MEMBER(
	m_id varchar2(15 char) primary key,
	m_password varchar2(15 char) not null,
	m_name varchar2(5 char)not null,
	m_alias varchar2(15 char)not null,
	m_phone varchar2(15 char)not null,
	m_address_num Number(7) not null,
	m_address_kor varchar2(50 char)not null,
	m_buy_sell Number(1),
	m_company_name varchar2(20 char),
	m_company_address_num Number(7),
	m_company_address_kor varchar2(50 char),
	m_account_name varchar2(10 char),
	m_account_number varchar2(20 char)
	);
	
drop table EVO_MEMBER cascade constraint purge;

select * from EVO_MEMBER;

update EVO_MEMBER set m_buy_sell = 1 WHERE m_id = 'test';





-- 고객문의 DB
create table helpper_r_category(
    r_cate_code number (3) primary key,
    r_cate_name varchar2 (20) not null
);

insert into helpper_r_category values(10, '구매자 문의');
insert into helpper_r_category values(20, '판매자 문의');

create table helpper_s_category(
    s_cate_code number(5) not null,
      constraint fk_s_cate_code foreign key(s_cate_code)
         references helpper_r_category(r_cate_code) on delete cascade,
    s_s_cate_code number(5) primary key not null,
    s_s_cate_name varchar2 (50) not null
);

insert into helpper_s_category values(10, 11, '교환/반품');
insert into helpper_s_category values(10, 12, '구매 취소');
insert into helpper_s_category values(10, 13, '사이트 이용');
insert into helpper_s_category values(10, 14, '배송');
insert into helpper_s_category values(20, 21, '정산 관련 문의');
insert into helpper_s_category values(20, 22, '환불 확인 문의');
insert into helpper_s_category values(20, 23, '개선 문의');
insert into helpper_s_category values(20, 24, '상품 등록/수정 문의');
insert into helpper_s_category values(20, 25, '판매자 정보수정 문의');

select * from helpper_r_category;
select * from helpper_s_category;

drop table h_form cascade constraint purge;

create table h_form(
    h_num number (9) primary key not null,
    h_m_id varchar2 (20) not null,
        constraint fk_h_m_id foreign key(h_m_id)
            references EVO_MEMBER(m_id) on delete cascade,
    h_title varchar2 (30) not null,
    h_cont varchar2 (255) not null,
    h_category varchar2 (50) not null,
    h_category_code varchar2 (50) not null
);

SELECT * FROM h_form;

CREATE SEQUENCE seq_h_num
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
drop sequence h_num_seq;