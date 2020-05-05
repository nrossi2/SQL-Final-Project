
--This stored pcedure spits out an individual artists popualrity, based off their average track popularity
--If universal had an expanded database with streaming information of all theri artists, they could use this procedure
--to estimate artist popularity in a fast, clean manner.


DELIMITER $$

DROP PROCEDURE IF EXISTS getArtistPop$$

CREATE PROCEDURE getArtistPop(inArtist VARCHAR(255))
BEGIN

	SET @artist := inArtist;

	SELECT AVG(tracks.track_popularity)
	FROM tracks
	JOIN artists
		ON artists.artist_id = tracks.artist_id
	WHERE artists.artist_name = @artist;

END $$
DELIMITER ;

CALL getArtistPop('Kanye West')
