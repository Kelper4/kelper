CREATE DATABASE piscicultura;
USE piscicultura;

-- | TABELA USUÁRIO | --
CREATE TABLE `User` (
	id 			VARCHAR(36) 	NOT NULL,			-- para armazenar no formato UUID, que ocupa 36 posições; ex: "707ccd49-1353-11f1-86c1-02505ec6f777"
    
    nome		VARCHAR(50)		NULL,				-- para personalização no Website
    email 		VARCHAR(100) 	NOT NULL UNIQUE,	-- para ser usado como credencial no processo de registro/login
    password 	VARCHAR(100) 	NOT NULL,			-- para ser usado como credencial no processo de registro/login
    
    createdAt	DATETIME		NOT NULL,			-- para auditoria (imutável)
    updatedAt	DATETIME		NOT NULL,			-- para auditoria

	PRIMARY KEY (id)								-- define "id" como chave primária da tabela
);

-- | TABELA SENSOR | --
CREATE TABLE Sensor(
	id				VARCHAR(36) 	NOT NULL, 		-- para armazenar no formato UUID, que ocupa 36 posições; ex: "707ccd49-1353-11f1-86c1-02505ec6f777"

	sensor_type		VARCHAR(50)		NOT NULL,		-- para especificar o tipo do sensor. ex: "LDR"; "LM35";
    
	createdAt	DATETIME		NOT NULL,			-- para auditoria (imutável)
    updatedAt	DATETIME		NOT NULL,			-- para auditoria

	PRIMARY KEY (id)								-- define "id" como chave primária da tabela
);

-- | TABELA CRIADOURO | --
CREATE TABLE Hatch(
	id				VARCHAR(36) 	NOT NULL, 		-- para armazenar no formato UUID, que ocupa 36 posições; ex: "707ccd49-1353-11f1-86c1-02505ec6f777"
	
    nome			VARCHAR(100)	NULL,			-- para personalização no Website	
	hatch_type		VARCHAR(50)		NOT NULL,		-- para especificar o tipo do criadouro. ex: "viveiro"; "tanque-rede";
    
    width			DECIMAL(10,2)	NOT NULL,		-- para armazenar a largura (em metros) do criadouro
    length			DECIMAL(10,2) 	NOT NULL,		-- para armazenar o comprimento (em metros) do criadouro
    depth			DECIMAL(10,2) 	NOT NULL,		-- para armazenar a profundidade (em metros) do criadouro
    
	createdAt	DATETIME		NOT NULL,			-- para auditoria (imutável)
    updatedAt	DATETIME		NOT NULL,			-- para auditoria

	PRIMARY KEY (id)								-- define "id" como chave primária da tabela
);

-- | TABELA DADOS LEITURA | --
CREATE TABLE `Data`(
	id				VARCHAR(36) 	NOT NULL, 		-- para armazenar no formato UUID, que ocupa 36 posições; ex: "707ccd49-1353-11f1-86c1-02505ec6f777"
    
    value			DECIMAL(10,2)	NOT NULL,		-- para armazenar o valor registrado
    registeredAt	DATETIME		NOT NULL,		-- para armazenar o instante (data + hora) em que o valor foi registrado

	PRIMARY KEY (id)								-- define "id" como chave primária da tabela
);