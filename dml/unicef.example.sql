# 1. 각 계정별로 어떤 기부를 했는지
select
	gt.giver_id,
    gpt.giving_name,
    gt.giving_total
from
	giver_tb gt
    left outer join giving_page_tb gpt on(gpt.giving_page_id = gt.giving_page_id)
where
	gpt.giving_name != 'test';  --  giving_name이 'test'인 것을 제외

        
# 2. 센터별로 총 기부액이 얼마인지
select
	ct.center_id,
	ct.center_name,
    sum(gt.giving_total) as center_giving_total
from
	center_tb ct
    left outer join giving_page_tb gpt on(gpt.center_id = ct.center_id)
    left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
where
	gpt.giving_name != 'test'
group by 
	ct.center_id;

# 3. 기부 항목별 총 기부액
select 
	gpt.giving_name,
    sum(gt.giving_total) as giving_name_total
 from
	giver_tb gt 
	left outer join giving_page_tb gpt on(gpt.giving_page_id = gt.giving_page_id)
where
	gpt.giving_name != 'test'
group by
    gpt.giving_name;

# 4. category별 총 기부액
select
	gct.giving_category_id,
	gct.giving_category_name,
    sum(gt.giving_total) as giving_category_total
from
	giving_page_tb gpt
    left outer join giving_category_tb gct on(gct.giving_category_id = gpt.category_id)
    left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
group by
	gct.giving_category_id;