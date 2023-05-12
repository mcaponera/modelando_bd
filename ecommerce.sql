-- criação de banco de dados e-commerce
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- tabelas relativas aos compradores, vendedores e fornecedores,
-- seus endereços e formas de pagamento (comprador), abstraindo os cadastros pf e pj
CREATE TABLE IF NOT EXISTS endereco(
		enderecoID INT AUTO_INCREMENT NOT NULL,
		cep CHAR(8) NOT NULL,
        cidade VARCHAR(45) NOT NULL,
        bairro VARCHAR(45) NOT NULL,
        logradouro VARCHAR(45) NOT NULL,
        numero CHAR(6) NOT NULL,
        complemento VARCHAR(255),
        PRIMARY KEY (enderecoID)
);

CREATE TABLE IF NOT EXISTS fornecedor(
		fornecedorID INT AUTO_INCREMENT NOT NULL,
		nomeFornecedor CHAR(14) NOT NULL,
		fornecedorEnderecoID INT NOT NULL,
		PRIMARY KEY (fornecedorID),
        CONSTRAINT fk_fornecedor_endereco FOREIGN KEY (fornecedorEnderecoID)
        REFERENCES endereco(enderecoID)
);

CREATE TABLE IF NOT EXISTS vendedor(
		vendedorID INT AUTO_INCREMENT NOT NULL,
		nomeVendedor VARCHAR(45) NULL,
		vendedorEnderecoID INT NOT NULL,
        PRIMARY KEY (vendedorID),
		CONSTRAINT fk_vendedor_endereco FOREIGN KEY (vendedorEnderecoID)
        REFERENCES endereco(enderecoID)
);

CREATE TABLE IF NOT EXISTS comprador(
		compradorID INT AUTO_INCREMENT NOT NULL,
        nomeComprador VARCHAR(45) NULL,
        compradorEnderecoID INT NOT NULL,
        PRIMARY KEY (compradorID),
        CONSTRAINT fk_comprador_endereco FOREIGN KEY (compradorEnderecoID)
        REFERENCES endereco(enderecoID)
);

CREATE TABLE cliente_pj(
		cliente_pjID INT AUTO_INCREMENT NOT NULL,
		cnpjClientePJ CHAR(14) NOT NULL,
		nomeClientePJ VARCHAR(20) NOT NULL,
		sobrenomeClientePJ VARCHAR(45) NOT NULL,
        telefoneClientePJ CHAR(11) NOT NULL,
        enderecoID INT NOT NULL,
		emailClientePJ VARCHAR(45) NOT NULL,
        compradorID INT,
        vendedorID INT,
        fornecedorID INT,
        PRIMARY KEY (cliente_pjID),
		UNIQUE KEY unique_cnpj_cliente_pj (cnpjClientePJ),
		UNIQUE KEY unique_email_cliente_pj (emailClientePJ),
		CONSTRAINT fk_clientepj_endereco FOREIGN KEY (enderecoID)
        REFERENCES endereco(enderecoID),
        CONSTRAINT fk_pj_comprador FOREIGN KEY (compradorID)
        REFERENCES comprador(compradorID),
        CONSTRAINT fk_pj_vendedor FOREIGN KEY (vendedorID)
        REFERENCES vendedor(vendedorID),
        CONSTRAINT fk_fornecedor FOREIGN KEY (fornecedorID)
        REFERENCES fornecedor(fornecedorID)
  );

CREATE TABLE IF NOT EXISTS cliente_pf(
		cliente_pfID INT AUTO_INCREMENT NOT NULL,
		cpfClientePF CHAR(11) NOT NULL,
        nomeClientePF VARCHAR(20) NOT NULL,
		sobrenomeClientePF VARCHAR(45) NOT NULL,
        telefoneClientePF CHAR(11) NOT NULL,
        enderecoID INT NOT NULL,
		emailClientePF VARCHAR(45) NOT NULL,
        compradorID INT,
        vendedorID INT,
        PRIMARY KEY (cliente_pfID),
        UNIQUE KEY unique_cpf_cliente (cpfClientePF),
        UNIQUE KEY unique_email_cliente (emailClientePF),
        CONSTRAINT fk_clientepf_endereco FOREIGN KEY (enderecoID)
        REFERENCES endereco(enderecoID),
		CONSTRAINT fk_pf_comprador FOREIGN KEY (compradorID)
        REFERENCES comprador(compradorID),
        CONSTRAINT fk_pf_vendedor FOREIGN KEY (vendedorID)
        REFERENCES vendedor(vendedorID)
);

CREATE TABLE IF NOT EXISTS pagamento(
		pagamentoID INT NOT NULL AUTO_INCREMENT,
		numero_cartao CHAR(16) NULL,
		validade DATE NULL,
		titular VARCHAR(45) NULL,
		compradorID INT NOT NULL,
		tipoPagamento ENUM('Boleto', 'Pix', 'Cartão') NOT NULL,
  		PRIMARY KEY (pagamentoID),
  		CONSTRAINT fk_pagamento_comprador FOREIGN KEY (compradorID)
		REFERENCES comprador(compradorID)
);
-- tabelas referentes aos produtos e suas disponiblilidades

