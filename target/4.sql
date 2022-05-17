-- TPC TPC-H Parameter Substitution (Version 2.17.2 build 0)
-- using 1652811767 as a seed to the RNG

use amgen_dbsql_tpch 

select
	o_orderpriority,
	count(*) as order_count
from
	orders
where
	o_orderdate >= date '1993-04-01'
	and o_orderdate < date '1993-04-01' + interval '3' month
	and exists (
		select
			*
		from
			lineitem
		where
			l_orderkey = o_orderkey
			and l_commitdate < l_receiptdate
	)
group by
	o_orderpriority
order by
	o_orderpriority;
first -1
