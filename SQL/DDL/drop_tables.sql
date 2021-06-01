alter table MusicalService.Track_x_Album
drop constraint fk_album_id;
alter table MusicalService.Track_x_Album
drop constraint fk_track_id;
alter table MusicalService.Artist_x_Album
drop constraint fk_album_id;
alter table MusicalService.Artist_x_Album
drop constraint fk_artist_id;
alter table MusicalService.Artist_x_Track
drop constraint fk_artist_id;
alter table MusicalService.Artist_x_Track
drop constraint fk_track_id;
alter table MusicalService.Artist_x_Genre
drop constraint fk_artist_id;
alter table MusicalService.Artist_x_Genre
drop constraint fk_genre_id;
alter table MusicalService.Genre_x_Track
drop constraint fk_genre_id;
alter table MusicalService.Genre_x_Track
drop constraint fk_track_id;
alter table MusicalService.Label_x_Album
drop constraint fk_album_id;
alter table MusicalService.Label_x_Album
drop constraint fk_label_id;

drop table if exists musicalservice.album;
drop table if exists musicalservice.label;
drop table if exists musicalservice.label_x_album;
drop table if exists musicalservice.artist;
drop table if exists musicalservice.track;
drop table if exists musicalservice.genre;
drop table if exists musicalservice.artist_x_album;
drop table if exists musicalservice.track_x_album;
drop table if exists musicalservice.artist_x_track;
drop table if exists musicalservice.genre_x_track;
drop table if exists musicalservice.artist_x_genre;

drop schema if exists musicalservice;