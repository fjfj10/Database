# 조건문
select
	*,
    #case에서 열리고 end에서 닫힌다 사이에 when 조건 then 참일때 elsr 거짓
    case
		when product_price < 100000 then '10만원 미만'
		when product_price < 200000 then '20만원 미만'
        else '20만원 이상'
    end as '가격 범위',
    # 삼항연산자 위아래가 같다 but case는 when then을 더 넣어줄 수 있다
    if(product_price < 100000, '10만원 미만', '10만원 이상') as '가격 범위2',
    if(size_m is null, '사이즈 없음', size_m) as size_m2,
    #null전용 위를 아래로 바꿀 수 있다 int변수에 넣을 사항이 생길때 null을 0으로 바꾸거나 string에 넣을때 blank로 바꿔서 넣는다
    ifnull(size_m, '사이즈 없음') as size_m3,
    #size_m이 M과 같으면 null로 바꿔줌 같은 값을 바꿔줄때 간혹 사용
    nullif(size_m, 'M') as size_m4
from
	product_tb;