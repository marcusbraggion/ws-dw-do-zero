
  
    

  create  table "dbpostgres_ed25"."public"."kpi_dividens_amount__dbt_tmp"
  
  
    as
  
  (
    with commodities as (

    select * from "dbpostgres_ed25"."public"."stg_commodities"

),

kpis_dividends_amount as (

    select sum(dividend_amount) as total_dividends
    from commodities
)

select * from kpis_dividends_amount
  );
  