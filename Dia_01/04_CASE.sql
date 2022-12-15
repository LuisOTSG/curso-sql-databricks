-- Databricks notebook source
SELECT * FROM silver_olist.cliente

LIMIT 100

-- COMMAND ----------

SELECT *,

        CASE
          WHEN descUF = 'SP' THEN 'paulista'
          WHEN descUF = 'RJ' THEN 'fluminense'
          WHEN descUF = 'PR' THEN 'paranaense'
          ELSE 'outros'
        END AS descNacionalidade

FROM silver_olist.cliente

-- Leia-se: Selecione TODAS as colunas da TABELA 'silver_olist.cliente' e CASO a 'descUf' QUANDO for SP seja 'Paulista' QUANDO for RJ seja
-- 'Fluminense' QUANDO for PR seja 'Paranaense' CASO NÃO seja coloque 'Outros' e ADICIONE os resultados em uma coluna 'descNacionalidade'

-- COMMAND ----------

SELECT *,

        CASE
          WHEN descCidade LIKE '%sao%' THEN 'Tem são no nome'
          ELSE 'Não tem são no nome'
        END AS descCidadeSao          

FROM silver_olist.cliente

-- Leia-se: Selecione TODAS as COLUNAS da TABELA 'silver_olist.cliente', CASO a coluna 'descCidade' QUANDO tiver PARECIDO com 'sao' seja
-- 'Tem são no nome' CASO NÃO tiver, seja 'Não tem são no nome' e ADICIONE uma COLUNA chamada 'descCidadeSao'

-- COMMAND ----------

SELECT *,

        CASE
          WHEN descUF IN ('SP', 'RJ', 'MG', 'ES') THEN 'Sudeste'
          ELSE 'Outras Regiões'
        END AS descRegiao
        
FROM silver_olist.vendedor
        
