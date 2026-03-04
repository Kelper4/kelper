create database piscicultura;

use piscicultura;

create table usuario(
	id int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(60) not null,
    senha varchar(25) not null
);

create table leitura(
	id int primary key auto_increment,
    nome_sensor varchar(40),
    intensidade_luz int not null,
    data_hora datetime default current_timestamp
);

create table tanque(
	id int primary key auto_increment,
    nome varchar(30) not null,
	localizacao varchar(100) not null,
    status_tanque varchar(20) default 'Ativo',
    constraint chk_status check (status_tanque in('Ativo', 'Inativo'))
);

create table alertas(
	id int primary key auto_increment,
    local_alerta varchar(100),
    nivel varchar(20),
    intensidade int,
    data_alerta datetime default current_timestamp,
    constraint chk_nivel check(nivel in('Baixo', 'Moderado', 'Alto', 'Muito alto'))
);

-- INSERTS
insert into usuario (nome, email, senha)
	values ('Carlos Silva', 'carlos.peixe@email.com', 'piscis2024'),
			('Ana Souza', 'ana.monitoramento@email.com', 'senhaForte123'),
			('Bruno Oliveira', 'bruno.tecnico@email.com', 'admin_aqua');

insert into tanque (nome, localizacao, status_tanque) 
	values ('Tanque Norte 01', 'Setor A', 'Ativo'),
			('Tanque Sul 02', 'Setor B', 'Ativo'),
			('Tanque Reserva', 'Setor C', 'Inativo');

insert into leitura (nome_sensor, intensidade_luz)
	values ('sensor_Tanque_Norte', 450),
			('sensor_Tanque_Norte', 120), 
			('sensor_Tanque_Sul', 800);

insert into alertas (local_alerta, nivel, intensidade)
	values ('Tanque Norte 01', 'Moderado', 450),
			('Tanque Sul 02', 'Baixo', 120),
			('Tanque Norte 01', 'Muito alto', 800);
            
            
-- CONSULTAS
select * from usuario;
select * from leitura;
select * from tanque;
select * from alertas;

