-- Databricks notebook source
-- DBTITLE 1,Exercício Tempo em Foco (CASE)
-- 01: Selecione todos os pedidos e marque se houve atraso ou não
SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS tempoEntrega,
  CASE
    WHEN DATEDIFF(dtEstimativaEntrega, dtEntregue) < 0 THEN 'Atrasado'
    WHEN DATEDIFF(dtEstimativaEntrega, dtEntregue) is null THEN 'Não Entregue'
    ELSE 'No Prazo'
  END AS descTempoEntrega
FROM
  silver_olist.pedido

-- COMMAND ----------

-- 02: Selecione todos os pedidos e defina os grupos em uma nova coluna:
-- - para frete inferior à 10%: '10%';
-- - para frete entre 10% e 25%: '10% a 25%';
-- - para frete entre 25% e 50%: '25% a 50%';
-- - para frete maior que 50%: '+50%';
SELECT
  *,
  ROUND(vlPreco + vlFrete, 2) AS vlTotal,
  vlFrete / (vlPreco + vlFrete) AS pctFrete,
  CASE
    WHEN vlFrete / (vlPreco + vlFrete) < 0.1 THEN '10%'
    WHEN vlFrete / (vlPreco + vlFrete) < 0.25 THEN '10% a 25%'
    WHEN vlFrete / (vlPreco + vlFrete) < 0.5 THEN '25% a 50%'
    ELSE '+50%'
  END AS descPretePct
FROM
  silver_olist.item_pedido
