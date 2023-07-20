insert into product_tb
values
	(0,'상의1', 10000),
	(0,'상의2', 20000),
	(0,'상의3', 30000);
    
select * from product_tb;

insert into product_color_tb
values
	(0, 'black'),
	(0, 'white'),
	(0, 'red'),
	(0, 'blue'),
	(0, 'green');

select * from product_color_tb;

insert into registered_product_tb
values
	(0, 1, 3),
	(0, 1, 4),
	(0, 1, 5),
	(0, 2, 1),
	(0, 2, 3),
	(0, 3, 2),
	(0, 3, 4);
    
select 
	*,
    (select color_name from product_color_tb pct where pct.product_color_id = rpt.product_color_id) as Color_name
    # pct.product_color_id = rpt.product_color_id일때 Color_name칼럼 하나더 만들어서 color_name가져와라 -> 숫자대신
from 
	registered_product_tb as rpt
where
	product_color_id = (select
							product_color_id
						from
							product_color_tb
						where
							color_name = 'black');
# 색을 찾고싶다 서브쿼리 이용
-- (select
-- 		*
-- from
-- 	product_color_tb
-- where
-- 	color_name = 'black';)
    
select 
	*
from
	registered_product_tb rpt
    # 칼럼이 아닌 테이블일 때 띄워쓰기로 as 대체
	left outer join product_color_tb pct on(pct.product_color_id = rpt.product_color_id)
    # join: 두개의 tb를 합치겠다 join은 곱하기 pk기준으로 조립, on: 합칠때 조건(조건이 참인경우에만 붙이겠다)
    # on-> pct에 걸어둠 기준중요 pct의 color_id가 rpt의 color_id와 같을 때 = pct.product_color_id = rpt.product_color_id
    # rpt.product_color_id = pct.product_color_id로 쓰지 말것
    # 굳이 rpt.product_color_id = pct.product_color_id를 쓰고 싶으면 
    # product_color_tb pct left outer join registered_product_tb rpt on(rpt.product_color_id = pct.product_color_id) 자리 바꿔라
where 
	pct.color_name = 'red';