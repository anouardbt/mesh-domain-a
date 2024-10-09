select * from {{ ref('demo_maqta_database') }} --- data product 2
left join {{ ref('dim_customers') }} --- data product 1