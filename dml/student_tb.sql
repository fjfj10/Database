insert into student_tb values(0, '김준일', 20, 0); 
insert into student_tb 
values
	(0, '김준일', 20, 0), 
	(0, '김준이', 21, 0),
	(0, '김준삼', 20, null),
	(0, '김준사', 22, null),
	(0, '김준오', 21, 0);
    
    select * from student_tb;
    select 
		student_id,
		student_name,
		student_age,
		student_score
	from
		student_tb
	where
		(student_age = 20
        or student_score is null)
        and student_name = '김준일';
        # 곱하기먼저 null이면서 김준일인사람을 찾고 + 20살인사람 찾고student_age = 20 or student_score is null and student_name = '김준일';
        #우선 순위를 정할때는 순서를 잘 짜거나 괄호를 적절히 사용
        #null을 검색 할때는 = null이 아닌 is null을 사용한다, null이 아닌것을 찾을때 is not null사용alter
        
update student_tb
set
	student_score = 30
where
	student_age = 22;
    
    
#나이가 20인 학생 점수 다 더해라
select 
	student_age,
	sum(student_score) as  total_score
from
	student_tb
-- where 
-- 	student_age = 20
	group by
		student_age;
	#group by는 묶어서 계산할때 사용
    select 
		student_age,
		sum(student_score) as total_score
	from
		student_tb
	group by
		student_age
	having
		total_score = 40;
	#having을 사용하여 total_score가 40인것을 찾아냄
