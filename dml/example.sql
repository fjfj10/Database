/*

1. 검색창에 상구라고 검색했을 때 해당 user에 등록된 모든 주소를 조회하시오
2. 상품별 총 판매 수량, 판매 총액을 조회하시오.(하나의 select문 안에서)
3. 카테고리별 등록된 상품이 몇개식 있는지 조회하시오(count)
4. address_tb에 sido컬럼을 참고해서 지역별로 판매된 상품의 총액을 조회하시오(null은 조회하면 안됌)
5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매 되었고 판매총액은 얼마인지 조회하시오
*/

# 1. 검색창에 상구라고 검색했을 때 해당 user에 등록된 모든 주소를 조회하시오
select
	ut.name,
    adt.address
from
-- ut가 기준이 되어야한다 왜? 넣어줄 값이 ut.name 이기 때문
	address_tb adt
	left outer join user_tb ut on(ut.user_id = adt.user_id)
where
	ut.name = '상구';
-- 답
-- select
-- 	at.* address_tb에 대한 정보조회
-- from
-- 	user_tb ut ut가 기준이 되어야한다 왜? 넣어줄 값이 ut.name 이기 때문
--  left outer join address_tb at on(at.user_id = ut.user_id)
-- where
-- 	ut.name = '상구';
    
# 2. 상품별 총 판매 수량, 판매 총액을 조회하시오.(하나의 select문 안에서)
select
	product_sales_rate_tb.product_id,
	product_sales_rate_tb.product_name,
    sum(product_sales_rate_tb.count_number) as total_order_stock,
    sum(product_sales_rate_tb.product_price * odt.count_number) as total_product_price
from
	(select
		pt.product_id,
        pt.product_name,
		odt.count_number,
		pt.product_price
	from
		order_detail_tb odt
		left outer join product_tb pt on(pt.product_id = odt.product_id)) as product_sales_rate_tb
group by
	product_id;
-- 답(서브쿼리 없이 가능)
-- # 2
-- select
-- 	odt.product_id,
-- 	pt.product_name,
--     sum(odt.count_number) as total_order_count,
--     sum(pt.product_price * odt.count_number) as total_product_price
-- from
-- 	order_detail_tb odt
--  left outer join product_tb pt on(pt.product_id = odt.product_id)
-- group by
-- 	odt.product_id
-- 	pt.product_name;

# 3. 카테고리별 등록된 상품이 몇개씩 있는지 조회하시오(count)
select
	ct.category_id,
    ct.category_name,
    count(pt.product_name) as product_count
from
	category_tb ct
    left outer join product_tb pt on(pt.category_id = ct.category_id)
group by
	ct.category_id;
    
-- 답 (결과는 같음)
-- # 3
-- select
-- 	pt.category_id,
--  ct.category_name,
--  count(pt.product_id) as total_product_count
-- from
-- 	product_tb pt
--  left outer join category_tb ct on(ct.category_id = pt.category_id)
-- group by
-- 	pt.category_id,
--  ct.category_name;
    
# 4. address_tb에 sido컬럼을 참고해서 지역별로 판매된 상품의 총액을 조회하시오(null은 조회하면 안됌)
select
	adt.address_sido,
    ifnull(sum(pt.product_price * odt.count_number), 0) as total_sido_price
from
	address_tb adt
    left outer join order_tb ot on(ot.address_id = adt.address_id)
    left outer join order_detail_tb odt on(odt.order_id = ot.order_id)
    left outer join product_tb pt on(pt.product_id = odt.product_id)
group by
	adt.address_sido;
-- 답
-- select
-- 	at.address_sido,
--  ifnull(sum(pt.product_price * odt.count_number), 0) as total_order_price
-- from
-- 	address_tb at
--  left outer join order_tb ot on(ot.address_id = at.address_id)
-- 	left outer join order_detail_tb odt on(odt.order_id = ot.order_id)
--  left outer join product_tb pt on(pt.product_id = odt.product_id)
-- group by
-- 	at.address_sido;

# 5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매 되었고 판매총액은 얼마인지 조회하시오
select
	sum(count_number),
    sum(product_price* odt.count_number)
from
	product_tb pt
	left outer join order_detail_tb odt on(odt.product_id = pt.product_id)
where
	pt.product_name like '나이키%'; -- 이러면 나이키가 앞에 붙은것만 조회됨 '%나이키%'로 변경해 주는 것이 좋다 지금은 나이키가 앞에 붙은것 밖에 없어서 답과 같은 결과가 나옴  
-- 답    
select
	'나이키' as search_value,
    sum(odt.count_number) as total_order_count,
    sum(pt.product_price * odt.count_number) as total_order_price
from
	order_detail_tb odt    -- 먼저 판매된것들 중에서 가지고 온다 
    left outer join product_tb pt on(pt.product_id = odt.product_id)
where
	pt.product_name like '%나이키%';
    