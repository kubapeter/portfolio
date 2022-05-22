-- MANY-TO-ONE RELATIONSHIP 

-- create tables
CREATE TABLE artist (
  id SERIAL, 
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE album (
  id SERIAL,
  title VARCHAR(128) UNIQUE,
  artist_id INTEGER REFERENCES artist(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

CREATE TABLE genre (
  id SERIAL, 
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE track (
  id SERIAL, 
  title VARCHAR(128),
  len INTEGER, 
  rating INTEGER, 
  count INTEGER,
  album_id INTEGER REFERENCES album(id) ON DELETE CASCADE,
  genre_id INTEGER REFERENCES genre(id) ON DELETE CASCADE,
  UNIQUE(title, album_id),
  PRIMARY KEY(id)
);

-- insert some values
INSERT INTO artist (name) VALUES ('Led Zeppelin');
INSERT INTO artist (name) VALUES ('AC/DC');

INSERT INTO album (title, artist_id) VALUES ('Who made who', 2);
INSERT INTO album (title, artist_id) VALUES ('IV', 1);

INSERT INTO genre (name) VALUES ('Rock');
INSERT INTO genre (name) VALUES ('Metal');

INSERT INTO track (title, rating, len, count, album_id, genre_id) 
  VALUES ('Black Dog', 5, 297, 0, 2, 1);
INSERT INTO track (title, rating, len, count, album_id, genre_id) 
  VALUES ('Stairway', 5, 482, 0, 2, 1);
INSERT INTO track (title, rating, len, count, album_id, genre_id) 
  VALUES ('About to Rock', 5, 313, 0, 1, 2);
INSERT INTO track (title, rating, len, count, album_id, genre_id) 
  VALUES ('Who Made Who', 5, 207, 0, 1, 2);

-- let's see the albums with the artists
SELECT album.title, artist.name
  FROM 
    album
      INNER JOIN
    artist
      ON album.artist_id = artist.id;

-- to see clearer, how the INNER JOIN works
SELECT 
    album.title, 
    album.artist_id,
    artist.id,
    artist.name
  FROM 
    album
      INNER JOIN
    artist
      ON album.artist_id = artist.id;

-- to see how CROSS JOIN can be meaningless (importance of ON as a "filter")
SELECT 
    track.title, 
    track.genre_id, 
    genre.id, 
    genre.name
  FROM 
    track
      CROSS JOIN
    genre;

-- meaningful version of the one above
SELECT 
    track.title, 
    genre.name
  FROM 
    track
      INNER JOIN
    genre
      ON track.genre_id = genre.id;

-- see an overall table
SELECT 
    track.title, 
    artist.name, 
    album.title,
    genre.name
  FROM 
    track
      INNER JOIN
    genre ON track.genre_id = genre.id
      INNER JOIN
    album ON track.album_id = album.id
      INNER JOIN
    artist ON album.artist_id = artist.id;

--     title     |     name     |    title     | name
-----------------+--------------+--------------+-------
-- Black Dog     | Led Zeppelin | IV           | Rock
-- Stairway      | Led Zeppelin | IV           | Rock
-- About to Rock | AC/DC        | Who made who | Metal
-- Who Made Who  | AC/DC        | Who made who | Metal

-- let's see ON DELETE CASCADE
DELETE FROM genre 
  WHERE name = 'Metal';

-- one less row in genre table
SELECT * 
  FROM genre;

-- but also two row deleted from track
SELECT * 
  FROM track;


-- MANY-TO-MANY RELATIONSHIP

-- create tables
CREATE TABLE student (
  id SERIAL, 
  name VARCHAR(128),
  email VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE course (
  id SERIAL, 
  title VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

-- no id SERIAL is necessary for the following table
CREATE TABLE member (
  student_id INTEGER REFERENCES student(id) ON DELETE CASCADE, 
  course_id INTEGER REFERENCES course(id) ON DELETE CASCADE, 
  role INTEGER,
  PRIMARY KEY(student_id, course_id)
);

-- insert some values
INSERT INTO student (name, email) VALUES ('Jane', 'jane@tsugi.org');
INSERT INTO student (name, email) VALUES ('Ed', 'ed@tsugi.org');
INSERT INTO student (name, email) VALUES ('Sue', 'sue@tsugi.org');

INSERT INTO course (title) VALUES ('Python');
INSERT INTO course (title) VALUES ('SQL');
INSERT INTO course (title) VALUES ('PHP');

INSERT INTO member (student_id, course_id, role) VALUES (1, 1, 1);
INSERT INTO member (student_id, course_id, role) VALUES (2, 1, 0);
INSERT INTO member (student_id, course_id, role) VALUES (3, 1, 0);

INSERT INTO member (student_id, course_id, role) VALUES (1, 2, 0);
INSERT INTO member (student_id, course_id, role) VALUES (2, 2, 1);

INSERT INTO member (student_id, course_id, role) VALUES (2, 3, 1);
INSERT INTO member (student_id, course_id, role) VALUES (3, 3, 0);

-- see an overall table
SELECT 
    student.name,
    member.role,
    course.title
  FROM 
    student 
      INNER JOIN 
    member ON member.student_id = student.id
      INNER JOIN 
    course ON member.course_id = course.id
  ORDER BY 
    course.title, 
    member.role DESC, 
    student.name;

-- name | role | title
--------+------+--------
-- Ed   |    1 | PHP
-- Sue  |    0 | PHP
-- Jane |    1 | Python
-- Ed   |    0 | Python
-- Sue  |    0 | Python
-- Ed   |    1 | SQL
-- Jane |    0 | SQL
--(7 rows)