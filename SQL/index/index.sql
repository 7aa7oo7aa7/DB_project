create index album_index
on musicalservice.album(album_id, album_nm);

create index track_index
on musicalservice.track(track_id, track_nm);

create index genre_id_index
on musicalservice.genre(genre_id);

create index artist_index
on musicalservice.artist(artist_id, artist_nm);