-- Databricks notebook source
SELECT * FROM silver_olist.pedido

-- Leia-se: Selecione TUDO (*) da TABELA 'silver_olist.pedido'

-- COMMAND ----------

SELECT idPedido
FROM silver_olist.pedido

-- Leia-sei: Selecione a COLUNA 'idPedido' da TABELA 'silver_olist.pedido'

-- COMMAND ----------

SELECT idPedido, 
       descSituacao
FROM silver_olist.pedido

-- Leia-sei: Selecione a COLUNA 'idPedido' e 'descSituacao' da TABELA 'silver_olist.pedido'

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao
FROM
  silver_olist.pedido
LIMIT
  5

-- COMMAND ----------

SELECT *,
       DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega

FROM silver_olist.pedido
