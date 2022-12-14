-- Databricks notebook source
SELECT * FROM silver_olist.pedido
WHERE descSituacao = 'delivered'

-- LIMIT 100

-- Leia-se: Selecione TODAS as colunas da TABELA 'silver_olist.pedido' ONDE a situação do pedido (descSituacao) seja 'delivered'

-- COMMAND ----------

SELECT * FROM silver_olist.pedido
WHERE descSituacao = 'shipped' AND
      YEAR(dtPedido) = '2018'

-- LIMIT 100

-- Leia-se: Selecione TODAS as colunas da TABELA 'silver_olist.pedido' ONDE a situação do pedido (descSituacao) seja 'shipped' E
-- dtPedido seja no ano de '2018'

-- COMMAND ----------

SELECT * FROM silver_olist.pedido
WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled')
AND year(dtPedido) = '2018'

-- LIMIT 100

-- Leia-se: Selecione TODAS as colunas da TABELA 'silver_olist.pedido' ONDE a situação do pedido (descSituacao) seja 'shipped' OU 'canceled' E
-- dtPedido seja no ano de '2018'

-- COMMAND ----------

SELECT * FROM silver_olist.pedido
WHERE descSituacao IN ('shipped', 'canceled')
AND year(dtPedido) = '2018'

-- LIMIT 100

-- Leia-se: Selecione TODAS as colunas da TABELA 'silver_olist.pedido' ONDE a situação do pedido (descSituacao) seja 'shipped' OU 'canceled' E
-- dtPedido seja no ano de '2018'

-- COMMAND ----------

SELECT *, DATEDIFF(dtEstimativaEntrega, dtAprovado) AS qtAtrasoMes
FROM silver_olist.pedido
WHERE descSituacao IN ('shipped', 'canceled')
AND YEAR(dtPedido) = '2018'
AND DATEDIFF(dtEstimativaEntrega, dtAprovado) > 30

-- LIMIT 100

-- Leia-se: Selecione TODAS as colunas da TABELA 'silver_olist.pedido' ONDE a situação do pedido (descSituacao) seja 'shipped' OU 'canceled' E
-- dtPedido seja no ano de '2018'
