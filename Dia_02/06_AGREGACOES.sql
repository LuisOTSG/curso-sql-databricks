-- Databricks notebook source
SELECT
  ROUND(AVG(vlPreco), 2) AS vlPrecoMedioProdutos, -- Média da coluna vlPreco
  INT(MAX(vlPreco)) AS vlMaiorPreco, -- Máximo da coluna vlPreco
  MIN(vlPreco) AS vlMenorPreco, -- Mínimo da coluna vlPreco
  ROUND(AVG(vlFrete), 2) AS vlPrecoMedioFrete, -- Média da coluna vlFrete
  INT(MAX(vlFrete)) AS vlMaiorFrete, -- Máximo da coluna vlFrete
  MIN(vlFrete) AS vlMenorFrete, -- Mínimo da coluna vlFrete
  
  ROUND(PERCENTILE(vlPreco, 0.5), 2) AS medianPreco -- Mediana da coluna vlPreco
FROM
  silver_olist.item_pedido
