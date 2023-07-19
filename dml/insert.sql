select * from test_tb;
# insert(데이터 추가)
insert into `study1`.`test_tb`(`test_id`, `name`, `birthday`) values(3, '김준삼', '1994-09-09');
insert into study1.test_tb(`test_id`, `birthday`, `name`) values(4, '1994-09-10', '김준사');
insert into study1.test_tb(test_id, birthday, name) values(5, '1994-09-11', '김준오');
insert into test_tb values(6,'김준육', '1944-09-12');
insert into test_tb(test_id, birthday) values(7,'1944-09-12');
insert into test_tb values(9,'김준구', null);
#study1 생략가능 선택이 되어있을경우에만, (test_id, birthday, name) 생략가능 (`test_id`, `name`, `birthday`) 원래 순서대로 다 넣을 경우만
# test_tb(test_id, birthday) 넣을것만 지정해서 넣는것 가능 나머지는 null로 들어감

