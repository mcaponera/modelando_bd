CREATE SCHEMA oficina_mecanica;
USE oficina_mecanica;

-- criando tabela de clientes pessoa física
CREATE TABLE IF NOT EXISTS cliente_pf(
  idcliente INT NOT NULL AUTO_INCREMENT,
  nome_cliente VARCHAR(140) NOT NULL,
  sobrenome_cliente VARCHAR(140) NOT NULL,
  telefone_cliente CHAR(11) NOT NULL, 
  cpf CHAR(11) NOT NULL,
  data_nascimento DATE NULL,
  endRua_cliente VARCHAR(145) NOT NULL,
  endNumero_cliente CHAR(6) NOT NULL,
  cidade_cliente VARCHAR(45) NOT NULL,
  uf_cliente CHAR(2) NOT NULL,
  PRIMARY KEY (idcliente),
  CONSTRAINT unique_cpf UNIQUE (cpf)
  );
  
  -- criando tabela de clientes pessoa jurídica
CREATE TABLE IF NOT EXISTS cliente_pj(
  idcliente INT NOT NULL AUTO_INCREMENT,
  razao_social_cliente VARCHAR(140) NOT NULL,
  telefone_cliente CHAR(11) NOT NULL, 
  cnpj CHAR(14) NOT NULL,
  endRua_cliente VARCHAR(145) NOT NULL,
  endNumero_cliente CHAR(6) NOT NULL,
  cidade_cliente VARCHAR(45) NOT NULL,
  uf_cliente CHAR(2) NOT NULL,
  PRIMARY KEY (idcliente),
  CONSTRAINT unique_cnpj UNIQUE (cnpj)
  );
  
  -- criando tabela veículos
CREATE TABLE IF NOT EXISTS veiculo(
  idveiculo INT NOT NULL AUTO_INCREMENT,
  marca VARCHAR(45) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  motor CHAR(3) NOT NULL,
  combustivel ENUM("Gasolina", "Álcool", "Flex", "Diesel", "GNV") NOT NULL DEFAULT "Gasolina",
  ano YEAR NOT NULL,
  placa VARCHAR(10) NOT NULL,
  idcliente INT NOT NULL,
  PRIMARY KEY (idveiculo),
  CONSTRAINT unique_idveiculo
	UNIQUE (idveiculo),
  CONSTRAINT unique_placa 
	UNIQUE (placa),
  CONSTRAINT fk_veiculo_idcliente_pj
    FOREIGN KEY (idcliente)
    REFERENCES cliente_pf (idcliente),
  CONSTRAINT fk_veiculo_idcliente_pf
    FOREIGN KEY (idcliente)
    REFERENCES cliente_pj (idcliente)
);

-- criando opcoes de pagamento
CREATE TABLE IF NOT EXISTS pagamento (
  idpagamento INT NOT NULL AUTO_INCREMENT,
  idcliente INT NOT NULL,
  forma_pagamento ENUM("Pix", "Cartão", "Boleto"),
  numero_cartao CHAR(16),
  validade_m_y CHAR(4),
  PRIMARY KEY (idpagamento),
    CONSTRAINT fk_pagamento_idcliente_pj
    FOREIGN KEY (idcliente)
    REFERENCES cliente_pf (idcliente),
  CONSTRAINT fk_pagamento_idcliente_pf
    FOREIGN KEY (idcliente)
    REFERENCES cliente_pj (idcliente)
);

  -- criando funcionários
CREATE TABLE IF NOT EXISTS funcionarios(
  idfuncionarios INT NOT NULL,
  nome_funcionario VARCHAR(45) NOT NULL,
  sobrenome_funcionario VARCHAR(45) NOT NULL,
  cpf_funcionario CHAR(11) NOT NULL,
  telefone_funcionario CHAR(11) NOT NULL,
  setor_funcionario ENUM("Recepção", "Administrativo", "Mecânico - Motor", "Mecânico - Elétrica", "Mecânico - Pneus") NOT NULL DEFAULT "Recepção",
  PRIMARY KEY (idfuncionarios),
CONSTRAINT unique_cpf_funcionario
	UNIQUE (cpf_funcionario)
);

-- criando serviços
CREATE TABLE IF NOT EXISTS servicos(
  idservico INT NOT NULL AUTO_INCREMENT,
  tipo_servico ENUM("Mecânica - Motor", "Mecânica - Elétrica", "Borracharia") NOT NULL,
  servico VARCHAR(45),
  valor_hora DECIMAL(10,2) NOT NULL,
  funcionario_responsavel INT NOT NULL,
  PRIMARY KEY (idservico),
  CONSTRAINT fk_funcionario_responsavel
    FOREIGN KEY (funcionario_responsavel)
    REFERENCES funcionarios (idfuncionarios),
  CONSTRAINT unique_idservico
	UNIQUE (idservico)
);

-- criando fornecedores
CREATE TABLE IF NOT EXISTS fornecedores(
  idfornecedores INT NOT NULL,
  razao_social_fornecedor VARCHAR(45) NOT NULL,
  cnpj_fornecedor CHAR(14) NOT NULL,
  endRua_fornecedor VARCHAR(145) NOT NULL,
  endNumero_fornecedor CHAR(6) NOT NULL,
  cidade_fornecedor VARCHAR(45) NOT NULL,
  uf_fornecedor CHAR(2) NOT NULL,
  PRIMARY KEY (idfornecedores)
);

