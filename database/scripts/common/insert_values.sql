-- Pink Floyd. The Wall.
BEGIN;

INSERT INTO occupation (id, description)
VALUES
    (1, 'lead and rhythm guitars, vocals'),
    (2, 'lead and rhythm guitars, vocals, bass, keyboards, synthesisers'),
    (3, 'drums, percussion'),
    (4, 'bass, vocals, rhythm guitar, synthesisers'),
    (5, 'keyboards, piano, organ, synthesisers, vocals');

INSERT INTO author (id, name, occupation_id)
VALUES
    (1, 'Syd Barrett', 1),
    (2, 'David Gilmour', 2),
    (3, 'Nick Mason', 3),
    (4, 'Roger Waters', 4),
    (5, 'Richard Wright', 5);

INSERT INTO song (id, name, release_date)
VALUES
    (1, 'In the Flesh?', '1979-10-30'),
    (2, 'The Thin Ice', '1979-10-30'),
    (3, 'Another Brick in the Wall', '1979-10-30'),
    (4, 'The Happiest Days of Our Lives', '1979-10-30'),
    (5, 'Another Brick in the Wall', '1979-10-30'),
    (6, 'Mother', '1979-10-30'),
    (7, 'Goodbye Blue Sky', '1979-10-30'),
    (8, 'Empty Spaces', '1979-10-30'),
    (9, 'Young Lust', '1979-10-30'),
    (10, 'One of My Turns', '1979-10-30');

INSERT INTO disk (id, name)
VALUES
    (1, 'Pink Floyd. The Wall.');

INSERT INTO m2m_song_disk (disk_id, song_id)
SELECT 1, song_id
FROM generate_series(1, 10) AS song_id;

INSERT INTO m2m_author_song (author_id, song_id)
SELECT author_id, song_id
FROM generate_series(1, 5) as author_id,
     generate_series(1, 10) as song_id;
    
END;

-- Franz Ferdinand
BEGIN;
INSERT INTO occupation (id, description)
VALUES
    (6, 'lead vocals, lead guitar'),
    (7, 'rhythm guitar, keyboards, vocals'),
    (8, 'bass guitar, backing vocals'),
    (9, 'drums, percussion, backing vocals');

INSERT INTO author (id, name, occupation_id)
VALUES
    (6, 'Alex Kapranos', 6),
    (7, 'Nick McCarthy ', 7),
    (8, 'Bob Hardy ', 8),
    (9, 'Paul Thomson ', 9);

INSERT INTO song (id, name, release_date)
VALUES
    (11, 'Jacqueline', '2004-02-09'),
    (12, 'Tell Her Tonight', '2004-02-09'),
    (13, 'Take Me Out', '2004-02-09'),
    (14, 'The Dark of the Matinée', '2004-02-09'),
    (15, 'Auf Achse', '2004-02-09'),
    (16, 'Cheating on You', '2004-02-09'),
    (17, 'This Fire', '2004-02-09'),
    (18, 'Darts of Pleasure', '2004-02-09'),
    (19, 'Michael', '2004-02-09'),
    (20, 'Come on Home', '2004-02-09'),
    (21, '40', '2004-02-09');

INSERT INTO disk (id, name)
VALUES
    (2, 'Franz Ferdinand');

INSERT INTO m2m_song_disk (disk_id, song_id)
SELECT 2, song_id
FROM generate_series(11, 21) AS song_id;

INSERT INTO m2m_author_song (author_id, song_id)
SELECT author_id, song_id
FROM generate_series(6, 9) as author_id,
     generate_series(11, 21) as song_id;
END;
