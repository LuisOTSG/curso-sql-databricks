-- Databricks notebook source
-- DBTITLE 1,Exercícios Parte 06 - Bora praticar?
-- 01: Qual categoria tem mais produtos vendidos?
SELECT
  T1.descCategoria,
  COUNT(*) AS qtVendas
FROM
  silver_olist.produto AS T1
  LEFT JOIN silver_olist.item_pedido AS T2
WHERE
  T1.idProduto = T2.idProduto
GROUP BY
  T1.descCategoria
ORDER BY
  qtVendas DESC
LIMIT
  1

-- COMMAND ----------

-- 02: Qual categoria tem produtos mais caros, em média?
SELECT
  T1.descCategoria,
  ROUND(AVG(T2.vlPreco), 2) AS vlPrecoMedio
FROM
  silver_olist.produto AS T1
  LEFT JOIN silver_olist.item_pedido AS T2
ON
  T1.idProduto = T2.idProduto
GROUP BY
  T1.descCategoria
ORDER BY
  vlPrecoMedio DESC
LIMIT
  1

-- COMMAND ----------

-- 03: Qual categoria tem maiores fretes, em média?
SELECT
  T1.descCategoria,
  ROUND(AVG(T2.vlFrete), 2) AS vlFreteMedio
FROM
  silver_olist.produto AS T1
  LEFT JOIN silver_olist.item_pedido AS T2
ON
  T1.idProduto = T2.idProduto
GROUP BY
  T1.descCategoria
ORDER BY
  vlFreteMedio DESC
LIMIT
  1

-- COMMAND ----------

-- 04: Os clientes de qual estado pagam mais frete? Acima de R$40,00.
SELECT
  T3.descUf,
  AVG(T1.vlFrete) AS vlFreteMedio
FROM
  silver_olist.item_pedido AS T1
  LEFT JOIN silver_olist.pedido AS T2 ON T1.idPedido = T2.idPedido
  LEFT JOIN silver_olist.cliente AS T3 ON T2.idCliente = T3.idCliente
GROUP BY
  descUF
HAVING vlFreteMedio > 40
ORDER BY
  vlFreteMedio DESC
