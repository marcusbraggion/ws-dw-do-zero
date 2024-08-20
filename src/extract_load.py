# imports
import os

import pandas as pd
import yfinance as yf
from dotenv import load_dotenv
from sqlalchemy import create_engine

# .env
load_dotenv()

DB_PORT_PRD = os.getenv("DB_PORT_PRD")
DB_NAME_PRD = os.getenv("DB_NAME_PRD")
DB_USER_PRD = os.getenv("DB_USER_PRD")
DB_PASS_PRD = os.getenv("DB_PASS_PRD")
DB_HOST_PRD = os.getenv("DB_HOST_PRD")

DATABASE_URL = f"postgresql://{DB_USER_PRD}:{DB_PASS_PRD}@{DB_HOST_PRD}:{DB_PORT_PRD}/{DB_NAME_PRD}"

# etl
engine = create_engine(DATABASE_URL)
commodities = ["CL=F", "GC=F", "SI=F"]


def buscar_dados_commodities(simbolo, periodo="5y", intervalo="1d"):
    ticker = yf.Ticker("CL=F")
    dados = ticker.history(period=periodo, interval=intervalo)[["Close"]]
    dados["simbolo"] = simbolo
    return dados


def buscar_todos_dados_commodities(simbolos):
    todos_dados = []
    for simbolo in commodities:
        dados = buscar_dados_commodities(simbolo)
        todos_dados.append(dados)

    return pd.concat(todos_dados)


def salvar_no_postgres(df, schema="public"):
    df.to_sql("commodities", engine, schema=schema, if_exists="replace", index=False)


if __name__ == "__main__":
    dados_concatenado = buscar_todos_dados_commodities(commodities)
    salvar_no_postgres(dados_concatenado)
