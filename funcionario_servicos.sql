-- funcionarios
INSERT INTO funcionarios
	(nome_funcionario, sobrenome_funcionario, cpf_funcionario, telefone_funcionario, setor_funcionario)
VALUES ("Levi Caio", "Cavalcanti", 34231211060, 51995864057, "Mecânico - Pneus");

INSERT INTO funcionarios
	(nome_funcionario, sobrenome_funcionario, cpf_funcionario, telefone_funcionario, setor_funcionario)
VALUES ("Gustavo", "da Silva", 31533286094, 51997036330, "Mecânico - Motor");

INSERT INTO funcionarios
	(nome_funcionario, sobrenome_funcionario, cpf_funcionario, telefone_funcionario, setor_funcionario)
VALUES ("Rafael Luan", "Carvalho", 80272882070, 51987674974, "Mecânico - Motor");

INSERT INTO funcionarios
	(nome_funcionario, sobrenome_funcionario, cpf_funcionario, telefone_funcionario, setor_funcionario)
VALUES ("Gael João", "da Paz", 20547692072, 51998059362, "Mecânico - Elétrica");

INSERT INTO funcionarios
	(nome_funcionario, sobrenome_funcionario, cpf_funcionario, telefone_funcionario, setor_funcionario)
VALUES ("Francisco", "da Mata", 34464850073, 51986516844, "Administrativo");

INSERT INTO funcionarios
	(nome_funcionario, sobrenome_funcionario, cpf_funcionario, telefone_funcionario, setor_funcionario)
VALUES ("Eliane", "Maya Lima", 02069150046, 55994856649, "Administrativo");

INSERT INTO funcionarios
	(nome_funcionario, sobrenome_funcionario, cpf_funcionario, telefone_funcionario, setor_funcionario)
VALUES ("Cauã", " Assunção", 17530864009, 51997465334, "Recepção");

-- serviços oferecidos
INSERT INTO servicos
	(tipo_servico, servico, valor_hora, funcionario_responsavel)
VALUES ("Mecânica - Motor", "Troca de óleo e filtro", 100.00, 2);

INSERT INTO servicos
	(tipo_servico, servico, valor_hora, funcionario_responsavel)
VALUES ("Borracharia", "Alinhamento e balanceamento", 150.00, 1);

INSERT INTO servicos
	(tipo_servico, servico, valor_hora, funcionario_responsavel)
VALUES ("Borracharia", "Troca de amortecedores/molas", 225.00, 1);

INSERT INTO servicos
	(tipo_servico, servico, valor_hora, funcionario_responsavel)
VALUES ("Mecânica - Elétrica", "Troca de velas de ignição", 35.50, 4);

INSERT INTO servicos
	(tipo_servico, servico, valor_hora, funcionario_responsavel)
VALUES ("Mecânica - Elétrica", "Troca de bateria", 95.00, 4);

INSERT INTO servicos
	(tipo_servico, servico, valor_hora, funcionario_responsavel)
VALUES ("Mecânica - Elétrica", "Diagnóstico e reparo", 110.50, 4);

INSERT INTO servicos
	(tipo_servico, servico, valor_hora, funcionario_responsavel)
VALUES ("Mecânica - Motor", "Troca de correia dentada", 100.00, 2);