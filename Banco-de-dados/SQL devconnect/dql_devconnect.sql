--DQL

USE db_devconnect

SELECT * FROM tb_usuario;
SELECT * FROM tb_publicacao;
SELECT * FROM tb_comentario;
SELECT * FROM tb_curtida;
SELECT * FROM tb_seguidor;

SELECT u1.nome_usuario AS seguidor, u2.nome_usuario AS seguido
FROM tb_seguidor s
INNER JOIN tb_usuario u1 ON s.id_usuario = u1.id
INNER JOIN tb_usuario u2 ON s.id_usuario_seguido = u2.id;

SELECT u.nome_usuario, COUNT(s.id_usuario) AS quantidade_seguidores
FROM tb_usuario u
LEFT JOIN tb_seguidor s ON u.id = s.id_usuario_seguido
GROUP BY u.nome_usuario;

SELECT p.descricao, p.imagem, u.nome_usuario
FROM tb_publicacao p
INNER JOIN tb_usuario u ON p.id_usuario = u.id;

SELECT u.nome_usuario AS usuario, c.texto AS comentario, p.descricao AS publicacao
FROM tb_comentario c
INNER JOIN tb_usuario u ON c.id_usuario = u.id
INNER JOIN tb_publicacao p ON c.id_publicacao = p.id;

SELECT p.descricao, COUNT(c.id) AS quantidade_curtidas
FROM tb_curtida c
INNER JOIN tb_publicacao p ON c.id_publicacao = p.id
GROUP BY p.descricao;

SELECT u.nome_usuario
FROM tb_usuario u
LEFT JOIN tb_publicacao p ON u.id = p.id_usuario
WHERE p.id IS NULL;

SELECT u.nome_usuario
FROM tb_usuario u
LEFT JOIN tb_curtida c ON u.id = c.id_usuario
WHERE c.id IS NULL;

