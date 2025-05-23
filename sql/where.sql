/*
	조건 연산자
    
*/
select
	*
from
	product_tb
where
	price > 500000
    and stock > 400;
    
select
	*
from
	product_tb
where
	brand_id in (1, 2);
    
select
	*
from
	product_tb
where
	brand_id in (select brand_id from brand_tb where brand_id < 3);

select
	*
from
	product_tb
where
	brand_id in (select brand_id from brand_tb where brand_name in ('LG', '다이소'));

select
	*
from 
	product_tb
where
	price >= 100000
    and price <= 200000;
    
select 
	*
from 
	product_tb (select
	product_name,
    stock,
	if(stock = 0, '부족', NULL) as stock_status
from
	product_tb)
where
	stock_status = '부족';
where
	price between 100000 and 200000;

select
	*
from
(select
	product_name,
    stock,
	if(stock = 0, '부족', NULL) as stock_status
from
	product_tb) tpt
where
	stock_status = '부족';

select
	*
from
	(select
		product_name,
		stock,
		if(stock = 0, '부족', '') as stock_status
	from
		product_tb) tpt
where
	not stock_status = '부정';

select
	*
from
	(select
		product_name,
		stock,
		if(stock = 0, '부족', null) as stock_status
	from
		product_tb) tpt
where
	tpt.stock_status is not null;


/*
	like 연산자(와일드카드 %, _)
*/
select
	*
from
	product_tb
where
	product_name like '%노트북';

select
	*
from
	product_tb
where
	product_name like '강력한%';

select
	*
from
	product_tb
where
	product_name like '%한%';
    
select
	*
from
	product_tb
where
	product_name like '____력한';

select
	*
from
	supplier_tb
where
	supplier_name like '%이'
    or supplier_name like '%김';
    
select
	*
from
	supplier_tb
where
	supplier_name in ('양김', '유한회사 이');
    
