/**
eliminando base de dados
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;

CREATE DATABASE aula_banco; -- criando a base de dados

USE aula_banco;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado (
id INT NOT NULL  AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL UNIQUE
,sigla CHAR (2) NOT NULL UNIQUE
,ativo CHAR (1) NOT NULL DEFAULT 'S' 
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
-- ,CHECK (ativo IN ('S', 'N') )
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N') )

);

INSERT INTO estado (nome, sigla) VALUES ('RONDÔNIA', 'RO');
INSERT INTO estado (nome, sigla) VALUES ('PARANÁ', 'PR');
INSERT INTO estado (nome, sigla) VALUES ('AMAZONAS', 'AM');
INSERT INTO estado (nome, sigla) VALUES ('SÃO PAULO', 'SP');
INSERT INTO estado (nome, sigla) VALUES ('ACRE', 'AC');
INSERT INTO estado (nome, sigla) VALUES ('SANTA CATARINA', 'SC');
INSERT INTO estado (nome, sigla) VALUES ('RIO DE JANEIRO', 'RJ');

SELECT id, nome, sigla, ativo, data_cadastro FROM estado;

CREATE TABLE cidade (
id INT NOT NULL  AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,ativo CHAR (1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id) 
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);

INSERT INTO cidade (nome, estado_id) VALUES ('PORTO VELHO', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('PARANAVAÍ', 2);
SELECT * FROM cidade;


/**
>>> ALTERAÇÕES EM TABELAS <<<
Caso ainda não estiver em produção, faça as alterações direto na tabela.
-> Fica mais claro e legivel.

Se a base de dados já está em produção, não tem jeito, precisa utilizar o ALTER - COM MUITO CUIDADO
**/

ALTER TABLE estado ADD COLUMN regiao INT;

DESCRIBE estado;

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100);

ALTER TABLE estado DROP COLUMN regiao;

ALTER TABLE estado ADD COLUMN regiao VARCHAR (100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO';

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR (100) NOT NULL AFTER sigla; 
ALTER TABLE estado DROP CONSTRAINT estado_deve_ser_S_ou_N;
ALTER TABLE estado MODIFY COLUMN ativo ENUM ('S', 'N') NOT NULL;

SELECT @@version, @@version_compile_os, @@lower_case_table_names;

