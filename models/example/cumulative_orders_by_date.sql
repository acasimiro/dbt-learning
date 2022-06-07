select
    o_orderdate,
    sum(o_totalprice) as daily_total_price,
    sum(sum(o_totalprice)) over (order by o_orderdate rows between unbounded preceding and current row) as cumulative_daily_total_price
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
group by o_orderdate
order by o_orderdate
