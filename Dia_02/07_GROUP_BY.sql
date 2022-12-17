-- Databricks notebook source
SELECT
  descUf,
  COUNT(idCliente) AS qtClientesUF,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicoUFDistinto
FROM
  silver_olist.cliente
GROUP BY
  descUf
ORDER BY
  descUF ASC
