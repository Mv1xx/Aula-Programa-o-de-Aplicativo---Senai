use smartfactory;

create table equipamento(
	id_equipamento int not null primary key auto_increment,
    nome_equipamento varchar(50) not null,
    fabricante varchar(50),
    fk_setor int,
    
    constraint fk_setor foreign key(fk_setor) references setor(id_setor)
		on update cascade on delete cascade
);

alter table equipamento
	add column status_equipamento varchar(50) not null;

create table alerta
(id_alerta int primary key auto_increment);

create table sensor(
	id_sensor int not null primary key auto_increment,
    limite_minimo int not null,
    limite_maximo int not null,
    fk_tipo int,
    fk_equipamento int,
    
    constraint fk_tipo foreign key(fk_tipo) references tipo_sensor(id_tipo_sensor)
		on update cascade on delete cascade,
        
	constraint fk_equipamento foreign key(fk_equipamento) references equipamento(id_equipamento)
		on update cascade on delete cascade
);

create table tipo_sensor(
	id_tipo_sensor int not null primary key auto_increment,
    nome_tipo varchar(50) not null
);

create table leitura
(id_leitura int primary key auto_increment);

create table setor(
	id_setor int not null primary key auto_increment,
    nome_setor varchar(50) not null
);