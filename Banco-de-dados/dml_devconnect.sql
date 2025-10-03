--DML 

USE db_devconnect

INSERT INTO tb_usuario(nome_completo, nome_usuario, email, foto_perfil_url)
VALUES ('Arthur Batista Oliveira', 'Arthurbr-YT', 'barthur.oliveira07@gmail.com', '');

INSERT INTO tb_publicacao(descricao, imagem, data_publicacao, id_usuario)
VALUES ('DevConnect', '', '2025/10/03', 1);

INSERT INTO tb_comentario(texto, data_comentario, id_publicacao, id_usuario)
VALUES ('Texto', '2025/03/10', 3, 1 );

INSERT INTO tb_curtida(id_usuario, id_publicacao)
VALUES (1, 3);

INSERT INTO tb_seguidor(id_usuario)
VALUES (1);

SELECT * FROM tb_usuario;
SELECT * FROM tb_publicacao;
SELECT * FROM tb_comentario;
SELECT * FROM tb_curtida;
SELECT * FROM tb_seguidor;

DELETE tb_publicacao