select @@autocommit;
set autocommit = 0; #commit off
# mysql은 자동으로 commit 해준다 기본 : autocommit = 1;

# start transaction;부터 commit;까지의 정보를 저장하겠다는 뜻 commit이 되지 않으면 저장되지 않는다
start transaction;
# start transaction을 실행시키면 자동으로  autocommit = 0이 된다

savepoint insert_user;

insert into user_tb
values (0, 'ddd', '1234');

select *  from user_tb;

savepoint update_user_password;
 
 update user_tb set password = '1111' where user_name = 'ddd';
 
 select *  from user_tb;
 
 rollback to savepoint update_user_password;
 # update_user_password하기전으로 돌려준다. update user_tb set password = '1111' where user_name = 'ddd'가 시행되기 전인 ddd 1234로 돌아간다

 rollback to savepoint insert_user;
 # insert 전으로 돌려준다. insert into user_tb values (0, 'ddd', '1234')다 되기 전으로 돌려준다 = 테이블에 ddd 존재X

 rollback;
 # rollback은 commit전에 시행, commit을 해버리면 저장되어 돌릴수없다 

commit;
# 마지막에 commit이 있어야 저장이 된다(필수)
