# 사용자 추가
create user test1@localhost identified by '1234';
# 사용자 추가는 했지만 db접근권한은 부여하지 않아 SCHEMAS에 아무것도 나타나지 않는다
# @localhost 대신 IP주소가능 = DB에 접근이 가능한 PC,  퍼센트%를 주면 어디서든 접근 가능

use mysql; # mysql은 설치될 때 생긴 DB, use는 사용하겠다는뜻 데이터 베이스가 선택된 상테어서 계정 생성, 변경등을 해야함
select host, user from user;

# 사용자 권한
revoke all on study3.* from test1@localhost;
-- revoke: 권한 회수 
grant all privileges on study3.user_tb to test1@localhost;
# all privileges 모든권한 승인, identified by '1234'를 뒤에 둩여주면 패스워드 변경을 추가로 해줄 수 있음

create user 'test2'@'%' identified by '1234';

use mysql; 
select host, user from user;

alter user 'test2'@'%' identified by '1111';
# password변경 후
flush privileges;
# 적용해주어야함

alter user 'test1'@'localhost' identified by '1111';
flush privileges;

grant select, insert on `study3`.`user_tb` to 'test2'@'%';
flush privileges;

show grants;
show grants for'test2'@'%';
# 들어간 권한 확인 

revoke insert on `study3`.`user_tb` from 'test2'@'%';
flush privileges;
# insert권한 삭제
# flush privileges: 계정 또는 권한 변경이 있을때마다 해줘야함
show grants for'test2'@'%';

# '자신의 이름(영문)'@서버에서만 접속 가능, 비밀번호는 1234
create user cheawonkim@localhost identified by '1234';

# 해당 계정의 비밀 번호를 1q2w3e4r로 변경
alter user 'cheawonkim'@'localhost' identified by '1q2w3e4r';

# 권한 study2 데이터베이스는 -> user_tb(select, insert, update, delete)
grant select, insert, update, delete on `study2`.`user_tb` to 'cheawonkim'@'localhost';
flush privileges;

# update 권환 회수
revoke update on `study2`.`user_tb` from 'cheawonkim'@'localhost';
flush privileges;

show grants for'cheawonkim'@'localhost';

# 권한 study3 데이터베이스는 -> product_tb(select)
grant select on `study3`.`product_tb` to 'cheawonkim'@'localhost';
flush privileges;
# delete 권한 추가
grant delete on `study3`.`product_tb` to 'cheawonkim'@'localhost';
flush privileges;

select version();


