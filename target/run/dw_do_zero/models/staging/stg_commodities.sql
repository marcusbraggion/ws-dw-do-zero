
  
    

  create  table "dbpostgres_ed25"."public"."stg_commodities__dbt_tmp"
  
  
    as
  
  (
    with commodities as (

    select * from "dbpostgres_ed25"."public"."commodities"

),

renamed as (

    select  "Open" as "open_price",
            "simbolo" as "ticker_symbol",
            "Close" as "close_price",
            "High" as "high_price",
            "Low" as "low_price",
            "Volume" as "volume",
            "Stock Splits" as "stock_splits",
            "Dividends" as "dividend_amount"
    from commodities
)

select * from renamed
  );
  