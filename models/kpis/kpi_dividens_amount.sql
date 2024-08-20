with commodities as (

    select * from {{source('dbpostgres_ed25', 'stg_commodities')}}

),

kpis_dividends_amount as (

    select sum(dividend_amount) as total_dividends
    from commodities
)

select * from kpis_dividends_amount