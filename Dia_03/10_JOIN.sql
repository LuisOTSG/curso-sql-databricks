-- Databricks notebook source
-- LEFT JOIN
-- Retonar a descUF do idCliente
SELECT
  T1.*,
  T2.descUF
FROM
  silver_olist.pedido AS T1
  LEFT JOIN silver_olist.cliente AS T2 ON T1.idCliente = T2.idCliente

-- COMMAND ----------

-- RIGHT JOIN
-- Retonar a descSituacao do descUF
SELECT
  T2.*,
  T1.descSituacao
FROM
  silver_olist.pedido AS T1
  RIGHT JOIN silver_olist.cliente AS T2 ON T1.idCliente = T2.idCliente
