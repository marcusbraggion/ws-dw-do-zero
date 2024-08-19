# imports
import os
import requests

import pandas as pd
import psycopg2
import sqlalchemy
import yfinance as yf

# env

# etl

commodities = ["CL=F", "GC=F", "SI=F"]

def buscar_dados_commodities(simbolo, periodo="5y", intervalo="1d"):
    ticker = yf.Ticker('CL=F')
    dados = ticker.history(period=periodo, interval=intervalo)[["Close"]]
    dados['simbolo'] = simbolo
    return dados

def buscar_todos_dados_commodities(simbolos):
    todos_dados = []
    for simbolo in commodities:
        dados = buscar_dados_commodities(simbolo)
        todos_dados.append(dados)

    return pd.concat(todos_dados)


if __name__ == "__main__":
    dados_concatenado = buscar_todos_dados_commodities(commodities)
    print(dados_concatenado)