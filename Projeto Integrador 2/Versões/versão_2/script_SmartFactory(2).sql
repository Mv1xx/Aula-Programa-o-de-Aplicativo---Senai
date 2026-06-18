

create table tipo_sensor(
	id_tipo_sensor int not null primary key auto_increment,
    nome_tipo varchar(50) not null,
    unidade_medida varchar(50)
);

create table setor(
	id_setor int not null primary key auto_increment,
    nome_setor varchar(50) not null
);

create table equipamento(
	id_equipamento int not null primary key auto_increment,
    nome_equipamento varchar(50) not null,
    status_equipamento varchar(50) not null,
    fk_setor int
    
);

create table sensor(
	id_sensor int primary key auto_increment,
    codigo_sensor char(8),
    limite_minimo int,
    limite_maximo int,
    fk_tipo int,
    fk_equipamento int
);

create table leitura
(id_leitura int primary key auto_increment,
	data_hora_leitura datetime,
    valor_leitura decimal(10,2),  
	alerta_gerado varchar(10),
	fk_sensor int,
    coluna varchar(10)
);

create table alerta
(id_alerta int primary key auto_increment,
nivel_alerta varchar(50),
data_hora_inicio datetime,
data_hora_fim datetime,
duracao_min int,
fk_leitura int
);

create table historico(
id_historico int primary key auto_increment,
codigo_evento char(8),
status_evento varchar(20),
fk_alerta int
);