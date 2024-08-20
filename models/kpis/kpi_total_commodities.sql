with commodities as (

    select * from {{source('dbpostgres_ed25', 'stg_commodities')}}

),

kpis_total_commodities as (

    select count(*) as total_commodities
    from commodities
)

select * from kpis_total_commodities