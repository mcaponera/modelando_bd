INSERT INTO pedido
	(idcliente, idveiculo, revisao_periodica, atendente, responsavel, andamento)
VALUES (1, 1, 1, 6, 1, "Orçando");

INSERT INTO orcamento
	(idpedido, idfuncionarios, valor_total, aprovado)
VALUES (1, 1, 0, 0);

INSERT INTO itens_orcamento
	(iditens, idorcamento, idpedido, idservico, quantidade_horas)
VALUES (1, 1, 1, 7, 0.5);

INSERT INTO itens_orcamento
	(iditens, idorcamento, idpedido, idservico, quantidade_horas)
VALUES (2, 1, 1, 3, 1);

INSERT INTO itens_orcamento
	(iditens, idorcamento, idpedido, idservico, quantidade_horas, idpecas_produto, quantidade_pecas)
VALUES (3, 1, 1, 2, 1, 9, 1);

-- Obter o valor total dos serviços
SET @valor_servicos := (
    SELECT SUM(servicos.valor_hora * itens_orcamento.quantidade_horas)
    FROM servicos
    INNER JOIN itens_orcamento ON servicos.idservico = itens_orcamento.idservico
    WHERE itens_orcamento.idorcamento = 1
);

-- Obter o valor total das peças/produtos
SET @valor_pecas := (
    SELECT SUM(pecas_produtos.valor * itens_orcamento.quantidade_pecas)
    FROM pecas_produtos
    INNER JOIN itens_orcamento ON pecas_produtos.idpecas_produto = itens_orcamento.idpecas_produto
    WHERE itens_orcamento.idorcamento = 1
);

-- Atualizar o valor_total do orcamento
UPDATE orcamento
SET valor_total = @valor_servicos + @valor_pecas
WHERE idorcamento = 1;

-- orçamento aprovado
UPDATE orcamento SET aprovado = 1 WHERE idpedido = 1;

-- abrindo os
UPDATE pedido SET andamento = "Em execução" WHERE idpedido = 1;

INSERT INTO ordem_servico
	(idorcamento, idpedido, idfuncionarios, valor_total)
VALUES (1, 1, 1, 0);

INSERT INTO itens_os
	(iditens_os, idorcamento, idpedido, idordem_servico, idservico, horas_trabalhadas)
VALUES (1, 1, 1, 1, 7, 1);

INSERT INTO itens_os
	(iditens_os, idorcamento, idpedido, idordem_servico, idservico, horas_trabalhadas)
VALUES (2, 1, 1, 1, 3, 1);

INSERT INTO itens_os
	(iditens_os, idorcamento, idpedido, idordem_servico, idservico, horas_trabalhadas, idpecas_produto, quantidade_peca_produto)
VALUES (3, 1, 1, 1, 2, 1, 9, 1);

-- Obter o valor total dos serviços
SET @valor_servicos_os := (
    SELECT SUM(servicos.valor_hora * itens_os.horas_trabalhadas)
    FROM servicos
    INNER JOIN itens_os ON servicos.idservico = itens_os.idservico
    WHERE itens_os.idordem_servico = 1
);

-- Obter o valor total das peças/produtos
SET @valor_pecas_os := (
    SELECT SUM(pecas_produtos.valor * itens_os.quantidade_peca_produto)
    FROM pecas_produtos
    INNER JOIN itens_os ON pecas_produtos.idpecas_produto = itens_os.idpecas_produto
    WHERE itens_os.idorcamento = 1
);

-- Atualizar o valor_total do orcamento
UPDATE ordem_servico
SET valor_total = @valor_servicos_os + @valor_pecas_os
WHERE idorcamento = 1;