-- criando peças_produtos
CREATE TABLE IF NOT EXISTS pecas_produtos (
  idpecas_produto INT NOT NULL AUTO_INCREMENT,
  peca_produto VARCHAR(45) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  idfornecedor INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  quantidade_estoque INT NOT NULL,
  PRIMARY KEY (idpecas_produto),
  CONSTRAINT fk_produtos_fornecedores
    FOREIGN KEY (idfornecedor)
    REFERENCES fornecedores (idfornecedores)
);

-- criando pedido
CREATE TABLE IF NOT EXISTS pedido(
  idpedido INT NOT NULL,
  idcliente INT NOT NULL,
  idveiculo INT NOT NULL,
  revisao_periodica TINYINT NOT NULL COMMENT '1 - verdadeiro\n0 - falso\n',
  atendente INT NOT NULL,
  responsavel INT NOT NULL,
  andamento ENUM("Orçando", "Aguardando Aprovação", "Aguardando Peça", "Em execução", "Pronto pra Retirada", "Entregue"),
  descricao_cliente TEXT NULL,
  PRIMARY KEY (idpedido),
  CONSTRAINT fk_pedido_cliente1
    FOREIGN KEY (idcliente)
    REFERENCES cliente_pf (idcliente),
  CONSTRAINT fk_pedido_veiculo1
    FOREIGN KEY (idveiculo)
    REFERENCES veiculo (idveiculo),
  CONSTRAINT fk_pedido_funcionarios1
    FOREIGN KEY (atendente)
    REFERENCES funcionarios (idfuncionarios),
  CONSTRAINT fk_pedido_funcionarios2
    FOREIGN KEY (responsavel)
    REFERENCES funcionarios (idfuncionarios)
);
-- adicionando coluna pagamento
ALTER TABLE pedido
ADD COLUMN idpagamento INT,
ADD CONSTRAINT fk_pedido_pagamento
FOREIGN KEY (idpagamento)
REFERENCES pagamento (idpagamento);

-- criando orçamento
CREATE TABLE IF NOT EXISTS orcamento(
  idorcamento INT NOT NULL,
  idpedido INT NOT NULL,
  idfuncionarios INT NOT NULL,
  valor_total INT NOT NULL,
  aprovado TINYINT NOT NULL COMMENT '1 - verdadeiro\n0 - falso\n',
  PRIMARY KEY (idorcamento),
  CONSTRAINT fk_orcamento_pedido
    FOREIGN KEY (idpedido)
    REFERENCES pedido (idpedido),
  CONSTRAINT fk_orcamento_funcionarios
    FOREIGN KEY (idfuncionarios)
    REFERENCES funcionarios (idfuncionarios)
);

-- criando itens do orçamento
CREATE TABLE IF NOT EXISTS itens_orcamento(
  iditens INT NOT NULL,
  idorcamento INT NOT NULL,
  idpedido INT NOT NULL,
  idservico INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (idorcamento, idpedido, iditens),
  CONSTRAINT fk_itens_orcamento_orcamento
    FOREIGN KEY (idorcamento)
    REFERENCES orcamento (idorcamento),
  CONSTRAINT fk_itens_orcamento_pedido
    FOREIGN KEY (idpedido)
    REFERENCES pedido (idpedido),
  CONSTRAINT fk_itens_orcamento_servico
    FOREIGN KEY (idservico)
    REFERENCES servicos (idservico)
);

-- criando ordem de serviço
CREATE TABLE IF NOT EXISTS ordem_servico(
  idordem_servico INT NOT NULL,
  idorcamento INT NOT NULL,
  idpedido INT NOT NULL,
  idfuncionarios INT NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idordem_servico),
  CONSTRAINT fk_ordem_servico_orcamento
    FOREIGN KEY (idpedido)
    REFERENCES orcamento (idpedido),
  CONSTRAINT fk_ordem_servico_funcionarios
    FOREIGN KEY (idfuncionarios)
    REFERENCES funcionarios (idfuncionarios)
);

-- criando itens os
CREATE TABLE IF NOT EXISTS itens_os(
  iditens_os INT NOT NULL,
  idpedido INT NOT NULL,
  idorcamento INT NOT NULL,
  idordem_servico INT NOT NULL,
  idservico INT NOT NULL,
  horas_trabalhadas FLOAT NOT NULL,
  idpecas_produto INT,
  quantidade_peca_produto DECIMAL(10,2),
  PRIMARY KEY (idordem_servico, idpedido, iditens_os),
  CONSTRAINT fk_itens_os
    FOREIGN KEY (idordem_servico)
    REFERENCES ordem_servico (idordem_servico),
  CONSTRAINT fk_itens_os_pedido
    FOREIGN KEY (idpedido)
    REFERENCES pedido (idpedido),
  CONSTRAINT fk_itens_os_servico
    FOREIGN KEY (idservico)
    REFERENCES servicos (idservico),
  CONSTRAINT fk_itens_os_pecas_produtos
    FOREIGN KEY (idpecas_produto)
    REFERENCES pecas_produtos (idpecas_produto)
);