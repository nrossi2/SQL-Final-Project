--It is not uncommon for an artist to leave one music label and sign with another
--In this case, universal cant utilize a TRIGGER to insert an artist who has left the company
--into an archived table before deleting them from their artist table


CREATE TABLE archived_artists (
    artist_id VARCHAR(25) PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    artist_genre VARCHAR(20) NOT NULL,
    artist_followers INT(9) NOT NULL,
    artist_popularity INT(2) NOT NULL
);

DELIMITER $$

CREATE TRIGGER archiveArtist
BEFORE DELETE ON artists FOR EACH ROW
BEGIN
  INSERT INTO archived_artists(artist_id,artist_name,artist_genre,artist_followers,artist_popularity)
  VALUES(OLD.artist_id,OLD.artist_name,OLD.artist_genre,OLD.artist_followers,OLD.artist_popularity);
END$$

DELIMITER ;

DELETE FROM artists
WHERE artist_name = 'Drake'
