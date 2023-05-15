-- jornada de compra
INSERT INTO carrinho_compras
	(compradorID, andamentoCarrinho, criadoEm)
VALUES (2, "Continuar Comprando", now());

-- adicionando produtos
INSERT INTO carrinho_itens
	(produtoID, carrinhoID, quantidade)
VALUES (18, 2, 1);
UPDATE carrinho_itens
SET valor = (SELECT valor FROM produto WHERE produtoID=18)
WHERE produtoID = 18;

INSERT INTO carrinho_itens
	(produtoID, carrinhoID, quantidade)
VALUES (21, 2, 1);
UPDATE carrinho_itens
SET valor = (SELECT valor FROM produto WHERE produtoID=21)
WHERE produtoID = 21;

INSERT INTO carrinho_itens
	(produtoID, carrinhoID, quantidade)
VALUES (19, 2, 1);

INSERT INTO carrinho_itens
	(produtoID, carrinhoID, quantidade)
VALUES (7, 2, 6);
UPDATE carrinho_itens
	SET total = valor * quantidade;
    
UPDATE carrinho_itens 
SET valor = (SELECT valor FROM produto WHERE produtoID=19)
WHERE produtoID=19;

UPDATE carrinho_itens
SET valor = (SELECT valor FROM produto WHERE produtoID=7)
WHERE produtoID=7;

-- finalizando o carrinho
UPDATE carrinho_compras 
SET andamentoCarrinho = "Finalizar Compra", finalizadoEm = now()
WHERE carrinhoID=2;

INSERT INTO pedido
	(compradorID, carrinhoID, andamentoPedido, valorItens)
VALUES (2, 2, "Processamento", (SELECT SUM(total) FROM carrinho_itens WHERE carrinhoID=2));
UPDATE pedido
SET frete = 9.90, alteradoEm = now()
WHERE carrinhoID=2;

-- atualizando o estoque
UPDATE estoque AS e
JOIN carrinho_itens AS ci ON e.produtoID = ci.produtoID
SET e.quantidadeProduto = e.quantidadeProduto - ci.quantidade
WHERE ci.carrinhoID = 2;



-- escolhendo pagamento
INSERT INTO pagamento
	(compradorID, tipoPagamento)
VALUES (2, "Pix");

INSERT INTO	finalizacao_pedido
	(compradorID, pedidoID, totalPedido, pagamentoID)
VALUES (2, 2, (SELECT valorItens + frete FROM pedido WHERE pedidoID=2), 1);

-- faturando pedido
UPDATE finalizacao_pedido
SET finalizadoEm=now()
WHERE finalizacaoID=1;

UPDATE pedido
SET andamentoPedido = "Faturado", alteradoEm = now()
WHERE pedidoID = 2;