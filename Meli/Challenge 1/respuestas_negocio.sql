
-- Consulta 1
SELECT
    c.nome as vendedor, 
    c.data_nasc as data_nascimento,
    SUM(pr.valor * p.quantidade) AS valor_total
FROM 
	Pedido p
	INNER JOIN Produto pr ON P.produto_id = pr.id_produto 
	INNER JOIN Cliente c ON pr.cliente_id = c.id_cliente
WHERE 
	EXTRACT(MONTH FROM C.data_nasc) = EXTRACT(MONTH FROM CURRENT_DATE) AND
    EXTRACT(DAY FROM C.data_nasc) = EXTRACT(DAY FROM CURRENT_DATE) AND
    p.data_pedido BETWEEN '2020-01-01' AND '2020-01-31'
GROUP BY 
	C.id_cliente
HAVING 
	SUM(pr.valor * p.quantidade) > 1500;

-- Consulta 2
WITH RANKING_TABLE AS (
  SELECT
      EXTRACT(MONTH from p.data_pedido) as mes,
      EXTRACT(YEAR FROM p.data_pedido) as ano,
      c.nome AS nome,
      c.sobrenome as sobrenome,
  	  COUNT(P.id_pedido) as qtde_vendas,
      sum(p.quantidade) as qtde_produtos,
      SUM(pr.valor * p.quantidade) AS valor_total,
      RANK() OVER (PARTITION BY EXTRACT(MONTH FROM p.data_pedido) ORDER BY SUM(pr.valor * p.quantidade) DESC) as ranking
  FROM
      Pedido p
      INNER JOIN Produto pr ON P.produto_id = pr.id_produto 
      INNER JOIN Cliente c ON pr.cliente_id = c.id_cliente
      INNER JOIN Categoria cat ON pr.categoria_id = cat.id_categoria
  WHERE
      EXTRACT(YEAR FROM p.data_pedido) = 2020 AND
  	  cat.nome = 'Celulares'
  GROUP BY
      EXTRACT(MONTH from p.data_pedido),
      EXTRACT(YEAR FROM p.data_pedido),
      c.nome,
      c.sobrenome
)
SELECT 
	ano,
    mes,
    nome,
    sobrenome,
    qtde_vendas,
    qtde_produtos,
    valor_total,
    ranking
    
FROM
	RANKING_TABLE
WHERE
	ranking <= 5;

-- Consulta 3
CREATE OR REPLACE PROCEDURE PreencherTabelaPrecoEstado() AS $$
BEGIN
    DROP TABLE IF EXISTS PrecoEstadoProduto;

    CREATE TABLE IF NOT EXISTS PrecoEstadoProduto (
        id_produto INT,
        preco DECIMAL(8,2),
        estado VARCHAR(8),
        PRIMARY KEY (id_produto),
        FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
    );

    INSERT INTO PrecoEstadoProduto (id_produto, preco, estado)
    SELECT
        p.id_produto,
        p.valor,
        p.estado
    FROM
        Produto P
    WHERE
        p.estado = 'Ativo';
END;
$$ LANGUAGE plpgsql;

CALL PreencherTabelaPrecoEstado();
	