
  
    

  create  table "dbpostgres_ed25"."public"."kpis_volume_by_symbol_ticker__dbt_tmp"
  
  
    as
  
  (
    with commodities as (

    select * from "dbpostgres_ed25"."public"."stg_commodities"

),

kpis_volume_by_symbol_ticker as (

    select ticker_symbol
         , sum(volume) as total_volume
    from commodities
    group by ticker_symbol
)

select * from kpis_volume_by_symbol_ticker
  );
  