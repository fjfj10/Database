insert into user_tb
values(0,'김준일');
# truncate: table에 들어있는 데이터 전체 삭제
#select의 결과를 insert해줄 수 있다 ==> trigger 이용: 연쇄적으로 일어나게 만들것 table1도 마찬가지
# user_tb의 트리거 설정 insert 후에 동작되야하므로 AFTER INSERT에 넣어둠 
-- CREATE DEFINER=`root`@`localhost` TRIGGER `user_tb_AFTER_INSERT` AFTER INSERT ON `user_tb` FOR EACH ROW BEGIN
-- 	insert into table1
--     values(0, new.user_id, concat(new.name, '의 자기소개'), 1);
-- END
# delete는 기준점이 되는 user_tb에서 먼저 사라지면 이후 오류가 발생 했을때 table1, table2의 값을 못 찾을 수 있음 따라서 지우기 전에 동작을 한 후 마지막에 지워 줌

insert into table1
select 
	0,
	(select ifnull(max(user_id), 0) from user_tb),
    concat((select name from user_tb 
    where user_id = (select 
						ifnull(max(user_id), 0) 
					from 
						user_tb)), '의 자기소개');
# 제일 마지막(AI를 사용했기때문에 최근값= 제일 큰값) = max값 max는 동시에 등록이 일어날때 오류가 생길 수 있다 ex: 10명 동시 접속 시 마지막인 10번만 가지고 와서 생성하는 경우가 생김
# concat: 문자열 합치기

insert into table1
values(0, 1,'김준일의 자기소개');

insert into table2
values(0, 1, '자기소개 내용을 입력하세요.');

delete 
from
	user_tb
where
	name = '김준일';
# user은 삭제되고 table1, table2의 visible은 0으로 바뀜
# delete는 기준점이 되는 user_tb에서 먼저 사라지면 이후 오류가 발생 했을때 table1, table2의 값을 못 찾을 수 있음 따라서 지우기 전에 동작을 한 후 마지막에 지워 줌