CREATE TABLE Pessoa (
	cpf CHAR(11) PRIMARY KEY,
	nome VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE Telefones (
	id_telefone SERIAL PRIMARY KEY,
	cpf_pessoa CHAR(11) NOT NULL,
	numero VARCHAR(20) NOT NULL,
	tipo VARCHAR(20) NOT NULL,
    
	FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);

CREATE TABLE Morador (
	cpf_morador CHAR(11) PRIMARY KEY,

	FOREIGN KEY(cpf_morador) REFERENCES Pessoa(cpf)
);

CREATE TABLE Funcionario (
	cpf_funcionario CHAR(11) PRIMARY KEY,
	cargo VARCHAR(100) NOT NULL,
	salario NUMERIC(10,2) NOT NULL,
	data_admissao DATE NOT NULL,
	data_demissao DATE,

	FOREIGN KEY(cpf_funcionario) REFERENCES Pessoa(cpf)
);

CREATE TABLE Terceirizado (
	cpf_terceirizado CHAR(11) PRIMARY KEY,
	empresa VARCHAR(200) NOT NULL,
	servico_prestado VARCHAR(150) NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE,

	FOREIGN KEY(cpf_terceirizado) REFERENCES Pessoa(cpf)
);

CREATE TABLE Administrador (
	cpf_adm CHAR(11) PRIMARY KEY,

	FOREIGN KEY(cpf_adm) REFERENCES Pessoa(cpf)
);

CREATE TABLE Unidade (
	id_unidade SERIAL PRIMARY KEY,
	bloco VARCHAR(10) NOT NULL,
	numero_apartamento VARCHAR(10) NOT NULL
);

CREATE TABLE Morador_Unidade (
	cpf_morador CHAR(11) NOT NULL,
	id_unidade INT NOT NULL,
	data_entrada DATE NOT NULL,
	data_saida DATE,

	PRIMARY KEY (cpf_morador, id_unidade, data_entrada),
	FOREIGN KEY (cpf_morador) REFERENCES Morador(cpf_morador),
	FOREIGN KEY (id_unidade) REFERENCES Unidade(id_unidade)
);

CREATE TABLE Entrega (
	id_entrega SERIAL PRIMARY KEY,
	cpf_morador CHAR(11) NOT NULL,
	cpf_funcionario CHAR(11) NOT NULL,
	data_recebimento TIMESTAMP NOT NULL,
	data_retirada TIMESTAMP,
	status VARCHAR(50) NOT NULL DEFAULT 'Aguardando retirada',

	FOREIGN KEY (cpf_morador) REFERENCES Morador(cpf_morador),
	FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf_funcionario)
);

CREATE TABLE Solicitacao_manutencao (
	id_solicitacao_manutencao SERIAL PRIMARY KEY,
	cpf_morador CHAR(11) NOT NULL,
	id_unidade INT NOT NULL,
	descricao VARCHAR(250) NOT NULL,
	status VARCHAR(50) NOT NULL DEFAULT 'Aberta',
	data_abertura DATE NOT NULL,
	data_fim DATE,

	FOREIGN KEY (cpf_morador) REFERENCES Morador(cpf_morador),
	FOREIGN KEY (id_unidade) REFERENCES Unidade(id_unidade)
);

CREATE TABLE Funcionario_manutencao (
    id_solicitacao INT NOT NULL,
    cpf_funcionario CHAR(11) NOT NULL,
	
    PRIMARY KEY (id_solicitacao, cpf_funcionario),
    FOREIGN KEY (id_solicitacao) REFERENCES Solicitacao_manutencao(id_solicitacao_manutencao),
    FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf_funcionario)
);

CREATE TABLE Avisos (
	id_aviso SERIAL PRIMARY KEY,
	cpf_adm CHAR(11) NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	mensagem VARCHAR(500) NOT NULL,
	data_publicacao DATE NOT NULL,

	FOREIGN KEY (cpf_adm) REFERENCES Administrador(cpf_adm)
);

CREATE TABLE Area_comum (
	id_area_comum SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	horario_funcionamento VARCHAR(100) NOT NULL,
	descricao VARCHAR(400),
	capacidade INT NOT NULL,
	regras VARCHAR(300)
);

CREATE TABLE Reserva (
	id_reserva SERIAL PRIMARY KEY,
	data_reserva DATE NOT NULL,
	horario_inicio TIME NOT NULL,
	horario_fim TIME NOT NULL,
	status VARCHAR(50) DEFAULT 'Confirmada' NOT NULL,
	id_area INT NOT NULL,
	cpf_morador CHAR(11) NOT NULL,

	FOREIGN KEY (cpf_morador) REFERENCES Morador(cpf_morador),
	FOREIGN KEY (id_area) REFERENCES Area_comum(id_area_comum)
);

CREATE TABLE Visitas (
	id_visita SERIAL PRIMARY KEY,
	cpf_morador CHAR(11) NOT NULL,
	nome_visitante VARCHAR(150) NOT NULL,
	cpf_visitante CHAR(11),
	data_visita DATE NOT NULL,
	horario_entrada TIME NOT NULL,
	horario_saida TIME,

	FOREIGN KEY (cpf_morador) REFERENCES Morador(cpf_morador)
);

CREATE TABLE Contrato (
	id_contrato SERIAL PRIMARY KEY,
	tipo_contrato VARCHAR(100) NOT NULL,
	cpf_pessoa CHAR(11) NOT NULL,
	arquivo VARCHAR(250) NOT NULL,

	FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);

CREATE TABLE Pagamento (
	id_pagamento SERIAL PRIMARY KEY,
	cpf_morador CHAR(11) NOT NULL,
	mes_ano VARCHAR(7) NOT NULL,
	valor NUMERIC(10,2) NOT NULL,
	status VARCHAR(50) NOT NULL DEFAULT 'Pendente',
	comprovante VARCHAR(255),
	forma_pagamento VARCHAR(50),
	data_emissao DATE,
	data_pagamento DATE,
	vencimento DATE NOT NULL,

	FOREIGN KEY(cpf_morador) REFERENCES Morador(cpf_morador)
);

CREATE TABLE Denuncias (
	id_denuncia SERIAL PRIMARY KEY,
	cpf_pessoa CHAR(11),
	data_denuncia DATE NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	status VARCHAR(50) DEFAULT 'Em análise' NOT NULL,

	FOREIGN KEY(cpf_pessoa) REFERENCES Pessoa(cpf)
);
