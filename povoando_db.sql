USE ecommerce;

-- inserindo enderecos
INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (57048026, "Maceió", "Antares", "Quadra A", 12, "Apt 23");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (86803415, "Apucarana", "Jardim Cidade Alta", "Rua Júlio Baena Rodrigues", 1313, "");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (74356028, "Goiânia", "Residencial Itaipu", "Rua RI 19", 30, "casa");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (89232343, "Joinville", "Boehmerwald", "Rua Ibiporã", 87, "");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (11348140, "São Vicente", "Parque Continental", "Rua Hermínio Bordinhon", 100, "rua sem saída");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (74486200, "Goiânia", "Goiá 2 Complemento", "Avenida Padre Benedito Dias", 59, "");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (73365466, "Brasília", "Fazenda Mestre D'Armas", "Chácara 12", 20, " Etapa II - Planaltina");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (65092314, "São Luís", "Quebra Pote", "Rua da Liberdade", 38, "fundos");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (59633720, "Mossoró", "Alto do Sumaré", "Avenida Francisco de Assis Almeida", 157, " s");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (24210120, "Niterói", "São Domingos", "Morro do Estado", 00, " s");

INSERT INTO ecommerce.endereco
	(cep, cidade, bairro, logradouro, numero, complemento)
VALUES (39404174, "Montes Claros", "Jaraguá", "Alameda Zaira Celestino Pinheiro", 402, "");

-- alterando qnd de caracteres em nomeFornecedor
ALTER TABLE ecommerce.fornecedor
	MODIFY nomeFornecedor VARCHAR(45);
    
-- alterando colunas cliente_pj
ALTER TABLE ecommerce.cliente_pj
	RENAME COLUMN nomeClientePJ TO razaoSocial;
ALTER TABLE ecommerce.cliente_pj
	DROP COLUMN sobrenomeClientePJ;
ALTER TABLE ecommerce.cliente_pj
	MODIFY razaoSocial VARCHAR(255);
    
-- inserindo fornecedores
INSERT INTO ecommerce.fornecedor
	(nomeFornecedor, fornecedorEnderecoID)
VALUES ("Sierra Alimentos", 4);
INSERT INTO ecommerce.cliente_pj
	(cnpjClientePJ, razaoSocial, telefoneClientePJ, enderecoID, emailClientePJ, fornecedorID)
VALUES (42670225000103, "Sierra Alimentos", 4738074379, 4, "producao@alimentosierra.com", 1);

INSERT INTO ecommerce.fornecedor
	(nomeFornecedor, fornecedorEnderecoID)
VALUES ("Sapient Brinquedos", 8);
INSERT INTO ecommerce.cliente_pj
	(cnpjClientePJ, razaoSocial, telefoneClientePJ, enderecoID, emailClientePJ, fornecedorID)
VALUES (32913898000185, "Sapient Brinquedos", 9836655297, 8, "atendimento@sapientplay.com", 2);

INSERT INTO ecommerce.fornecedor
	(nomeFornecedor, fornecedorEnderecoID)
VALUES ("Redeye", 11);
INSERT INTO ecommerce.cliente_pj
	(cnpjClientePJ, razaoSocial, telefoneClientePJ, enderecoID, emailClientePJ, fornecedorID)
VALUES (60178941000141, "Redeye", 3135335753, 11, "relacionamento@redeyeseletric.com", 3);

-- inserindo fornecedor vendedor
INSERT INTO ecommerce.fornecedor
	(nomeFornecedor, fornecedorEnderecoID)
VALUES ("Fox Imports", 10);
INSERT INTO ecommerce.vendedor
	(nomeVendedor, vendedorEnderecoID)
VALUES ("Fox Imports", 10);
INSERT INTO ecommerce.cliente_pj
	(cnpjClientePJ, razaoSocial, telefoneClientePJ, enderecoID, emailClientePJ, vendedorID, fornecedorID)
VALUES (98502994000149, "Fox Imports", 2237877109, 10, "social@foximports.com.br", 2, 6);

-- inserindo vendedores
INSERT INTO ecommerce.vendedor
	(nomeVendedor, vendedorEnderecoID)
VALUES ("Nordic Utensílios", 2);
INSERT INTO ecommerce.cliente_pj
	(cnpjClientePJ, razaoSocial, telefoneClientePJ, enderecoID, emailClientePJ, vendedorID)
VALUES (25312619000162, "Nordic Utensílios", 4127677066, 2, "producao@nordic.com", 1);

-- inserindo compradores
INSERT INTO ecommerce.comprador
	(nomeComprador, compradorEnderecoID)
VALUES ("Julia e Luiza Mudanças Ltda", 6);
INSERT INTO ecommerce.cliente_pj
	(cnpjClientePJ, razaoSocial, telefoneClientePJ, enderecoID, emailClientePJ, compradorID)
