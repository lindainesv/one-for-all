DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(20 , 2 ) NOT NULL,
    descricao_plano VARCHAR(45) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    id_plano INT NOT NULL,
    FOREIGN KEY (id_plano)
        REFERENCES plano (id_plano)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.artistas (
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(45) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.albuns (
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(45) NOT NULL,
    ano_lancamento YEAR(4) NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista)
        REFERENCES artistas (id_artista)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.cancoes (
    id_cancao INT PRIMARY KEY AUTO_INCREMENT,
    nome_cancoes VARCHAR(45) NOT NULL,
    duracao_segundos INT NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_album)
        REFERENCES albuns (id_album)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.historico (
    id_usuario INT NOT NULL,
    id_cancao INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_cancao)
        REFERENCES cancoes (id_cancao),
    PRIMARY KEY (id_usuario , id_cancao)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.seguindo_artistas (
    id_usuario INT NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_artista)
        REFERENCES artistas (id_artista),
    PRIMARY KEY (id_usuario , id_artista)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.plano (id_plano, descricao_plano, valor)
VALUES
  (NULL, 'gratuito', 0),
  (NULL, 'universitário', 5.99),
  (NULL, 'pessoal', 6.99),
  (NULL, 'familiar', 7.99);

INSERT INTO SpotifyClone.usuarios (id_usuario, nome_usuario, idade, id_plano, data_assinatura)
VALUES
  (NULL, 'Ada Lovelace', 37, 4, '2017-12-30'),
  (NULL, 'Barbara Liskov', 82, 1, '2019-10-20'),
  (NULL, 'Bell Hooks', 26, 2, '2018-01-05'),
  (NULL, 'Christopher Alexander', 85, 3, '2019-06-05'),
  (NULL, 'Jorge Amado', 58, 3, '2017-02-17'),
  (NULL, 'Judith Butler', 45, 3, '2020-05-13'),
  (NULL, 'Martin Fowler', 46, 4, '2017-01-17'),
  (NULL, 'Paulo Freire', 19, 2, '2018-02-14'),
  (NULL, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
  (NULL, 'Sandi Metz', 58, 4, '2018-04-29');

INSERT INTO SpotifyClone.artistas (id_artista, nome_artista)
VALUES
  (NULL, 'Baco Exu do Blues'),
  (NULL, 'Beyoncé'),
  (NULL, 'Blind Guardian'),
  (NULL, 'Elis Regina'),
  (NULL, 'Nina Simone'),
  (NULL, 'Queen');

INSERT INTO SpotifyClone.albuns (id_album, nome_album, id_artista, ano_lancamento)
VALUES
  (NULL, 'Falso Brilhante', 4, 1998),
  (NULL, 'Hot Space', 5, 1982),
  (NULL, 'I Put A Spell On You', 6, 2012),
  (NULL, 'Jazz', 5, 1978),
  (NULL, 'QVVJFA?', 1, 2003),
  (NULL, 'Renaissance', 2, 2022),
  (NULL, 'Somewhere Far Beyond', 3, 2007),
  (NULL, 'Vento de Maio', 4, 2001);

INSERT INTO SpotifyClone.cancoes (id_cancao, nome_cancoes, duracao_segundos, id_album)
VALUES
  (NULL, 'ALIEN SUPERSTAR', 116, 1),
  (NULL, 'BREAK MY SOUL', 279, 1),
  (NULL, 'Como Nossos Pais', 105, 4),
  (NULL, 'Don\'t Stop Me Now', 203, 2),
  (NULL, 'Feeling Good', 100, 8),
  (NULL, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
  (NULL, 'Samba em Paris', 267, 6),
  (NULL, 'The Bard\'s Song', 244, 7),
  (NULL, 'Under Pressure', 152, 3),
  (NULL, 'VIRGO\'S GROOVE', 369, 1);

INSERT INTO SpotifyClone.historico (id_usuario, id_cancao, data_reproducao)
VALUES
  (1, 10, '2020-03-06 11:22:33'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 8, '2022-02-28 10:45:55'),
  (10, 3, '2015-12-13 08:30:22'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 5, '2020-08-06 15:23:43'),
  (5, 8, '2022-01-09 01:44:33'),
  (6, 1, '2017-10-12 12:35:20'),
  (6, 7, '2017-01-24 00:31:17'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22');
  
INSERT INTO SpotifyClone.seguindo_artistas (id_usuario, id_artista)
VALUES
  (1, 2),
  (1, 4),
  (1, 5),
  (10, 5),
  (2, 2),
  (2, 4),
  (3, 5),
  (4, 1),
  (5, 3),
  (5, 6),
  (6, 2),
  (6, 6),
  (7, 6),
  (9, 4);