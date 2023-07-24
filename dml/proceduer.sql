# proceduer(저장 프로시저)
# 프로시저 호출은 main문을 호출하는 것과 같다 
call save_user('ddd@gmail.com', '1234', '김준일', 'google', null);

call save_user_many('aaa', '1234', '김준일', null, null, 5);

# 빈그릇 = @total_count을 주는것
set @color = 'black';
set @color_name = 'blue';
call get_product_total_count(@color, @total_count, @color_name);
select @color, @total_count, @color_name;
# 빈그릇에 select으로 담아서 본다 프로시저로 프로시저를 호출할때 많이 사용
# in, out, inout의 차이점을 알아야함
# in으로 밖에서 넣어주면 set @color = 'black'; proceduer안에 set vs_color = 'green'; 선언되있어도 black값을 보여준다 = 밖에서 지정된 값을 프로시저가 바꿀수 없다
# 'black'을 @color에 복사해서 넣는다 같은주소X  vs_color은 지역변수로 쓰임
# inout은 proceduer안에 set vs_color_name = 'red'; 선언 되어있으면 밖에서 설정해준 set @color_name = 'blue'; 겂이 있어도 프로시저를 불러올 때 set vs_color_name = 'red'가 되어 red값을 보여준다. = 밖에서 지정된 값을 프로시저가 바꿀 수 있다.
# 
# out은 넣어주는 것이 아닌 결과를 표출해주는 곳

call get_product_by_category('tees');

call get_product_by_category_case('tees');

#if와 when이 큰 차이가 없다
# 보통 if를 쓰지만 같은 값을 찾는경우 case를 쓰는것이 좋다

set global log_bin_trust_function_creators = 1;
show global variables like 'log_bin_trust_function_creators';

# function: DML안에서 동작하는 함수들(주로 계산에 사용) call이 아닌 select로 호출한다 
# function과 proceduer의 차이점 설명을 추가할 것
select create_name_and_age('김준일', 30); 