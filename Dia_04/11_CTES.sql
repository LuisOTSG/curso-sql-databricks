-- Databricks notebook source
-- SUBQUERY NÃO RECOMENDADA
-- Lista de Vendedores que estão no Estado com mais clientes
SELECT
  idVendedor, descUF
FROM
  silver_olist.vendedor
WHERE
  descUF = (
    SELECT
      descUF
    FROM
      silver_olist.cliente
    GROUP BY
      descUF
    ORDER BY
      COUNT(DISTINCT idClienteUnico) DESC
    LIMIT
      1
  )

-- COMMAND ----------

-- SUBQUERY NÃO RECOMENDADA
-- Lista de Vendedores que estão nos 2 Estados com mais clientes
SELECT
  idVendedor, descUF
FROM
  silver_olist.vendedor
WHERE
  descUF IN (
    SELECT
      descUF
    FROM
      silver_olist.cliente
    GROUP BY
      descUF
    ORDER BY
      COUNT(DISTINCT idClienteUnico) DESC
    LIMIT
      2
  )

-- COMMAND ----------

-- DBTITLE 1,WITH
-- Lista de Vendedores que estão nos 2 Estados com mais clientes
WITH tb_estados AS (
  SELECT
    descUF
  FROM
    silver_olist.cliente
  GROUP BY
    descUF
  ORDER BY
    COUNT(DISTINCT idClienteUnico) DESC
  LIMIT
    2
), tb_vendedores AS (
SELECT
  idVendedor,
  descUF
FROM
  silver_olist.vendedor
WHERE
  descUF IN (
    SELECT
      descUF
    FROM
      tb_estados
  )
)

SELECT * FROM tb_vendedores

-- COMMAND ----------

-- Nota média dos pedidos dos vendedores de cada estado
WITH tb_pedido_nota AS (
  SELECT
    T1.idVendedor,
    T2.vlNota
  FROM
    silver_olist.item_pedido AS T1
    LEFT JOIN silver_olist.avaliacao_pedido AS T2 ON T1.idPedido = T2.idPedido
),
tb_vendedor_avg AS (
  SELECT
    idVendedor,
    AVG(vlNota) AS avgNotaVendedor
  FROM
    tb_pedido_nota
  GROUP BY
    idVendedor
),
tb_estado_vendedor AS (
  SELECT
    T1.*,
    T2.descUF
  FROM
    tb_vendedor_avg AS T1
    LEFT JOIN silver_olist.vendedor AS T2 ON T1.idVendedor = T2.idVendedor
)
SELECT
  descUF,
  AVG(avgNotaVendedor) AS avgNotaEstado
FROM
  tb_estado_vendedor
GROUP BY descUF
ORDER BY avgNotaEstado DESC
