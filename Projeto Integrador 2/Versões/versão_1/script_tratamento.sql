create database smartfactory;
use smartfactory;

create table tb_smartfactory(
id_registro int primary key auto_increment,
data_leitura date,
hora int,
minuto int,
equipamento varchar(50),
setor varchar(50),
fabricante varchar(50),
tipo_sensor varchar(20),
codigo_sensor char(8),
varlor_leitura int, 
limite_min int, 
limite_max int, 
nivel_alerta varchar(10),
status_equipamento varchar(15),
alerta_gerado varchar(10),
observacao varchar(200) );

SET SQL_SAFE_UPDATES = 0;

/*atualizando coluna EQUIPAMENTOS*/
update tb_smartfactory set equipamento = "Torno CNC" where equipamento in ("TornoCNC", "Torno C N C");
update tb_smartfactory set equipamento = "Pensa Hidraulica" where equipamento = "Prensa HidrÃ¡ulica";

/*atualizando coluna SETOR*/
update tb_smartfactory set setor = "Usinagem" where setor = "Usin.";

/*atualizando TIPO_SENSOR*/
update tb_smartfactory set tipo_sensor = "Temperatura" where tipo_sensor = "Temp.";

/*Juntando colunas hora e min*/
alter table tb_smartfactory add column horario_leitura time;

update tb_smartfactory set horario_leitura = maketime(hora, minuto, 0); 
alter table tb_smartfactory drop column hora;
alter table tb_smartfactory drop column minuto;

update tb_smartfactory set nivel_alerta = "Medio" where nivel_alerta = "MÃ©dio";
update tb_smartfactory set nivel_alerta = "Critico" where nivel_alerta = "CrÃ­tico";
update tb_smartfactory set alerta_gerado = "Nao" where alerta_gerado = "NÃ£o";
update tb_smartfactory set status_equipamento = "Manutencao" where status_equipamento = "ManutenÃ§Ã£o";

select status_equipamento from tb_smartfactory;

