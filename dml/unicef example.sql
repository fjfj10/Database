# 1. 각 계정별로 어떤 기부를 했는지
select
	gt.giver_id,
    gpt.giving_name,
    gt.giving_total
from
	giver_tb gt 
    left outer join giving_page_tb gpt on(gpt.giving_page_id = gt.giving_page_id)
where
	gpt.giving_name != 'test';	-- giving_name이 'test'인 것을 제외
-- 답
-- select
-- 	gvt.giver_id,
-- 	gvt.user_id,
-- 	ut.name,
--  gvt.giving_page_id,
--  gpt.story_title,
--  gvt.giving_total
-- from
-- 	giver_tb gvt 
--  left outer join user_tb ut on(ut.user_id = gvt.user_id)
--  left outer join giving_page_tb gpt on(gpt.giving_page_id = gvt.giving_page_id)     
-- group by
-- 	gvt.user_id;

# 2. 센터별로 총 기부액이 얼마인지
select
	ct.center_id,
	ct.center_name,
    ifnull(sum(gt.giving_total), 0) as center_giving_total
from
	center_tb ct
    left outer join giving_page_tb gpt on(gpt.center_id = ct.center_id)
    left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
where
	ct.center_name != 'test'	-- center_name이 'test'인 것을 제외
group by 
	ct.center_id;

-- 답
-- select
-- 	ct.center_id,
-- 	ct.center_name,
-- 	ct.center_address,
--  sum(gvt.giving_total) as total_giving_money
-- from
-- 	center_tb ct
--  left outer join giving_page_tb gpt on(gpt.center_id = ct.center_id)
--  left outer join giver_tb gvt on(gvt.giving_page_id = gpt.giving_page_id)
-- group by 
-- 	ct.center_id,
-- 	ct.center_name,
--  ct.center_address;


# 3. 기부 항목별 총 기부액
select 
	gpt.giving_name,
    ifnull(sum(gt.giving_total), 0) as giving_name_total
 from
 	giving_page_tb gpt
 	left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
where
	gpt.giving_name != 'test'	-- giving_name이 'test'인 것을 제외
group by
    gpt.giving_name;

-- 답
-- select 
-- 	gpt.giving_page_id,
-- 	gpt.giving_name,
-- 	ifnull(sum(gvt.giving_total), 0) as total_giving_money
-- from
-- 	giving_page_tb gpt
-- 	left outer join giver_tb gvt  on(gvt.giving_page_id = gpt.giving_page_id)
-- group by
-- 	gpt.giving_page_id,
-- 	gpt.giving_name;
    
    
# 4. category별 총 기부액
select
	gct.giving_category_id,
	gct.giving_category_name,
    sum(gt.giving_total) as giving_category_total
from
	giving_category_tb gct
    left outer join giving_page_tb gpt on(gpt.category_id = gct.giving_category_id)
    left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
group by
	gct.giving_category_id,
	gct.giving_category_name;
    
-- 답
-- select
-- 	gct.giving_category_name,
--     ifnull(sum(gvt.giving_total), 0) as total_giving_money
-- from
-- 	giving_category_tb gct
--     left outer join giving_page_tb gpt on(gpt.category_id = gct.giving_category_id)
--     left outer join giver_tb gvt on(gvt.giving_page_id = gpt.giving_page_id)
-- group by
-- 	gct.giving_category_name;