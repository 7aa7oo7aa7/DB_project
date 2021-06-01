create schema if not exists musical_service_views;

create view musical_service_views.tracks_by_album as
select track_nm, album_nm, track_number, disc_number,
       language, lyrics, is_explicit, is_instrumental, remix_author,
       is_bonus_track, is_skit
from musicalservice.track_x_album
left join musicalservice.track on track_x_album.track_id = track.track_id
left join musicalservice.album on track_x_album.album_id = album.album_id
order by album_nm;
select * from musical_service_views.tracks_by_album;

create view musical_service_views.tracks_by_artist as
select artist_nm, track_nm, album_nm, length, remix_author, language, lyrics, is_explicit, is_instrumental
from ((musicalservice.artist_x_track
left join musicalservice.artist on artist_x_track.artist_id = artist.artist_id
left join musicalservice.track on artist_x_track.track_id = track.track_id)
right join musicalservice.track_x_album on track.track_id = track_x_album.track_id)
left join musicalservice.album on track_x_album.album_id = album.album_id
order by (artist_nm, track_nm);
select * from musical_service_views.tracks_by_artist;

create view musical_service_views.album_length as
select album_nm, sum(length) as sum_length
from musicalservice.track_x_album
left join musicalservice.album
on track_x_album.album_id = album.album_id
left join musicalservice.track
on track_x_album.track_id = track.track_id
group by album.album_id
having sum(length) > 0
order by sum(length) desc;
select * from musical_service_views.album_length;


