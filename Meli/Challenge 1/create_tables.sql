CREATE TABLE IF NOT EXISTS Cliente(
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(32) NOT NULL,
  sobrenome VARCHAR(64) NOT NULL,
  email VARCHAR(128) NOT NULL,
  sexo VARCHAR(1),
  endereco VARCHAR(512),
  data_nasc DATE NOT NULL,
  telefone VARCHAR(32)
);

CREATE TABLE IF NOT EXISTS Categoria(
  id_categoria INT PRIMARY KEY,
  nome VARCHAR(32) NOT NULL,
  descricao VARCHAR(512),
  caminho VARCHAR(512)
);

CREATE TABLE IF NOT EXISTS Produto(
  id_produto INT PRIMARY KEY,
  nome VARCHAR(32) not NULL,
  descricao VARCHAR(512),
  cliente_id INT NOT NULL, -- Vendedor do Produto
  categoria_id INT,
  valor DECIMAL(8,2) NOT NULL,
  data_baixa DATE,
  estado VARCHAR(8) DEFAULT 'Ativo',
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (categoria_id) REFERENCES Categoria(id_categoria)
  
);

CREATE TABLE IF NOT EXISTS Pedido(
  id_pedido INT PRIMARY KEY,
  cliente_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT,
  data_pedido DATE not NULL,  
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (produto_id) REFERENCES Produto(id_produto) 
);