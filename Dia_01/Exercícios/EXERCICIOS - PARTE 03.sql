-- Databricks notebook source
-- DBTITLE 1,Exercício Tempo em Foco (CASE)
-- 01: Selecione todos os pedidos e marque se houve atraso ou não

SELECT *
FROM silver_olist.pedido

-- COMMAND ----------

-- 02: Selecione todos os pedidos e defina os grupos em uma nova coluna:
-- - para frete inferior à 10%: '10%';
-- - para frete entre 10% e 25%: '10% a 25%';
-- - para frete entre 25% e 50%: '25% a 50%';
-- - para frete maior que 50%: '+50%';

SELECT *
FROM silver_olist.pedido
