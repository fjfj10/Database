select * from test_tb;

#delete(데이터 삭제)
#delete는 아예 한 줄을 날리는거 줄의 값 중 하나만 날리고 싶으면 update 사용
delete from test_tb where test_id = 9;
delete from test_tb where test_id = 8;