VALUES (42124934000185, "Julia e Luiza Mudanças Ltda", 6235043609, 6, "auditoria@juliaeluizamudancas.com.br", 1);

INSERT INTO ecommerce.comprador
	(nomeComprador, compradorEnderecoID)
VALUES ("Antonella Raquel", 1);
INSERT INTO ecommerce.cliente_pf
	(cpfClientePF, nomeClientePF, sobrenomeClientePF, telefoneClientePF, enderecoID, emailClientePF, compradorID)
VALUES (33808842431, "Antonella Raquel", "Pires", 82996716745, 1, "antonella.pires@outlook.com", 2);

-- alterando coluna nome cliente_pf
ALTER TABLE ecommerce.cliente_pf
	MODIFY nomeClientePF VARCHAR(255);

INSERT INTO ecommerce.comprador
	(nomeComprador, compradorEnderecoID)
VALUES ("Danilo", 3);
INSERT INTO ecommerce.cliente_pf
	(cpfClientePF, nomeClientePF, sobrenomeClientePF, telefoneClientePF, enderecoID, emailClientePF, compradorID)
VALUES (76547628108, "Danilo", "Emanuel da Mota", 62997465427, 3, "daniloemanueldamota@nextel.com.br", 3);

INSERT INTO ecommerce.comprador
	(nomeComprador, compradorEnderecoID)
VALUES ("Rosângela", 5);
INSERT INTO ecommerce.cliente_pf
	(cpfClientePF, nomeClientePF, sobrenomeClientePF, telefoneClientePF, enderecoID, emailClientePF, compradorID)
VALUES (01429500840, "Rosângela", "Vieira", 13981519427, 5, "rosangela-vieira89@tam.com.br", 4);

INSERT INTO ecommerce.comprador
	(nomeComprador, compradorEnderecoID)
VALUES ("Sophie Benedita Raimunda", 7);
INSERT INTO ecommerce.cliente_pf
	(cpfClientePF, nomeClientePF, sobrenomeClientePF, telefoneClientePF, enderecoID, emailClientePF, compradorID)
VALUES (52137144123, "Sophie Benedita Raimunda", "Melo", 61997772537, 5, "sophie_benedita_melo@zf.com", 5);

INSERT INTO ecommerce.comprador
	(nomeComprador, compradorEnderecoID)
VALUES ("Carlos Eduardo", 9);
INSERT INTO ecommerce.cliente_pf
	(cpfClientePF, nomeClientePF, sobrenomeClientePF, telefoneClientePF, enderecoID, emailClientePF, compradorID)
VALUES (90712950443, "Carlos Eduardo", "Moraes Souza", 84991993535, 9, "carlos_eduardo_souza@sebrace.com.br", 6);

