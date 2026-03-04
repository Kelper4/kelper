CREATE DATABASE bdKelper;
USE bdKelper;

CREATE TABLE tbTanque(
	idTanque INT PRIMARY KEY,
    localizacao TEXT
);

CREATE TABLE tbSensor(
	idSensor INT PRIMARY KEY,
    idTanque INT,
    status VARCHAR(20)
);

CREATE TABLE tbAlertaRegistro(
	idAlerta INT PRIMARY KEY,
    idTanque INT,
    nivelAlerta VARCHAR(25),
    descricaoAnalise VARCHAR(200),
    dtHoraAlerta DATETIME
);

CREATE TABLE tbLeitura(
	idLeitura INT PRIMARY KEY,
    idSensor INT,
    luminosidade DECIMAL(10,2),
    dtHoraRegistro DATETIME
);

-- SIMULAÇÃO DE IDENTIFICAÇÃO DO TANQUE (INSERTS)
INSERT INTO tbTanque(idTanque, localizacao)
	VALUES(1, 'Tanque da 1º Coluna'),
		(2, 'Tanque da 1º Coluna'),
        (3, 'Tanque da 2º Coluna'),
        (4, 'Tanque da 2º Coluna'),
        (5, 'Tanque da 3º Coluna'),
        (6, 'Tanque da 3º Coluna');
        
-- CONSULTANDO AS IDENTIFICAÇÕES E LOCAIS DOS TANQUES
SELECT * FROM tbTanque;

-- SIMULADOR DE IDENTIFICAÇÃO DO SENSOR (INSERT) EM SEUS TANQUES O SEU STATUS
INSERT INTO tbSensor(idSensor, idTanque, status)
	VALUES (1,1,'Ativo'),
		(2,2,'Ativo'),
        (3,3,'Ativo'),
        (4,4,'Manutenção'),
        (5,5,'Manutenção'),
        (6,6,'Ativo');
        
-- BUSCANDO AS IDENTIFICAÇÕES DO SENSOR COM O SEU RESPECTIVO TANQUE
SELECT * FROM tbSensor;
-- SIMULANDO UMA BUSCA ESPECIFICA DE UM SENSOR PARA SABER SEU TANQUE:
SELECT * FROM tbSensor
	WHERE idSensor = 2;
    
-- INSERINDO DADOS E REGISTRANDO NA TABELA DE LEITURA E CAPTURA DA LUMINOSIDADE:
INSERT INTO tbLeitura(idLeitura, idSensor, luminosidade, dtHoraRegistro) VALUES 
(1, 1, 0.00, '2026-02-26 05:00:00'),    -- Madrugada (Escuro)
(2, 1, 120.00, '2026-02-26 07:30:00'),  -- Início da manhã (Sol fraco)
(3, 1, 450.00, '2026-02-26 09:00:00'),  -- Meio da manhã (Ideal)
(4, 1, 890.00, '2026-02-26 11:30:00'),  -- Aproximando do pico (Alerta Amarelo)
(5, 1, 1023.00, '2026-02-26 12:30:00'), -- PICO DE LUZ (Alerta Vermelho/Risco de Algas)
(6, 1, 980.00, '2026-02-26 14:00:00'),  -- Tarde (Sol ainda muito forte)
(7, 1, 600.00, '2026-02-26 16:00:00'),  -- Tarde (Luz diminuindo)
(8, 1, 200.00, '2026-02-26 18:30:00'),  -- Pôr do sol
(9, 1, 0.00, '2026-02-26 21:00:00');    -- Noite (Fim do ciclo)

-- CONSULTANDO OS REGISTROS DE LEITURA
SELECT * FROM tbLeitura;

-- SIMULANDO UM ALERTA DE REGISTRO, isso ocorre quando verificado durante alguns dias de analises.
INSERT INTO tbAlertaRegistro(idAlerta, idTanque, nivelAlerta, descricaoAnalise, dtHoraAlerta)
	VALUES  (1,1,'Vermelho','ALERTA: Pico de radiação solar (1023). Alto risco de eutrofização e falta de oxigênio à noite.','2026-02-26 12:30:00');
    
    -- VERIFICANDO O REGISTRO
    SELECT * FROM tbAlertaRegistro;