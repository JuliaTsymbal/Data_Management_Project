CREATE VIEW episode_view AS
SELECT scraping_fandom_episode.fandom_url, scraping_imdb_episode.*
FROM scraping_fandom_episode
LEFT JOIN scraping_imdb_episode ON scraping_fandom_episode.episode_number_absolute=scraping_imdb_episode.episode_number_absolute;

CREATE VIEW raw_episode AS
SELECT   fd.fandom_url,
    fd.title AS fandom_title,
        fd.image_url,
        fd.season AS fandom_season,
        fd.production_code,
        fd.airdate AS fandom_airdate,
        fd.main_characters,
        fd.written_by,
        fd.directed_by,
        fd.creation_time AS fandom_creation_time,
        
        im.imdb_url,
        im.season AS imdb_season,
        im.episode_number_relative,
        im.episode_number_absolute,
        im.title AS imdb_title,
        im.airdate AS imdb_airdate,
        im.rating,
        im.reviews_amount,
        im.creation_time AS imdb_creation_time
FROM scraping_fandom_episode as fd
INNER JOIN scraping_imdb_episode as im ON fd.episode_number_absolute=im.episode_number_absolute;