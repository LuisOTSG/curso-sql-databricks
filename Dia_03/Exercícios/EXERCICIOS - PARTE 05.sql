-- Databricks notebook source
-- DBTITLE 1,Exercícios Parte 05 - Bora praticar?
-- 01: Qual pedido com maior valor de frete? E o menor?

SELECT idPedido,
  MAX(vlFrete) AS vlFreteMaximo,
  MIN(vlFrete) AS vlFreteMinimo
FROM silver_olist.item_pedido
GROUP BY
  idPedido
LIMIT
  1

-- COMMAND ----------

-- 02: Qual cliente tem mais pedidos?

-- COMMAND ----------

-- 03: Qual vendedor tem mais itens vendidos? E o com menos?

-- COMMAND ----------

-- 04: Qual dia tivemos mais pedidos?
