create database ibge;

use ibge;

create table unidades_federativas (
cod_uf int,
uf char (2),
nome_uf varchar (30),
primary key (cod_uf) 
); 

create table municipios (
cod_municipio int,
cod_uf int,
nome_municipio varchar (40),
populacao int,
primary key (cod_municipio),
foreign key (cod_uf) references unidades_federativas (cod_uf)
);

SELECT m.nome_municipio, u.nome_uf FROM municipios m INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf;

#Listar os municípios com sua população e a sigla da unidade
select m.nome_municipio, m.populacao, u.uf 
from municipios m
inner join unidades_federativas u on m.cod_uf = u.cod_uf;

#Listar os municípios e suas unidades federativas, ordenando pelo nome do município
select m.nome_municipio, u.uf
from municipios m
inner join unidades_federativas u on m.cod_uf = u.cod_uf
order by nome_municipio;

#Listar os municípios que possuem uma população superior a 100.000 habitantes, juntamente com a sigla da unidade federativa
select m.nome_municipio, m.populacao, u.uf
from municipios m
inner join unidades_federativas u on m.cod_uf = u.cod_uf
where populacao >100000;

#Listar os municípios que têm o mesmo nome que sua respectiva unidade federativa
select m.nome_municipio, u.nome_uf
from municipios m
inner join unidades_federativas u on m.cod_uf = u.cod_uf
where nome_municipio = nome_uf;

#Calcular a média de população dos municípios para cada unidade federativa
select u.nome_uf, avg (m.populacao) as media_populacao
from municipios m
inner join unidades_federativas u on m.cod_uf = u.cod_uf
group by nome_uf;

#Listar os municípios que têm uma população maior que a média da população de todos os municípios
select avg(populacao) as media_populacao
from municipios;
select * from municipios
where populacao > (select avg(populacao) as media_populacao
from municipios );

#Desafio

select u.nome_uf, count(m.cod_municipio) as quantidade_municipios
from municipios m
inner join unidades_federativas u on m.cod_uf = u.cod_uf
group by nome_uf;

