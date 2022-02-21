/**************************************************
*	UC: Complemento de Base de Dados	2021/2022
*
*	Projeto
*	Grupo 3
*
*	(Nome)						(Nº Aluno)
*	Daniel Baptista				202001990
*	Rafael Silva				202001553
*	
*	Turma: 2ºL_EI-SW-04			Sala: F356
*
***************************************************/

CREATE DATABASE Proj_PW;
USE Proj_PW;

/*****************************
	--- Entidades PK ---
*****************************/

CREATE TABLE Categoria
(
  Cat_id INT AUTO_INCREMENT,
  Cat_nome VARCHAR(50),
  Cat_desc VARCHAR(100),
  PRIMARY KEY (Cat_id)
);

CREATE TABLE Registado
(
  Regist_id INT AUTO_INCREMENT,
  Regist_name VARCHAR(25),
  Regist_email VARCHAR(40),
  Regist_pass VARCHAR(20),
  Regist_dataRegs DATETIME,
  Regist_gestor BOOLEAN,
  PRIMARY KEY (Regist_id)
);

/*****************************
	--- Entidades FK ---
*****************************/

CREATE TABLE Comentario
(
  Com_id INT AUTO_INCREMENT,
  Com_texto VARCHAR(4000),
  Post_id INT,
  PRIMARY KEY (Com_id)
);

CREATE TABLE Post
(
  Post_id INT AUTO_INCREMENT,
  Post_name VARCHAR(50),
  Post_desc VARCHAR(100),
  Post_datacria DATETIME,
  Post_votos INT,
  Cat_id INT,
  PRIMARY KEY (Post_id)
);

/*****************************
 ---- Chaves Estrangeiras ----
******************************/

ALTER TABLE Comentario ADD FOREIGN KEY (Post_id) 
REFERENCES Post(Post_id)
ON DELETE NO ACTION
ON UPDATE CASCADE;

ALTER TABLE Post ADD FOREIGN KEY (Cat_id) 
REFERENCES Categoria(Cat_id)
ON DELETE NO ACTION
ON UPDATE CASCADE;

/*****************************
 --- Entidades Associação ---
******************************/

CREATE TABLE Reage
(
  reac_reacao VARCHAR(30),
  Regist_id INT,
  Com_id INT,
  PRIMARY KEY (Regist_id, Com_id),
  FOREIGN KEY (Regist_id) REFERENCES Registado(Regist_id),
  FOREIGN KEY (Com_id) REFERENCES Comentario(Com_id)
);

CREATE TABLE Faz
(
  Com_data DATETIME,
  Regist_id INT,
  Com_id INT,
  PRIMARY KEY (Com_id),
  FOREIGN KEY (Regist_id) REFERENCES Registado(Regist_id),
  FOREIGN KEY (Com_id) REFERENCES Comentario(Com_id)
);

CREATE TABLE Gerir
(
  Regist_id INT,
  Post_id INT,
  PRIMARY KEY (Post_id),
  FOREIGN KEY (Regist_id) REFERENCES Registado(Regist_id),
  FOREIGN KEY (Post_id) REFERENCES Post(Post_id)
);