/*
	SELECT(데이터 조회)
    SELECT 컬럼1, 컬럼2 FROM 테이블명;
*/

select student_name as sn, student_age, student_age from student_tb where student_age > 25;
select 10 as number;
select * from (select 10 + 20 as number2, 40 as number3) as n_tb;

/*
	select 결과들을 합치는 방법(union-중복 제거, union all)
	제약조건
    1. 컬럼의 개수가 일치해야한다.
    2. 테이블을 select한 결과를 합치려면 자료형도 일치해야한다.
*/
select 30, 40 union select 50, 60;
select 10, 20 union all select 10, 20;

/*
	join(테이블 합치기)
    SELECT * FROM 테이블1 JOIN 테이블2;
*/
select * from student_tb as st1 join  student_tb as st2;
select 
	* 
from 
	student_tb as st1 
	left outer join student_tb as st2 on(st2.student_id = st1.student_id + 1)
	inner join student_tb as st3 on(st3.student_id = st2.student_id + 1);

select 
	* 
from 
	student_tb as st1 
	inner join student_tb as st2 on(st2.student_id = st1.student_id + 1)
	left outer join student_tb as st3 on(st3.student_id = st2.student_id + 1);

/*
	서브쿼리(하위쿼리)
*/
select
	class_register_id,
    crt.class_id,
    ct.class_name,
    crt.student_id,
    st.student_name
from 
	class_register_tb as crt
	left outer join class_tb as ct on(ct.class_id = crt.class_id)
	left outer join student_tb as st on(st.student_id = crt.student_id)
where
	st.student_name = '이서연';

insert into class_register_tb
values
	(default, 1, 2),
	(default, 1, 3),
	(default, 1, 4),
	(default, 2, 2),
	(default, 2, 5),
	(default, 2, 7),
	(default, 2, 9);

select
	crt.class_id,
    (select class_name from class_tb ct where ct.class_id = crt.class_id) as class_name
from 
	class_register_tb crt
where
	student_id = (	select
						student_id
					from
						student_tb
					where
						student_name = '이서연');

/*
	퀴리 성능 비교
*/
explain analyze select * from student_tb;
explain analyze select * from class_tb;
explain analyze select * from student_tb;






