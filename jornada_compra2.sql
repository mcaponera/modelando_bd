-- jornada de compra
INSERT INTO carrinho_compras
	(compradorID, andamentoCarrinho, criadoEm)
VALUES (6, "Continuar Comprando", now());

-- adicionando produtos
INSERT INTO carrinho_itens
	(produtoID, carrinhoID, quantidade)
VALUES (3, 7, 2);
UPDATE carrinho_itens
SET valor = (SELECT valor FROM produto WHERE produtoID=18)
WHERE produtoID = 18;

-- finalizando o carrinho
UPDATE carrinho_compras 
SET andamentoCarrinho = "Finalizar Compra", finalizadoEm = now()
WHERE carrinhoID=7;

INSERT INTO pedido
	(compradorID, carrinhoID, andamentoPedido, valorItens)
VALUES (6, 7, "Processamento", (SELECT SUM(total) FROM carrinho_itens WHERE carrinhoID=2));
UPDATE pedido
SET frete = 0.00, alteradoEm = now()
WHERE carrinhoID=7;

-- escolhendo pagamento
INSERT INTO pagamento
	(compradorID, tipoPagamento, numero_cartao, validade, titular)
VALUES (6, "Cartão", 5052084095704714, 20240215, "Sophie B R Melo");

INSERT INTO	finalizacao_pedido
	(compradorID, pedidoID, totalPedido, pagamentoID)
VALUES (6, 4, (SELECT valorItens + frete FROM pedido WHERE pedidoID=7), 2);

-- faturando pedido
UPDATE finalizacao_pedido
SET finalizadoEm=now()
WHERE finalizacaoID=2;

INSERT INTO pedido
	(compradorID, carrinhoID, andamentoPedido, valorItens)
VALUES (6, 7, "Processamento", (SELECT SUM(total) FROM carrinho_itens WHERE carrinhoID=7));
UPDATE pedido
SET frete = 0.00, alteradoEm = now()
WHERE carrinhoID=7;

-- atualizando estoque
UPDATE estoque AS e
JOIN carrinho_itens AS ci ON e.produtoID = ci.produtoID
SET e.quantidadeProduto = e.quantidadeProduto - ci.quantidade
WHERE ci.carrinhoID = 7;


UPDATE pedido
SET andamentoPedido = "Em Trânsito", alteradoEm = now()
WHERE pedidoID = 2;