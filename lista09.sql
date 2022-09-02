/* 01 - Liste o id e o nome de todas as cidades e as respectivas siglas do estado. */
SELECT cidade.id, cidade.nome, sigla
FROM estado
INNER JOIN cidade ON estado.id = estado_id;

/* 02 - Em relação ao resultado do exercício anterior, note que os nomes das colunas não estão claras. Refaça o comando para que torne mais claras. */
SELECT 
	cidade.id 'código cidade'
	, cidade.nome 'nome cidade'
	, sigla 'sigla estado'
FROM cidade, estado
WHERE estado.id = estado_id;

/* 03 - Refaça o exercício anterior atribuindo o nome completo da tabela em todos os atributos. */
SELECT 
	cidade.id 'código cidade'
	, cidade.nome 'nome cidade'
	, estado.sigla 'sigla estado'
FROM estado
INNER JOIN cidade ON estado.id = cidade.estado_id;

/* 04 - Refaça o exercício anterior definindo o apelido na tabela. */

SELECT 
	c.id 'código cidade'
	, c.nome 'nome cidade'
	, e.sigla 'sigla estado'
FROM estado e
INNER JOIN cidade c ON e.id = c.estado_id;
