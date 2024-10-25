BEGIN;

CREATE TABLE occupation
(
    id          BIGINT PRIMARY KEY,
    description VARCHAR(30) NOT NULL
);

COMMENT ON TABLE occupation IS 'Таблица, содержащая информацию о родах занятий';
COMMENT ON COLUMN occupation.id IS 'Уникальный идентификатор рода занятий';
COMMENT ON COLUMN occupation.description IS 'Описание рода занятий';

CREATE TABLE author
(
    id            BIGINT PRIMARY KEY,
    name          VARCHAR(30) NOT NULL,
    occupation_id BIGINT      NOT NULL,
    FOREIGN KEY (occupation_id) REFERENCES occupation (id)
);

COMMENT ON TABLE author IS 'Таблица, содержащая информацию об авторах песен';
COMMENT ON COLUMN author.id IS 'Уникальный идентификатор автора';
COMMENT ON COLUMN author.name IS 'Имя автора';
COMMENT ON COLUMN author.occupation_id IS 'Идентификатор рода занятий';

CREATE TABLE song
(
    id           BIGINT PRIMARY KEY,
    name         VARCHAR(30) NOT NULL,
    author_id    BIGINT      NOT NULL,
    release_date DATE        NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author (id)
);

COMMENT ON TABLE song IS 'Таблица, содержащая информацию о песнях';
COMMENT ON COLUMN song.id IS 'Уникальный идентификатор песни';
COMMENT ON COLUMN song.name IS 'Название песни';
COMMENT ON COLUMN song.author_id IS 'Идентификатор автора песни';
COMMENT ON COLUMN song.release_date IS 'Дата релиза песни';

CREATE TABLE disk
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

COMMENT ON TABLE disk IS 'Таблица, содержащая информацию о дисках';
COMMENT ON COLUMN disk.id IS 'Уникальный идентификатор диска';
COMMENT ON COLUMN disk.name IS 'Название диска';

CREATE TABLE m2m_song_disk
(
    disk_id BIGINT NOT NULL,
    song_id BIGINT NOT NULL,
    PRIMARY KEY (disk_id, song_id),
    FOREIGN KEY (disk_id) REFERENCES disk (id),
    FOREIGN KEY (song_id) REFERENCES song (id)
);

COMMENT ON TABLE m2m_song_disk IS 'Связующая таблица между песнями и дисками';
COMMENT ON COLUMN m2m_song_disk.disk_id IS 'Идентификатор диска';
COMMENT ON COLUMN m2m_song_disk.song_id IS 'Идентификатор песни';

CREATE TABLE m2m_author_song
(
    author_id BIGINT NOT NULL,
    song_id   BIGINT NOT NULL,
    PRIMARY KEY (author_id, song_id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (song_id) REFERENCES song (id)
);

COMMENT ON TABLE m2m_author_song IS 'Связующая таблица между авторами и песнями';
COMMENT ON COLUMN m2m_author_song.author_id IS 'Идентификатор автора';
COMMENT ON COLUMN m2m_author_song.song_id IS 'Идентификатор песни';

COMMIT;
