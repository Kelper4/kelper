CREATE DATABASE kelper4;
USE kelper4;

CREATE TABLE sensor_data(
id INT AUTO_INCREMENT,
valor_lux DECIMAL (10,2),
arduino_number INT NOT NULL,
crated_at TIMESTAMP,
PRIMARY KEY pk_sensor (id)
);

CREATE TABLE user_data (
id INT AUTO_INCREMENT,
nome VARCHAR (40),
email VARCHAR(40),
senha VARCHAR(100),
created_at TIMESTAMP,
PRIMARY KEY pk_user (id)
);

CREATE TABLE nursery_data(
id INT AUTO_INCREMENT,
area_viveiro DECIMAL (10,3 ) NOT NULL,
qtd_peixe INT NOT NULL,
tipo_peixe VARCHAR (40),
racao_peixe VARCHAR (40),
exposto VARCHAR(3),
create_at TIMESTAMP,
PRIMARY KEY pk_viveiro (id),
CONSTRAINT chk_exposto CHECK (exposto IN ("sim", "nao"))
);

CREATE TABLE time_data(
id INT AUTO_INCREMENT,
prev_clima_hoje VARCHAR (40),
prev_temp_hoje VARCHAR (40),
prev_clima_prox_dias VARCHAR (40),
prev_temp_prox_dias VARCHAR (40),
created_at TIMESTAMP,
PRIMARY KEY pk_time (id)
);
