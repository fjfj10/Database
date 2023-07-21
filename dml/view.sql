create view user_withdraw_view as
select
	uwt.user_withdraw_id,
    uwt.user_id,
    uwt.name,
    t1.title,
    t2.content
from
	user_withdraw_tb uwt
    left outer join table1 t1 on(t1.user_id = uwt.user_id)
    left outer join table2 t2 on(t2.t1_id = t1.t1_id);

# view는 가상의 테이블 -> views에 저장됨: 테이블 이름 노출X -> 보안(직접접근을 막음): view로는 추가, 수정, 삭제 안된다, 조회는 가능
select
	*
from
	user_withdraw_view;