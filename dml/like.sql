# like

select
	*
from
	product_tb
where
# % 는 ?와 같다
	#시작하는 단어를 줬을때 단어%
-- 	product_name like 'BASIC%'
	#중간단어를 줬을때 %단어%
-- product_name like '%ST%'
	#끝나는 단어일때 %단어
-- 	product_name like '%ST'
	#_사용은 글자수만큼 정확히 넣어줘야함
--  product_name like 'BASIC __?SSY TEE'
	# 중간의 글자수를 모를때
-- 	product_name like 'BASIC %?SSY TEE'
-- 	product_name in('NO.4 TEE', 'PROPERTY OF TEE')
    product_name like 'NO%'
    or product_name like 'PROPERTY%'
    # in 과 like는 같이 사용할 수 없다
    ;