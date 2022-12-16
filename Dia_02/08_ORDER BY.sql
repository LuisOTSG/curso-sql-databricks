-- Databricks notebook source
SELECT
  descUf,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicoDistinto
FROM
  silver_olist.cliente
GROUP BY
  descUf
ORDER BY
  descUF ASC

-- COMMAND ----------

-- Primeira forma de ordenar a consulta pela coluna qtClientesUnicoDistinto
SELECT
  descUf,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicoDistinto
FROM
  silver_olist.cliente
GROUP BY
  descUf
ORDER BY 2 -- Ordenar pela COLUNA (2) da consulta

-- COMMAND ----------

-- Segunda forma de ordenar a consulta pela coluna qtClientesUnicoDistinto
SELECT
  descUf,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicoDistinto
FROM
  silver_olist.cliente
GROUP BY
  descUf
ORDER BY
  qtClientesUnicoDistinto

-- COMMAND ----------

-- Terceira forma de ordenar a consulta pela coluna qtClientesUnicoDistinto
SELECT
  descUf,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicoDistinto
FROM
  silver_olist.cliente
GROUP BY
  descUf
ORDER BY
  COUNT(DISTINCT idClienteUnico)

-- COMMAND ----------

-- Qual o descUF com maior quantidade de clientes?
SELECT
  descUf,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicoDistinto
FROM
  silver_olist.cliente
GROUP BY
  descUf
ORDER BY
  qtClientesUnicoDistinto DESC
LIMIT 1
