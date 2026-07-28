

-- ===========================
-- USERS
-- ===========================

CREATE TABLE Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- ===========================
-- MOVIES
-- ===========================

CREATE TABLE Movies(
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    duration INT
);

-- ===========================
-- MEDIA
-- One Movie -> Many Media
-- ===========================

CREATE TABLE Media(
    media_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    media_type ENUM('Image','Video'),
    media_url VARCHAR(255),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);

-- ===========================
-- GENRE
-- ===========================

CREATE TABLE Genre(
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(100)
);

-- Movie -> Many Genre
CREATE TABLE Movie_Genre(
    movie_id INT,
    genre_id INT,
    PRIMARY KEY(movie_id,genre_id),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY(genre_id) REFERENCES Genre(genre_id)
);

-- ===========================
-- REVIEWS
-- ===========================

CREATE TABLE Reviews(
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    user_id INT,
    rating DECIMAL(2,1),
    review_text VARCHAR(255),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

-- ===========================
-- ARTISTS
-- ===========================

CREATE TABLE Artist(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100)
);

-- ===========================
-- SKILLS
-- ===========================

CREATE TABLE Skill(
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100)
);

CREATE TABLE Artist_Skill(
    artist_id INT,
    skill_id INT,
    PRIMARY KEY(artist_id,skill_id),
    FOREIGN KEY(artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY(skill_id) REFERENCES Skill(skill_id)
);

-- ===========================
-- ROLES
-- ===========================

CREATE TABLE Role(
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(100)
);

-- Artist performs multiple roles in same movie

CREATE TABLE Movie_Artist_Role(
    movie_id INT,
    artist_id INT,
    role_id INT,
    PRIMARY KEY(movie_id,artist_id,role_id),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY(artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY(role_id) REFERENCES Role(role_id)
);

-- ===========================
-- INSERT USERS
-- ===========================

INSERT INTO Users(username,email)
VALUES
('Monika','monika@gmail.com'),
('Rahul','rahul@gmail.com');

-- ===========================
-- INSERT MOVIES
-- ===========================

INSERT INTO Movies(title,release_year,duration)
VALUES
('Leo',2023,165),
('Master',2021,179);

-- ===========================
-- INSERT MEDIA
-- ===========================

INSERT INTO Media(movie_id,media_type,media_url)
VALUES
(1,'Image','leo1.jpg'),
(1,'Video','leo_trailer.mp4'),
(2,'Image','master1.jpg'),
(2,'Video','master_trailer.mp4');

-- ===========================
-- INSERT GENRES
-- ===========================

INSERT INTO Genre(genre_name)
VALUES
('Action'),
('Drama'),
('Thriller');

-- ===========================
-- MOVIE GENRES
-- ===========================

INSERT INTO Movie_Genre
VALUES
(1,1),
(1,3),
(2,1),
(2,2);

-- ===========================
-- INSERT REVIEWS
-- ===========================

INSERT INTO Reviews(movie_id,user_id,rating,review_text)
VALUES
(1,1,4.8,'Excellent Movie'),
(1,2,4.5,'Very Good'),
(2,1,4.2,'Nice Movie');

-- ===========================
-- INSERT ARTISTS
-- ===========================

INSERT INTO Artist(artist_name)
VALUES
('Vijay'),
('Lokesh');

-- ===========================
-- INSERT SKILLS
-- ===========================

INSERT INTO Skill(skill_name)
VALUES
('Acting'),
('Singing'),
('Direction');

-- ===========================
-- ARTIST SKILLS
-- ===========================

INSERT INTO Artist_Skill
VALUES
(1,1),
(1,2),
(2,3);

-- ===========================
-- INSERT ROLES
-- ===========================

INSERT INTO Role(role_name)
VALUES
('Actor'),
('Singer'),
('Director');

-- ===========================
-- MOVIE ARTIST ROLE
-- ===========================

INSERT INTO Movie_Artist_Role
VALUES
(1,1,1),
(1,1,2),
(1,2,3),
(2,1,1),
(2,2,3);

-- ===========================
-- OUTPUT QUERIES
-- ===========================

SELECT * FROM Users;

SELECT * FROM Movies;

SELECT * FROM Media;

SELECT * FROM Genre;

SELECT * FROM Movie_Genre;

SELECT * FROM Reviews;

SELECT * FROM Artist;

SELECT * FROM Skill;

SELECT * FROM Artist_Skill;

SELECT * FROM Role;

SELECT * FROM Movie_Artist_Role;




Output:

+---------+----------+------------------+
| user_id | username | email            |
+---------+----------+------------------+
|       1 | Monika   | monika@gmail.com |
|       2 | Rahul    | rahul@gmail.com  |
+---------+----------+------------------+
+----------+--------+--------------+----------+
| movie_id | title  | release_year | duration |
+----------+--------+--------------+----------+
|        1 | Leo    |         2023 |      165 |
|        2 | Master |         2021 |      179 |
+----------+--------+--------------+----------+
+----------+----------+------------+--------------------+
| media_id | movie_id | media_type | media_url          |
+----------+----------+------------+--------------------+
|        1 |        1 | Image      | leo1.jpg           |
|        2 |        1 | Video      | leo_trailer.mp4    |
|        3 |        2 | Image      | master1.jpg        |
|        4 |        2 | Video      | master_trailer.mp4 |
+----------+----------+------------+--------------------+
+----------+------------+
| genre_id | genre_name |
+----------+------------+
|        1 | Action     |
|        2 | Drama      |
|        3 | Thriller   |
+----------+------------+
+----------+----------+
| movie_id | genre_id |
+----------+----------+
|        1 |        1 |
|        2 |        1 |
|        2 |        2 |
|        1 |        3 |
+----------+----------+
+-----------+----------+---------+--------+-----------------+
| review_id | movie_id | user_id | rating | review_text     |
+-----------+----------+---------+--------+-----------------+
|         1 |        1 |       1 |    4.8 | Excellent Movie |
|         2 |        1 |       2 |    4.5 | Very Good       |
|         3 |        2 |       1 |    4.2 | Nice Movie      |
+-----------+----------+---------+--------+-----------------+
+-----------+-------------+
| artist_id | artist_name |
+-----------+-------------+
|         1 | Vijay       |
|         2 | Lokesh      |
+-----------+-------------+
+----------+------------+
| skill_id | skill_name |
+----------+------------+
|        1 | Acting     |
|        2 | Singing    |
|        3 | Direction  |
+----------+------------+
+-----------+----------+
| artist_id | skill_id |
+-----------+----------+
|         1 |        1 |
|         1 |        2 |
|         2 |        3 |
+-----------+----------+
+---------+-----------+
| role_id | role_name |
+---------+-----------+
|       1 | Actor     |
|       2 | Singer    |
|       3 | Director  |
+---------+-----------+
+----------+-----------+---------+
| movie_id | artist_id | role_id |
+----------+-----------+---------+
|        1 |         1 |       1 |
|        1 |         1 |       2 |
|        2 |         1 |       1 |
|        1 |         2 |       3 |
|        2 |         2 |       3 |
+----------+-----------+---------+
