USE ecommerce;

-- juntadando vendedores e produtos
SELECT p.nome_produto, pj.razaoSocial, pj.enderecoID, p.produtoID, p.tamanho
	FROM produto p INNER JOIN cliente_pj pj
		ON p.vendedorID = pj.vendedorID;

-- juntando produto e estoque
SELECT p.produtoID, p.nome_produto, e.quantidadeProduto
	FROM produto p INNER JOIN estoque e
		ON p.produtoID = e.produtoID;


-- listando todos os clientes, fornecedores e vendedores, seus emails, UFs e cidades    
SELECT c.razaoSocial AS nome, c.cnpjClientePJ AS identificador, c.emailClientePJ AS email, e.uf, e.cidade
FROM endereco e
LEFT JOIN (
    SELECT enderecoID, razaoSocial, cnpjClientePJ, emailClientePJ FROM cliente_pj
    UNION ALL
    SELECT enderecoID, concat(nomeClientePF, " ", sobrenomeClientePF), cpfClientePF, emailClientePF FROM cliente_pf
) c ON e.enderecoID = c.enderecoID;

-- agrupando produtos por vendedores/fornecedores
SELECT cpj.razaoSocial, p.nome_produto, COUNT(*) AS total_produtos
	FROM produto p
JOIN cliente_pj cpj ON p.vendedorID = cpj.vendedorID OR p.fornecedorID = cpj.fornecedorID
GROUP BY cpj.razaoSocial, p.nome_produto;

-- agrupando vendedores e fornecedores que possuam mais de 2 produtos a venda
SELECT cpj.razaoSocial, COUNT(*) AS total_produtos
FROM produto p
JOIN cliente_pj cpj ON p.vendedorID = cpj.vendedorID OR p.fornecedorID = cpj.fornecedorID
GROUP BY cpj.razaoSocial
HAVING COUNT(*) > 2;

-- ordenando os produtos por seus valores
SELECT p.produtoID, p.nome_produto, cpj.razaoSocial, p.tamanho, p.valor
	FROM produto p
JOIN cliente_pj cpj ON p.vendedorID = cpj.vendedorID OR p.fornecedorID = cpj.fornecedorID
ORDER BY valor;