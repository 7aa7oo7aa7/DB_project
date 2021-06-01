create or replace procedure musicalservice.censor_album(album_id_to_censor integer)
language sql
as $$
    delete from musicalservice.track_x_album
    where track_id = (
        select track.track_id
        from musicalservice.track_x_album
        left join musicalservice.track on track_x_album.track_id = track.track_id
        left join musicalservice.album on track_x_album.album_id = album.album_id
        where is_explicit = true and album.album_id = album_id_to_censor
    );
$$;

create or replace procedure musicalservice.drop_genre(genre_id_to_delete integer)
language sql
as $$
    delete from musicalservice.genre_x_track
    where genre_id = genre_id_to_delete;
    delete from musicalservice.artist_x_genre
    where genre_id = genre_id_to_delete;
    delete from musicalservice.genre
    where genre_id = genre_id_to_delete;
$$;


