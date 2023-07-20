# order_detall_tb + order_tb 
#user_tb에 들어있는 name이 상구인 사람의 구매 총액을 조회하시오
select * from order_detail_tb;
select
	ut.name,
    # 상품의 갯수를 정해준다 
    sum(pt.product_price * odt.count_number) as total_order_price
from
	order_detail_tb odt
    left outer join product_tb pt on(pt.product_id = odt.product_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
    left outer join address_tb adt on(adt.address_id = ot.address_id)
    left outer join user_tb ut on(ut.user_id = ot.user_id)
where
	ut.name = '상구'
group by
	ut.name;
    
# 2023-06-01 ~ 2023-06-07까지의 카테고리별 총 판매수량
select
	ct.category_name,
    sum(odt.count_number) as total_order_stock
from
	order_detail_tb odt
    # join은 필요한 것만 가지고 온다 굳이 여러개 가지고올 필요X
    left outer join product_tb pt on(pt.product_id = odt.product_id)
    left outer join category_tb ct on(ct.category_id = pt.category_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
where
	ot.order_date between '2023-06-01' and '2023-06-07'
group by
	ct.category_id;	


