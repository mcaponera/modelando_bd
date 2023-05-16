-- fornecedores
INSERT INTO fornecedores
	(razao_social_fornecedor, cnpj_fornecedor, email_fornecedor, telefone_fornecedor)
VALUES ("Mariana e Sueli Autopeças Ltda", 54893493000165, "ouvidoria@msautopecas.com.br", 1125651751);

INSERT INTO fornecedores
	(razao_social_fornecedor, cnpj_fornecedor, email_fornecedor, telefone_fornecedor)
VALUES ("Lorenzo Autoparts ME", 48522047000141, "clientes@lorenzoauto.com.br", 1125651751);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("CORREIA DENTADA STRADA 1.6 16V 1996 A 2003", "CONTITECH", 1, 133.00, 8);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("JUNTA COLETOR ADMISSAO", "TARANTO", 1, 6.50, 20);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("RETENTOR POLIA", "TARANTO", 1, 10.00, 23);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("FILTRO DE COMBUSTÍVEL", "MANN", 1, 10.50, 12);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("CABO IGNIÇÃO", "DELPHI", 1, 40.02, 12);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("VELA DE IGNIÇÃO", "NGK", 1, 15.26, 30);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("AMORTECEDOR DIANTEIRO", "COFAP", 2, 97.80, 3);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("AMORTECEDOR TRASEIRO", "COFAP", 2, 149.52, 3);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("Óleo do motor", "Mobil", 2, 26.30, 54);

INSERT INTO pecas_produtos
	(peca_produto, marca, idfornecedor, valor, quantidade_estoque)
VALUES ("Aditivo para radiador", "ACDelco", 2, 42.26, 41);