CREATE TABLE IF NOT EXISTS produto(
		produtoID INT AUTO_INCREMENT NOT NULL,
		categoria ENUM('Eletrônicos','Alimentício','Brinquedos','Vestuário','Casa') NOT NULL,
        nome_produto VARCHAR(20) NOT NULL,
		descricao VARCHAR(45),
        tamanho VARCHAR(10),
		valor DECIMAL(10,2),
        avaliacao DECIMAL(1,1),
		vendedorID INT,
        fornecedorID INT,
        PRIMARY KEY (produtoID),
        CONSTRAINT fk_produto_fornecedor FOREIGN KEY (fornecedorID)
        REFERENCES fornecedor(fornecedorID),
        CONSTRAINT fk_produto_vendedor FOREIGN KEY (vendedorID)
        REFERENCES vendedor(vendedorID)
);

CREATE TABLE IF NOT EXISTS estoque(
		estoqueID INT AUTO_INCREMENT NOT NULL,
		enderecoID INT,
        produtoID INT,
        quantidadeProduto INT NOT NULL,
		PRIMARY KEY (estoqueID),
        CONSTRAINT fk_estoque_produto FOREIGN KEY (produtoID)
        REFERENCES produto(produtoID),
        CONSTRAINT fk_estoque_endereco FOREIGN KEY (enderecoID)
        REFERENCES endereco(enderecoID)
);

-- criar sessão de compra (carrinho_compras e itens_carrinho)

CREATE TABLE IF NOT EXISTS carrinho_compras(
		carrinhoID INT AUTO_INCREMENT NOT NULL,
        compradorID INT NOT NULL,
        andamentoCarrinho ENUM('Continuar Comprando', 'Finalizar Compra') DEFAULT 'Continuar Comprando',
        criadoEm DATETIME,
        finalizadoEm DATETIME,
        PRIMARY KEY (carrinhoID),
        CONSTRAINT fk_carrinho_comprador FOREIGN KEY (compradorID)
        REFERENCES comprador(compradorID)
);

CREATE TABLE IF NOT EXISTS carrinho_itens(
		itensID INT AUTO_INCREMENT NOT NULL,
        produtoID INT NOT NULL,
        carrinhoID INT NOT NULL,
        valor DECIMAL(10,2),
		quantidade INT NOT NULL DEFAULT 1,
        PRIMARY KEY (itensID),
        CONSTRAINT fk_carrinhoItens_produto FOREIGN KEY (produtoID)
        REFERENCES produto(produtoID),
        CONSTRAINT fk_carrinhoIten_carrinho FOREIGN KEY (carrinhoID)
        REFERENCES carrinho_compras(carrinhoID)
);

-- tabelas referentes a finalização do pedido e transação

CREATE TABLE IF NOT EXISTS pedido(
		pedidoID INT AUTO_INCREMENT NOT NULL,
        compradorID INT NOT NULL,
		carrinhoID INT NOT NULL,
		andamentoPedido ENUM('Cancelado','Processamento','Faturado', 'Em Trânsito') NOT NULL,
		descricao VARCHAR(255),
		valorItens DECIMAL(10,2) NOT NULL,
		frete DECIMAL(10,2) DEFAULT 0,
		criadoEm DATETIME,
        alteradoEm DATETIME,
        finalizadoEm DATETIME,
        PRIMARY KEY (pedidoID),
        CONSTRAINT fk_pedido_comprador FOREIGN KEY (compradorID)
        REFERENCES comprador(compradorID)
);

CREATE TABLE IF NOT EXISTS pedido_itens(
		itensID INT AUTO_INCREMENT NOT NULL,
        produtoID INT NOT NULL,
        pedidoID INT NOT NULL,
		quantidade INT NOT NULL DEFAULT 1,
        PRIMARY KEY (itensID),
        CONSTRAINT fk_pedidoItem_produto FOREIGN KEY (produtoID)
        REFERENCES pedido(pedidoID),
        CONSTRAINT fk_pedidoItem_pedido FOREIGN KEY (pedidoID)
        REFERENCES pedido(pedidoID)
);

 CREATE TABLE IF NOT EXISTS finalizacao_pedido(
		finalizacaoID INT AUTO_INCREMENT NOT NULL,
        compradorID INT NOT NULL,
        pedidoID INT NOT NULL,
		pagamentoID INT NOT NULL,
        finalizadoEm DATETIME,
        PRIMARY KEY (finalizacaoID),
        CONSTRAINT fk_finalizacao_comprador FOREIGN KEY (compradorID)
        REFERENCES comprador(compradorID),
        CONSTRAINT fk_finalizacao_pedido FOREIGN KEY (pedidoID)
        REFERENCES pedido(pedidoID),
        CONSTRAINT fk_finalizacao_pagamento FOREIGN KEY (pagamentoID)
        REFERENCES pagamento(pagamentoID)
 );

CREATE TABLE IF NOT EXISTS entrega(
		compradorID INT,
        pedidoID INT,
        andamento_entrega ENUM('Processando','Em trânsito','Saiu pra entrega') DEFAULT 'Processando' NOT NULL,
		rastreio VARCHAR(45),
		CONSTRAINT pk_entregaID PRIMARY KEY (pedidoID, compradorID),
		CONSTRAINT fk_entrega_pedido FOREIGN KEY (pedidoID)
		REFERENCES pedido(pedidoID),
		CONSTRAINT fk_entrega_comprador FOREIGN KEY (compradorID)
		REFERENCES comprador(compradorID)
 );