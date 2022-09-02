-- INSERT
-- 7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários. 
INSERT INTO estado (nome, sigla) VALUES ('RONDONIA', 'RO');
INSERT INTO estado (nome, sigla) VALUES ('PARANA', 'PR');

-- 8. Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
INSERT INTO cidade (id, nome, ativo, estado_id, data_cadastro) VALUES (1, 'PORTO VELHO', 'S', 1, '01-09-2022');
INSERT INTO cidade (nome, ativo, estado_id, data_cadastro) VALUES ('ARIQUEMES', 'S', 1, '01-09-2022');
INSERT INTO cidade (nome, estado_id) VALUES ('OURO PRETO', 1);

-- UPDATE E DELETE

-- 11.	Altere o valor de uma coluna de todos os registros.
UPDATE estado SET ativo = 'S';

-- 12.	Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM estado WHERE nome = 'MATO GROSSO';

--SELECT

-- 6.	Escreva o comando para seleccionar todos os registros da tabela cidade com todas as colunas.
SELECT * FROM cidade;

-- 7.	Escreva o comando para seleccionar o nome de todos os registros da tabela cidade.
SELECT nome FROM cidade;
