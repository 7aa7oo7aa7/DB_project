create schema if not exists musical_service_views;

create view musical_service_views.russian_artists as
select artist_nm, description, foundation_year
from musicalservice.artist
where country = 'Russia'
order by artist_nm;
select * from musical_service_views.russian_artists;

create view musical_service_views.live_albums as
select album_nm
from musicalservice.album
where type = 'live';
select * from musical_service_views.live_albums;

create view musical_service_views.all_labels as
select distinct label_nm  -- it won't update
from musicalservice.label
order by label_nm;
select * from musical_service_views.all_labels;

create view musical_service_views.long_instrumental_tracks as
select track_nm, remix_author, length
from musicalservice.track
where is_instrumental = true and length >= 300
order by length;
select * from musical_service_views.long_instrumental_tracks;

create view musical_service_views.rock_genres as
select genre_nm, description
from musicalservice.genre
where origin = 'Rock';
select * from musical_service_views.rock_genres;
