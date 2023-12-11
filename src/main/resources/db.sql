
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

delete from EVO_MEMBER
where m_id = 'test'
;

create table evo_product(
   p_product_no decimal(10, 0) primary key,
   p_m_id varchar2(15 char) not null,
   	  constraint fk_p_m_id foreign key(p_m_id)
   	  references evo_member(m_id) on delete cascade,
   p_category_code number(8) not null,
      constraint fk_category_code foreign key(p_category_code)
      references evo_category(c_category_code) on delete cascade,
   p_price number(6) not null,
   p_info varchar2(500 char) not null,
   p_photo varchar2(100 char) not null,
   p_addDay DATE not null,
   p_view decimal(10, 0)
);

select * from evo_product;

drop table evo_product cascade constraint purge;

create table evo_category(
   c_category_code number(8) primary key,
   c_category_name varchar2(15) not null
);

drop table evo_category cascade constraint purge;


select * from evo_category;

insert into evo_category values (10000, '상의');
insert into evo_category values (20000, '아우터');
insert into evo_category values (30000, '바지');
insert into evo_category values (40000, '원피스');
insert into evo_category values (50000, '스커트');
insert into evo_category values (60000, '신발');
insert into evo_category values (70000, '가방');
insert into evo_category values (80000, '모자');
insert into evo_category values (90000, '액세서리');


create table evo_category_detail(
   d_category_code   number(8) not null,
      constraint fk_d_category_code foreign key(d_category_code)
         references evo_category(c_category_code) on delete cascade,
   d_category_detail_code number(10) not null,
   d_category_detail_name varchar2(30) not null
);

drop table evo_category_detail cascade constraint purge;

select * from evo_category_detail;

insert into evo_category_detail values(10000, 10001, '후드티');
insert into evo_category_detail values(10000, 10002, '니트/스웨터');
insert into evo_category_detail values(10000, 10003, '맨투맨');
insert into evo_category_detail values(10000, 10004, '긴소매티셔츠');
insert into evo_category_detail values(10000, 10005, '반소매티셔츠');
insert into evo_category_detail values(10000, 10006, '셔츠/블라우스');
insert into evo_category_detail values(10000, 10007, '기타 상의');

insert into evo_category_detail values(20000, 20001, '후드집업');
insert into evo_category_detail values(20000, 20002, '무스탕');
insert into evo_category_detail values(20000, 20003, '가디건');
insert into evo_category_detail values(20000, 20004, '플리스/뽀글이');
insert into evo_category_detail values(20000, 20005, '롱패딩');
insert into evo_category_detail values(20000, 20006, '숏패딩');
insert into evo_category_detail values(20000, 20007, '기타 아우터');

insert into evo_category_detail values(30000, 30001, '데님 팬츠');
insert into evo_category_detail values(30000, 30002, '코튼 팬츠');
insert into evo_category_detail values(30000, 30003, '트레이닝/조거팬츠');
insert into evo_category_detail values(30000, 30004, '숏 팬츠');
insert into evo_category_detail values(30000, 30005, '슈트팬츠/슬랙스');
insert into evo_category_detail values(30000, 30006, '기타 바지');

insert into evo_category_detail values(40000, 40001, '미니 원피스');
insert into evo_category_detail values(40000, 40002, '미디 원피스');
insert into evo_category_detail values(40000, 40003, '맥시 원피스');

insert into evo_category_detail values(50000, 50001, '미니 스커트');
insert into evo_category_detail values(50000, 50002, '미디 스커트');
insert into evo_category_detail values(50000, 50003, '롱스커트');

insert into evo_category_detail values(60000, 60001, '구두');
insert into evo_category_detail values(60000, 60002, '로퍼');
insert into evo_category_detail values(60000, 60003, '플랫 슈즈');
insert into evo_category_detail values(60000, 60004, '슬리퍼');
insert into evo_category_detail values(60000, 60005, '샌들');
insert into evo_category_detail values(60000, 60006, '부츠');
insert into evo_category_detail values(60000, 60007, '기타 신발');

insert into evo_category_detail values(70000, 70001, '백팩');
insert into evo_category_detail values(70000, 70002, '메신저/크로스백');
insert into evo_category_detail values(70000, 70003, '숄더백');
insert into evo_category_detail values(70000, 70004, '에코백');
insert into evo_category_detail values(70000, 70005, '캐리어');
insert into evo_category_detail values(70000, 70006, '클러치백');
insert into evo_category_detail values(70000, 70007, '기타 가방');

insert into evo_category_detail values(80000, 80001, '캡/야구모자');
insert into evo_category_detail values(80000, 80002, '비니');
insert into evo_category_detail values(80000, 80003, '베레모');
insert into evo_category_detail values(80000, 80004, '기타 모자');

insert into evo_category_detail values(90000, 90001, '귀걸이');
insert into evo_category_detail values(90000, 90002, '목걸이');
insert into evo_category_detail values(90000, 90003, '머플러');
insert into evo_category_detail values(90000, 90004, '장갑');
insert into evo_category_detail values(90000, 90005, '마스크');
insert into evo_category_detail values(90000, 90006, '기타 악세사리');


select p_category_code, p_category_detail_name  
        from evo_category_detail
       where p_category_code = (
                         select p_category_code
                           from evo_category
                          where p_category_code = 10000
                         )

