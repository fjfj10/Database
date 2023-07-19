select * from test_tb;

#update(데이터 수정)
update test_tb set name = '김준칠' where test_id = 7;
update test_tb set birthday = '1944-09-14' where test_id = 8;
update test_tb set name = '김준구', birthday = '1944-09-15' where test_id = 8;
#쉼표를 이용하여 여러칼럼 바꾸기 가능 