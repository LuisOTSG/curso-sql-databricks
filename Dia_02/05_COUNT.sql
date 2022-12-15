-- Databricks notebook source
SELECT
  COUNT(*) AS nrLinhasNaoNulas -- Linhas não nulas
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas,
  COUNT(idCliente) AS nrIdClienteNaoNulo,
  COUNT(DISTINCT idCliente) AS nrIdClienteDistintos,
  COUNT(idClienteUnico) AS nrIdClienteUnico,
  COUNT(DISTINCT idClienteUnico) AS nrIdClienteUnicoDistintos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS qtLinhas,
  COUNT(DISTINCT idCliente) AS qtClientes,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicos
FROM
  silver_olist.cliente
WHERE
  descCidade IN ('presidente prudente', 'sao paulo')
