insert into product_tb
values 
	(20230701, '상품1'),
	(20230702, '상품2'),
	(20230703, '상품3'),
	(20230704, '상품4'),
	(20230705, '상품5');

create view product_view as   
select * from product_tb;

#시험에 해당 커럼을 key값으로 잡는법 문제 나옴
create index product_code_index on product_tb(product_code);
# Key_name이 product_code인 안덱스 생성 = product_code를 인덱스로 쓰겠다(product_code을 key값(=빠른조회 가능)으로 만듦)

show index from user_tb;
show index from product_tb;
#user_tb는 PK가 설정되어있기 때문에 자동으로 잡혀있음 

show full tables in study3 where table_type like 'VIEW';
show full tables in study3 where table_type = 'VIEW';
# 만들어진 view를 전부 조회할때 사용

show full tables in study3;
# table 전체 조회 view도 같이 나옴 table과 table_type이 같이 나옴
show tables;
# table 전체 조회 view도 같이 나옴 table만 나옴