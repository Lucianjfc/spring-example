-- Tabela de Usuários
CREATE TABLE usuario
(
    id    BIGINT IDENTITY(1,1) PRIMARY KEY,
    nome  VARCHAR(100)        NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
);

-- Tabela de Produtos
CREATE TABLE produto
(
    id        BIGINT IDENTITY(1,1) PRIMARY KEY,
    nome      VARCHAR(100)   NOT NULL,
    descricao VARCHAR(255),
    preco     NUMERIC(10, 2) NOT NULL,
    estoque   BIGINT         NOT NULL
);

-- Tabela de Pedidos
CREATE TABLE pedido
(
    id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    usuario_id  BIGINT      NOT NULL,
    data_pedido DATETIME             DEFAULT GETDATE(),
    status      VARCHAR(50) NOT NULL DEFAULT 'PENDENTE',
    FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE
);

-- Tabela de relação entre Pedido e Produto (N:N)
CREATE TABLE pedido_produto
(
    pedido_id  BIGINT NOT NULL,
    produto_id BIGINT NOT NULL,
    quantidade BIGINT NOT NULL,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedido (id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produto (id) ON DELETE CASCADE
);
