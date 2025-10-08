-- DDL
CREATE DATABASE db_devconnectV1;
GO

USE db_devconnect;
GO

CREATE TABLE tb_usuario (
	id INT IDENTITY(1,1) PRIMARY KEY,
	nome_completo NVARCHAR(255) NOT NULL,
	nome_usuario NVARCHAR(50) UNIQUE NOT NULL,
	email NVARCHAR(50) NOT NULL,
	foto_perfil_url NVARCHAR(150) NULL
);

SELECT * FROM tb_usuario;

-- Tabela de publicações
CREATE TABLE tb_publicacao (
	id INT IDENTITY(1,1) PRIMARY KEY,
	descricao NVARCHAR(255) NOT NULL,
	imagem NVARCHAR(500) NULL,
	data_publicacao DATE NOT NULL,
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id)
);

SELECT * FROM tb_publicacao;

CREATE TABLE tb_comentario (
	id INT IDENTITY(1,1) PRIMARY KEY,
	texto NVARCHAR(255) NOT NULL,
	data_comentario DATE NOT NULL,
	id_publicacao INT NOT NULL,
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_publicacao) REFERENCES tb_publicacao(id),
	FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id)
);

SELECT * FROM tb_comentario;

CREATE TABLE tb_curtida (
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_usuario INT NOT NULL,
	id_publicacao INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id),
	FOREIGN KEY (id_publicacao) REFERENCES tb_publicacao(id)
);

SELECT * FROM tb_curtida;

CREATE TABLE tb_seguidor (
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_usuario INT NOT NULL,
	id_usuario_seguido INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id),
	FOREIGN KEY (id_usuario_seguido) REFERENCES tb_usuario(id)
);

SELECT * FROM tb_seguidor;
