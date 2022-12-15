-- Databricks notebook source
-- 01: Selecione a tabela olist.produto:
-- - Crie uma coluna nova chamada 'descNovaCategoria' seguindo:
  -- i. agrupe 'alimentos' e 'alimentos_bebidas' em 'alimentos'
  -- ii. agrupe 'artes' e 'artes_e_artesanato' em 'artes'
  -- iii. agrupe todas categorias de construção em uma única categoria chamada 'construcao'
SELECT *,

  CASE
    WHEN descCategoria IN ('alimentos', 'alimentos_bebidas') THEN 'alimentos'
    WHEN descCategoria IN ('artes', 'artes_e_artesanato') THEN 'artes'
    WHEN descCategoria LIKE '%const%' THEN 'construcao'
    ELSE 'outras_categorias'
  END AS descNovaCategoria
    
FROM
  silver_olist.produto


-- COMMAND ----------

SELECT *,
  CASE
    WHEN vlPesoGramas / 1000 > 10 THEN 'muito pesado'
    WHEN vlPesoGramas / 1000 >= 5 THEN 'pesado'
    WHEN vlPesoGramas / 1000 >= 2 THEN 'médio'
    ELSE 'leve'
  END AS descPeso
FROM
  silver_olist.produto
  
-- - Crie uma coluna nova chamada 'descPeso'
-- i. para peso menor que 2kg: 'leve'
-- ii. para peso entre 2kg e 5kg: 'médio'
-- iii. para peso entre 5kg e 10kg: 'pesado'
-- iv. para peso maior que 10kg: 'muito pesado'
