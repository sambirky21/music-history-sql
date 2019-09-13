-- Query all of the entries in the Genre table
SELECT "Label"
From Genre;

SELECT "Title", "SongLength"
From Song;
-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
VALUES (NULL, "Punch Brothers", 2008);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (NULL, "All Ashore", "07/20/2018", 2596, "Something Cool", 28, 8);

UPDATE Album
SET "Label" = "Nonesuch Records"
WHERE AlbumId = 25;

DELETE
FROM Album
WHERE AlbumId = 23;

DELETE
FROM Album
WHERE AlbumId = 24;

UPDATE Album
SET Label = "Nonesuch Records"
WHERE AlbumId = 25;

-- Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (NULL, "All Ashore", 180, "07/20/2018", 8, 28, 25);

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (NULL, "Angel of Doubt", 180, "07/20/2018", 8, 28, 25);

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (NULL, "Just Look at this Mess", 180, "07/20/2018", 8, 28, 25);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT s.Title as "SongTitle", a.Title as "AlbumTitle", ar.ArtistName AS "ArtistName", g.Label
FROM Song s
LEFT JOIN Album a
ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar
ON s.ArtistId = ar.ArtistId
LEFT JOIN Genre g
ON s.GenreId = g.GenreId
WHERE ar.ArtistName = "Punch Brothers";

-- Example from chapter
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(albumId) FROM Song Group BY albumId;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(ArtistId) FROM Song Group BY ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(GenreId) FROM Song Group BY GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT MAX(AlbumLength), Title FROM Album;

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT MAX(SongLength), s.Title as "SongTitle", a.Title as "AlbumTitle"
FROM Song s
JOIN Album a
ON a.ArtistId = s.ArtistId;

-- Modify the previous query to also display the title of the album.