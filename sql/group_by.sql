select
	count(*)
from
	product_tb;

select
	pt.category_id,
    ct.category_name,
    pt.supplier_id,
    st.supplier_name,
    count(pt.category_id) as product_count,
    sum(pt.stock) as total_stock,
    avg(pt.stock) as avg_stock
from
	product_tb pt
    inner join category_tb ct on(ct.category_id = pt.category_id)
    inner join brand_tb bt on(bt.brand_id = pt.brand_id)
    inner join supplier_tb st on(st.supplier_id = pt.supplier_id)
group by
	pt.category_id,
    pt.supplier_id
having
	count(pt.category_id) > 40


