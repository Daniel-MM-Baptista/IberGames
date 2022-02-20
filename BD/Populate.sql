USE Proj_PW;

INSERT INTO categoria(Cat_nome, Cat_desc)
VALUES
	("MMORPG", "Jogos Massively Multiplayer Online Role-playing Games"),
    ("RPG", "Jogos Role-playing Games"),
    ("FPS", "Jogos First-Person Shooter"),
    ("Platformer", "Jogos Platformer");
    
INSERT INTO post(Post_name, Post_desc, Post_datacria, Cat_id)
VALUES
	("World Of Warcraft", "Post sobre World Of Warcraft", CONVERT("2015-04-23", DATETIME), 1),
    ("Final Fantasy XIV", "Post sobre Final Fantasy XIV", CONVERT("2021-12-05", DATETIME), 1),
    ("Super Mario 64", "Post sobre Super Mario 64", CONVERT("2018-02-04", DATETIME), 1),
    ("Dragon Age Origins", "Post sobre Dragon Age Origins", CONVERT("2020-12-19", DATETIME), 2),
    ("Counter Strike Global Offensive", "Post sobre Counter Strike Global Offensive", CONVERT("2016-07-28", DATETIME), 3);
    
INSERT INTO utilizador
VALUES
	(),
    (),
    (),
    (),
    (),
    (),
    ();
    
INSERT INTO visitante(Util_id)
VALUES
	(1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7);
    
INSERT INTO registado(Util_id, Regist_name, Regist_email, Regist_pass, Regist_dataRegs)
VALUES
    (5, "JoseSantos","jose@email.com","jose1990", CONVERT("2017-08-29", DATETIME)),
    (6, "batmankid","bateman@email.com","spiderman", CONVERT("2020-12-14", DATETIME)),
    (7, "admin","admin@email.com","admin", CONVERT("2015-02-03", DATETIME));
    
INSERT INTO gestor(Regist_id)
VALUES
    (3);
    
INSERT INTO moderacao(Gest_id, Cat_id)
VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (1, 4);

INSERT INTO gerir(Regist_id, Post_id)
VALUES
	(3, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (3, 5);
    
INSERT INTO vota(Voto_voto, Util_id, Post_id)
VALUES
	('U', 7, 1),
    ('U', 5, 2),
    ('U', 5, 3),
    ('U', 6, 4),
    ('U', 7, 5),
	('U', 5, 1),
    ('U', 5, 4),
    ('D', 5, 5),
    ('D', 6, 1),
    ('U', 7, 2),
    ('U', 7, 4);
    
INSERT INTO comentario(Com_texto, Post_id)
VALUES
	('Jogo está cada vez pior', 1),
    ('Isso é só a nostalgia a falar, o jogo realmente tem coisas negativas mas há bastante de bom.', 1),
    ('RPG decente', 4),
    ("Porque é que isto está na categoria dos mmo's?", 3),
    ("Ho ho ho ha ha, ho ho ho he ha. Hello there, old chum. I’m gnot an elf. I’m gnot a goblin. I’m a gnome. And you’ve been, GNOMED’", 3),
    ('Bom jogo', 5),
    ('Cheio de hackers', 5);
    
INSERT INTO faz(Com_data, Util_id, Com_id)
VALUES
	(CONVERT("2020-12-15 12:23:03", DATETIME), 6, 1),
    (CONVERT("2020-12-15 16:39:34", DATETIME), 7, 2),
    (CONVERT("2021-01-20 03:21:49", DATETIME), 5, 3),
    (CONVERT("2018-02-05 08:59:32", DATETIME), 7, 4),
    (CONVERT("2018-02-05 11:28:02", DATETIME), 5, 5),
    (CONVERT("2016-08-23 18:28:02", DATETIME), 7, 6),
    (CONVERT("2018-10-29 19:38:39", DATETIME), 5, 7);