INSERT INTO Cliente (id_cliente, nome, sobrenome, email, sexo, endereco, data_nasc, telefone) 
VALUES
(1, 'Maria', 'Silva', 'maria@example.com', 'F', 'Rua das Flores', '1990-05-15', '(11) 98765-4321'),
(2, 'João', 'Oliveira', 'joao@example.com', 'M', 'Av. Principal', '1985-10-20', '(21) 12345-6789'),
(3, 'Ana', 'Santos', 'ana@example.com', 'F', 'Rua das Árvores', '1988-03-10', '(31) 55555-5555'),
(4, 'Pedro', 'Costa', 'pedro@example.com', 'M', 'Rua das Pedras', '1976-12-28', '(41) 98765-1234'),
(5, 'Juliana', 'Pereira', 'juliana@example.com', 'F', 'Av. Central', '1995-08-03', '(51) 32145-9876'),
(6, 'Carlos', 'Souza', 'carlos@example.com', 'M', 'Rua das Montanhas', '1982-06-17', '(61) 33333-3333'),
(7, 'Fernanda', 'Lima', 'fernanda@example.com', 'F', 'Rua das Fontes', '1992-04-25', '(71) 99999-9999'),
(8, 'Rafael', 'Almeida', 'rafael@example.com', 'M', 'Av. das Torres', '1989-09-12', '(81) 77777-7777'),
(9, 'Mariana', 'Rodrigues', 'mariana@example.com', 'F', 'Rua das Praias', '1980-04-08', '(91) 88888-8888'),
(10, 'Gabriel', 'Ribeiro', 'gabriel@example.com', 'M', 'Av. dos Lagos', '1973-11-30', '(01) 66666-6666');

INSERT INTO Categoria (id_categoria, nome, descricao, caminho) 
VALUES
(1, 'Celulares', 'Produtos tecnológicos como smartphones e laptops.', '/eletronicos'),
(2, 'Roupas', 'Vestuário de moda masculina, feminina e infantil.', '/roupas'),
(3, 'Esportes', 'Artigos esportivos para diversas modalidades.', '/esportes'),
(4, 'Livros', 'Diversos gêneros literários e publicações.', '/livros'),
(5, 'Beleza', 'Produtos de cuidados pessoais e beleza.', '/beleza'),
(6, 'Alimentos', 'Produtos alimentícios diversos.', '/alimentos'),
(7, 'Casa e Jardim', 'Artigos para decoração e jardinagem.', '/casa-e-jardim'),
(8, 'Automotivo', 'Acessórios e peças para veículos.', '/automotivo'),
(9, 'Brinquedos', 'Brinquedos para todas as idades.', '/brinquedos'),
(10, 'Pet Shop', 'Produtos para animais de estimação.', '/pet-shop');

INSERT INTO Produto (id_produto, nome, descricao, cliente_id, categoria_id, valor, data_baixa, estado) 
VALUES
(1, 'Smartphone Galaxy S20', 'Smartphone de última geração da Samsung.', 1, 1, 1999.99, NULL, 'Ativo'),
(2, 'Camiseta Polo', 'Camiseta masculina de algodão.', 7, 2, 49.99, NULL, 'Ativo'),
(3, 'Motorola G15', 'Smartphone da Motorola', 7, 1, 799.99, NULL, 'Ativo'),
(4, 'Livro "1984" de George Orwell', 'Clássico da literatura distópica.', 7, 4, 29.99, NULL, 'Ativo'),
(5, 'Conjunto de Maquiagem', 'Kit de maquiagem profissional.', 5, 5, 99.99, NULL, 'Ativo'),
(6, 'Pacote de Arroz Integral', 'Arroz integral de alta qualidade.', 6, 6, 5.99, NULL, 'Ativo'),
(7, 'Conjunto de Vasos Decorativos', 'Vasos de cerâmica para decoração.', 7, 7, 39.99, NULL, 'Ativo'),
(8, 'Kit de Lâmpadas LED para Carros', 'Conjunto de lâmpadas LED automotivas.', 8, 8, 29.99, NULL, 'Ativo'),
(9, 'Quebra-Cabeça 1000 Peças', 'Quebra-cabeça para entretenimento.', 7, 9, 19.99, NULL, 'Ativo'),
(10, 'Ração Premium para Gatos', 'Ração balanceada para gatos adultos.', 10, 10, 15.99, NULL, 'Ativo');

INSERT INTO Pedido (id_pedido, cliente_id, produto_id, quantidade, data_pedido) 
VALUES
(1, 1, 1, 2, '2024-04-01'),
(2, 2, 2, 1, '2024-04-03'),
(3, 3, 3, 1, '2024-04-05'),
(4, 4, 4, 3, '2024-04-07'),
(5, 5, 5, 2, '2024-04-09'),
(6, 6, 6, 1, '2024-04-11'),
(7, 7, 7, 2, '2024-04-13'),
(8, 8, 8, 1, '2024-04-15'),
(9, 9, 9, 4, '2024-04-17'),
(10, 10, 10, 2, '2024-04-19');

INSERT INTO Pedido (id_pedido, cliente_id, produto_id, quantidade, data_pedido) 
VALUES
(11, 3, 4, 2, '2020-04-21'),
(12, 4, 5, 1, '2020-01-23'),
(13, 1, 6, 3, '2020-01-25'),
(14, 6, 7, 2, '2020-01-27'),
(15, 1, 8, 1, '2020-01-29'),
(16, 1, 9, 4, '2020-01-01'),
(17, 1, 10, 2, '2020-05-03'),
(18, 10, 1, 1, '2020-01-05'),
(19, 1, 7, 3, '2020-01-07'),
(20, 1, 3, 2, '2020-01-09'),
(21, 3, 4, 1, '2020-01-11'),
(22, 4, 7, 2, '2020-01-13'),
(23, 5, 7, 1, '2020-05-15'),
(24, 6, 7, 3, '2020-01-17'),
(25, 7, 8, 2, '2020-01-19'),
(26, 8, 7, 1, '2020-01-21'),
(27, 7, 10, 2, '2020-01-23'),
(28, 10, 1, 1, '2020-01-25'),
(29, 7, 2, 2, '2020-01-27'),
(30, 1, 3, 1, '2020-01-29'),
(31, 3, 4, 4, '2020-01-01'),
(32, 7, 5, 2, '2020-01-03'),
(33, 5, 7, 1, '2020-01-05'),
(34, 1, 7, 3, '2020-01-07'),
(35, 1, 8, 2, '2020-01-09'),
(36, 1, 9, 1, '2020-01-11'),
(37, 9, 7, 2, '2020-01-13'),
(38, 10, 1, 1, '2020-01-15'),
(39, 1, 2, 3, '2020-01-17'),
(40, 1, 3, 2, '2020-01-19');