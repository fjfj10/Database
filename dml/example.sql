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
	address_tb adt
	left outer join user_tb ut on(ut.user_id = adt.user_id)
where
	ut.name = '상구';
    
# 2. 상품별 총 판매 수량, 판매 총액을 조회하시오.(하나의 select문 안에서)
select
	product_sales_rate_tb.product_name,
    sum(product_sales_rate_tb.count_number) as total_order_stock,
    sum(product_sales_rate_tb.product_price) as total_product_price
from
	(select
		pt.product_name,
		odt.count_number,
		pt.product_price
	from
		order_detail_tb odt
		left outer join product_tb pt on(pt.product_id = odt.product_id)) as product_sales_rate_tb
group by
	product_name;
    
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
    
# 4. address_tb에 sido컬럼을 참고해서 지역별로 판매된 상품의 총액을 조회하시오(null은 조회하면 안됌)
select
	adt.address_sido,
    sum(pt.product_price) as total_sido_price
from
	address_tb adt
    left outer join order_tb ot on(ot.address_id = adt.address_id)
    left outer join order_detail_tb odt on(odt.order_id = ot.order_id)
    left outer join product_tb pt on(pt.product_id = odt.product_id)
group by
	adt.address_sido;

# 5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매 되었고 판매총액은 얼마인지 조회하시오
select
	sum(count_number),
    sum(product_price)
from
	product_tb pt
	left outer join order_detail_tb odt on(odt.product_id = pt.product_id)
where
	pt.product_name like '나이키%';
    
    