
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
	m_account_number varchar2(20 char),
	m_serial_no number(10)
	);
	
drop table EVO_MEMBER;
select * from EVO_MEMBER;