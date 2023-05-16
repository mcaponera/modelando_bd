USE oficina_mecanica;

-- inserindo cliente pf
INSERT INTO cadastro_pf
	(nome_cliente, sobrenome_cliente, telefone_cliente, cpf, data_nascimento, end_rua, end_numero, end_bairro, end_cidade, end_uf)
VALUES ("Elaine", "Ferreira", 51992631995, 23249309001, 19880120, "Avenida Inconfidência", 189, "Centro", "Canoas", "RS");
INSERT INTO clientes
	(email, tipo_cliente, cpf)
VALUES ("elaine@teravida.com.br", "PF", 23249309001);

INSERT INTO cadastro_pf
	(nome_cliente, sobrenome_cliente, telefone_cliente, cpf, data_nascimento, end_rua, end_numero, end_bairro, end_cidade, end_uf)
VALUES ("João Mário", "Carvalho", 51985914490, 41840494000, 19880409, "Rua Rodrigues de Macêdo", 821, "Arroio da Manteiga", "São Leopoldo", "RS");
INSERT INTO clientes
	(email, tipo_cliente, cpf)
VALUES ("jm_carvalho@landovale.com.br", "PF", 41840494000);

INSERT INTO cadastro_pf
	(nome_cliente, sobrenome_cliente, telefone_cliente, cpf, data_nascimento, end_rua, end_numero, end_bairro, end_cidade, end_uf)
VALUES ("Stella", "Sebastiana Aparício", 55996184262, 25852936022, 19440221, "Rua Quinze de Novembro", 590, "Sossego", "Santo Ângelo", "RS");
INSERT INTO clientes
	(email, tipo_cliente, cpf)
VALUES ("stella.aparicio@email.com", "PF", 25852936022);

-- inserindo cliente pj
INSERT INTO cadastro_pj
	(razao_social_cliente, telefone_cliente, cnpj, end_rua, end_numero, end_bairro, end_cidade, end_uf)
VALUES ("Carolina e Eloá Corretores Associados Ltda", 5538670440, 66547391000177, "Rua Antônio Bertei", 875, "Arco Íris", "Cruz Alta", "RS");
INSERT INTO clientes
	(email, tipo_cliente, cnpj)
VALUES ("carol.eloa@casanova.com.br", "PJ", 66547391000177);
    
INSERT INTO cadastro_pj
	(razao_social_cliente, telefone_cliente, cnpj, end_rua, end_numero, end_bairro, end_cidade, end_uf)
VALUES ("Marcelo e Hugo Marcenaria ME", 5129451501, 22302437000112, "Rua Sete de Setembro", 179, "Santos Dumont", "São Leopoldo", "RS");
INSERT INTO clientes
	(email, tipo_cliente, cnpj)
VALUES ("adm@mhmarcenaria.com.br", "PJ", 22302437000112);

INSERT INTO cadastro_pj
	(razao_social_cliente, telefone_cliente, cnpj, end_rua, end_numero, end_bairro, end_cidade, end_uf)
VALUES ("Giovanni e Betina Telecom ME", 5126093752, 94614073000117, "Rua Pedro José Zanetti", 360, "Igara", "Cruz Alta", "RS");
INSERT INTO clientes
	(email, tipo_cliente, cnpj)
VALUES ("contato@gbettelecom.com.br", "PJ", 94614073000117);

INSERT INTO cadastro_pj
	(razao_social_cliente, telefone_cliente, cnpj, end_rua, end_numero, end_bairro, end_cidade, end_uf)
VALUES ("Emanuelly e João Filmagens Ltda", 5425519251, 11513461000184, "Rua Araújo Lima", 1020, "Centro", "Erechim", "RS");
INSERT INTO clientes
	(email, tipo_cliente, cnpj)
VALUES ("joao@sorria.com", "PJ", 11513461000184);

-- inserindo veiculos
INSERT INTO veiculo
	(marca, modelo, motor, combustivel, ano, placa, idcliente)
VALUES ("Cadillac", "Deville/Eldorado", 4.9, "Gasolina", 1991, "IZB4947", 1);

INSERT INTO veiculo
	(marca, modelo, motor, combustivel, ano, placa, idcliente)
VALUES ("CHERY", "CIELO Sedan 16V", 1.6, "Flex", 2010, "IML4104", 2);

INSERT INTO veiculo
	(marca, modelo, motor, combustivel, ano, placa, idcliente)
VALUES ("Daewoo", "Leganza CDX", 2.0, "Gasolina", 1997, "ISI3170", 3);

INSERT INTO veiculo
	(marca, modelo, motor, combustivel, ano, placa, idcliente)
VALUES ("Gurgel", "Carajas", 1.6, "Diesel", 1985, "IZJ1921", 4);

INSERT INTO veiculo
	(marca, modelo, motor, combustivel, ano, placa, idcliente)
VALUES ("Fiat", "Strada Working", 1.8, "GNV", 2003, "IJY4509", 5);

INSERT INTO veiculo
	(marca, modelo, motor, combustivel, ano, placa, idcliente)
VALUES ("LAMBORGHINI", "Gallardo Coupe Superleggera", 5.2, "Gasolina", 2010, "IUQ7722", 6);

INSERT INTO veiculo
	(marca, modelo, motor, combustivel, ano, placa, idcliente)
VALUES ("Hyundai", "Tucson 16V Aut.", 2.0, "Flex", 2013, "JCX6631", 7);

