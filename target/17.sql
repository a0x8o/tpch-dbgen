-- TPC TPC-H Parameter Substitution (Version 2.17.2 build 0)
-- using 1652811767 as a seed to the RNG

use amgen_dbsql_tpch 

select
	sum(l_extendedprice) / 7.0 as avg_yearly
from
	lineitem,
	part
where
	p_partkey = l_partkey
	and p_brand = 'Brand#42'
	and p_container = 'JUMBO PACK'
	and l_quantity < (
		select
			0.2 * avg(l_quantity)
		from
			lineitem
		where
			l_partkey = p_partkey
	);
first -1
