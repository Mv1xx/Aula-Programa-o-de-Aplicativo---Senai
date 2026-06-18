use smartfactory;

alter table equipamento
add constraint fk_setor
foreign key (fk_setor)
references setor(id_setor);

alter table sensor 
add constraint fk_equipamento
foreign key (fk_equipamento)
references equipamento(id_equipamento);

SET SQL_SAFE_UPDATES = 0;
update sensor set fk_equipamento = replace(fk_equipamento, 11, 10);

alter table sensor 
add constraint fk_tipo
foreign key (fk_tipo)
references tipo_sensor(id_tipo_sensor);

delete from leitura where fk_sensor = 299; 
delete from leitura where fk_sensor = 300; 

alter table leitura 
add constraint fk_sensor
foreign key (fk_sensor)
references sensor(id_sensor);

alter table alerta 
add constraint fk_leitura
foreign key (fk_leitura)
references leitura(id_leitura);