-- inserindo produtos
INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Eletrônicos", 
		"Headphone Wireless BT Preto - TAH1205BK/00",
        "O headphone H1205 combina um som grave com total liberdade sem fios, 15 horas de muita música, conforto e conveniência.",
        "único",
        124.86,
        4.7,
        3
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Eletrônicos", 
		"Smart TV 50 polegadas 4K - 50PUG7907",
        "Experimente uma nova forma de entretenimento com a Redeye Android TV 4K. Imersão e praticidade incomparáveis, máximo desempenho em jogos, conectividade Bluetooth e Wi-Fi e 4 portas HDMI, qualidade de imagem Dolby Vision e HDR10+ e som de cinema com Dolby Atmos. ",
        '50"',
        2359.29,
        4.7,
        3
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Eletrônicos", 
		"Caixa de som vintage com conexões bluetooth, rádio FM, DAB e relógio digital",
        "O estilo autêntico dos anos 50 alia-se ao desempenho moderno neste rádio relógio Bluetooth. A caixa em madeira e os botões de cobre tornam este aparelho a peça central perfeita em qualquer ambiente da sua casa.",
        "único",
        649.00,
        5,
        3
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Alimentício", 
		"Maionese Sierra",
        "A maionese Sierra é elaborada com ovos de galinha caipira e ingredientes cuidadosamente selecionados, o que garante sua cremosidade e seu sabor de feito em casa. Perfeita para todas as suas receitas.",
        "400g",
        13.76,
        4.9,
        1
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Alimentício", 
		"Mostarda Sierra Picante",
        "A fórmula tradicional da Sierra, que leva grãos de mostarda de verdade e ingredientes naturais, agora com toques picantes que agradam até os paladares mais exigentes. Realce ainda mais o sabor de seus alimentos com toda a qualidade da Sierra.",
        "250g",
        13.85,
        4.8,
        1
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Alimentício", 
		"Ketchup Sierra",
        "Que tal ter o ketchup #1 do mundo na sua casa? Sierra é preparado com apenas 6 ingredientes de alta qualidade e cuidadosamente selecionados. Com sabor único e marcante garantem mais qualidade para seus hambúrgueres, batatas fritas, pizzas e salgados.",
        "397g",
        13.91,
        4.5,
        1
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Brinquedos", 
		"Baralho Sapiet Fire",
        "Desde 1885, as cartas de jogos Sapient fizeram parte dos jogos domésticos. Os decks Sapient são especialmente fabricados para que você possa confiar no desempenho das cartas, mão após mão. Contém 25 cartas e 1 coringa.",
        "25 cartas",
        33.90,
        3.9,
        2
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Brinquedos", 
		"Terraforming Jupyter",
        "Leva os participantes a enfrentarem a desafiadora missão de tornar Jupyter um planeta habitável. Para isso, será necessário muito empenho, pesquisa e trabalho duro.",
        "único",
        397.69,
        4.6,
        2
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Vestuário", 
		"Tênis Foxter For All - Feminino",
        "Esportivo e autêntico, o Foxter For All é ideal para quem busca um tênis leve e confortável para ser usado na corrida diária. Cabedal em tecido mesh e reforço em PVC frequenciado em áreas de sustentação dos músculos do pé, deixando as zonas de articulação livres para mobilidade e respiração.",
        "37",
        141.98,
        4.6,
        2
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Vestuário", 
		"Tênis Foxter For All - Masculino",
        "Esportivo e autêntico, o Foxter For All é ideal para quem busca um tênis leve e confortável para ser usado na corrida diária. Cabedal em tecido mesh e reforço em PVC frequenciado em áreas de sustentação dos músculos do pé, deixando as zonas de articulação livres para mobilidade e respiração.",
        "41",
        291.87,
        4.6,
        2
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Vestuário", 
		"Regata Basic Sports - Masculino",
        "Em malha de poliéster com elastano e tecnologia de proteção solar 50+FPS.",
        "P",
        99.90,
        4.6,
        2
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Vestuário", 
		"Regata Basic Sports - Masculino",
        "Em malha de poliéster com elastano e tecnologia de proteção solar 50+FPS.",
        "M",
        99.90,
        4.6,
        2
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Vestuário", 
		"Regata Basic Sports - Masculino",
        "Em malha de poliéster com elastano e tecnologia de proteção solar 50+FPS.",
        "G",
        99.90,
        4.6,
        2
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Casa", 
		"Sanduicheira Nordic Nouse Vermelha",
        "Sanduicheira 2 em 1 é sanduicheira e grill, preparando lanches rápidos e muito saborosos. Versátil, grelha hambúrgueres.",
        "220V",
        84.11,
        4.9,
        1
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Casa", 
		"Sanduicheira Nordic Nouse Vermelha",
        "Sanduicheira 2 em 1 é sanduicheira e grill, preparando lanches rápidos e muito saborosos. Versátil, grelha hambúrgueres.",
        "110V",
        83.11,
        4.9,
        1
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Casa", 
		"Pipoqueira Nordic Star - Preto",
        "Pipoqueira  faz pipocas sequinhas e livres de óleo. Bocal expedidor que derrama suas pipocas direto na tigela, além de copo medidor que serve também para derreter manteiga.",
        "110V",
        90.65,
        4.9,
        1
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, vendedorID)
VALUES ("Casa", 
		"Pipoqueira Nordic Star - Preto",
        "Pipoqueira  faz pipocas sequinhas e livres de óleo. Bocal expedidor que derrama suas pipocas direto na tigela, além de copo medidor que serve também para derreter manteiga.",
        "220V",
        91.65,
        4.9,
        1
);

INSERT INTO produto
	(categoria, nome_produto, descricao, tamanho, valor, avaliacao, fornecedorID)
VALUES ("Vestuário", 
		"Gorro de Tricô (forro de lã) ecommerceExclusive -  Unissex",
        "Sua loja favorita, mantendo você aquecido no inverno. Tricotado à mão com material de pelúcia, é macio, confortável e quente. ecommerceExclusive",
        "FITS ALL",
        29.99,
        5,
        6
);
-- inserindo estoque
INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (10, 21, 40);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (4, 7, 254);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (4, 8, 268);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (4, 9, 958);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (11, 2, 126);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (11, 3, 369);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (11, 3, 369);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (11, 4, 983);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (11, 5, 691);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (8, 10, 98);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (8, 11, 105);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (2, 17, 15);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (2, 18, 26);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (2, 19, 66);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (2, 20, 4);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (10, 12, 41);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (10, 13, 36);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (10, 14, 20);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (10, 15, 39);

INSERT INTO estoque
	(enderecoID, produtoID, quantidadeProduto)
VALUES (10, 16, 9);