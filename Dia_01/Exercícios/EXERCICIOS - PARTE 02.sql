-- Databricks notebook source
-- DBTITLE 1,Exercício Tempo em Foco (WHERE)
-- 01: Lista de pedidos com mais de um item
SELECT
  *
FROM
  silver_olist.item_pedido
WHERE
  idPedidoItem >= 2

-- COMMAND ----------

-- 02: Lista de pedidos que o frete é mais caro que o item
SELECT
  *
FROM
  silver_olist.item_pedido
WHERE
  vlFrete > vlPreco

-- COMMAND ----------

-- 03: Lista de pedidos que ainda não foram enviados
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  dtEnvio IS NULL

-- COMMAND ----------

-- 04: Lista de pedidos que foram entregues com atraso
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao = 'delivered'
  AND DATE(dtEntregue) > DATE(dtEstimativaEntrega)

-- COMMAND ----------

-- 05: Lista de pedidos que foram entregues com 2 dias de antecedência
SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS tempoEntrega
FROM
  silver_olist.pedido
WHERE
  DATEDIFF(dtEstimativaEntrega, dtEntregue) = 2

-- COMMAND ----------

-- 06: Lista de pedidos feitos em dezembro de 2017 e entregues com atraso
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  YEAR(dtPedido) = 2017
  AND MONTH(dtPedido) = 12
  AND descSituacao = 'delivered'
  AND DATE(dtEntregue) > DATE(dtEstimativaEntrega)

-- COMMAND ----------

-- 07: Lista de pedidos com avaliação maior ou igual que 4

SELECT
  *
FROM
  silver_olist.avaliacao_pedido
WHERE
  vlNota >= 4

-- COMMAND ----------

-- 08: Lista de pedidos com 2 ou mais parcelas menores que R$20,00
SELECT
  *,
  ROUND(vlPagamento / nrPacelas, 2) AS vlParcela
FROM
  silver_olist.pagamento_pedido
WHERE
  vlPagamento / nrPacelas < 20
  AND nrPacelas >= 2
