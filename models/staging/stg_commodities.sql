with commodities as (

    select * from {{source('dbpostgres_ed25', 'commodities')}}

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