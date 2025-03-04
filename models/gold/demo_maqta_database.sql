select * from {{ ref('demo_customer_ref') }}
union 
select * from {{ ref('demo_customer_ref') }}
union 
select * from {{ ref('demo_customer_ref') }}