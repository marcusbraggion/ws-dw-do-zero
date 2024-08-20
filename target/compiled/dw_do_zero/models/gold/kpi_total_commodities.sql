with commodities as (

    select * from "dbpostgres_ed25"."public"."stg_commodities"

),

kpis_total_commodities as (

    select count(*) as total_commodities
    from commodities
)

select * from kpis_total_commodities