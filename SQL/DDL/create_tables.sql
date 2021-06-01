create schema if not exists MusicalService;

create table if not exists MusicalService.Album (
    album_id serial primary key,
    album_nm varchar(255) not null,
    type varchar(255) not null,
    cover_image_link varchar(255)
);

create table if not exists MusicalService.Label (
    label_id serial primary key,
    label_nm varchar(255) not null,
    release_dt timestamp not null,
    cooperation_end_dt timestamp not null
);

create table if not exists MusicalService.Track (
    track_id serial primary key,
    track_nm varchar(255) not null,
    language varchar(255),
    lyrics varchar(10000),
    is_explicit boolean,
    remix_author varchar(255),
    is_instrumental boolean,
    length integer not null
);

create table if not exists MusicalService.Artist (
    artist_id serial primary key,
    artist_nm varchar(255) not null,
    country varchar(255),
    description varchar(10000),
    foundation_year integer,
    photo_link varchar(255)
);

create table if not exists MusicalService.Genre (
    genre_id serial primary key,
    genre_nm varchar(255) not null,
    origin varchar(255),
    description varchar(10000)
);

create table if not exists MusicalService.Track_x_Album (
    album_id integer not null,
    track_id integer not null,
    track_number integer not null,
    disc_number integer not null,
    is_bonus_track boolean not null,
    is_skit boolean not null
);

alter table MusicalService.Track_x_Album
add constraint fk_album_id
foreign key (album_id) references MusicalService.Album (album_id);

alter table MusicalService.Track_x_Album
add constraint fk_track_id
foreign key (track_id) references MusicalService.Track (track_id);

create table if not exists MusicalService.Artist_x_Album (
    album_id integer not null,
    artist_id integer not null,
    release_type varchar(255)
);

alter table MusicalService.Artist_x_Album
add constraint fk_album_id
foreign key (album_id) references MusicalService.Album (album_id);

alter table MusicalService.Artist_x_Album
add constraint fk_artist_id
foreign key (artist_id) references MusicalService.Artist (artist_id);

create table if not exists MusicalService.Artist_x_Track (
    track_id integer not null,
    artist_id integer not null,
    is_feat boolean not null
);

alter table MusicalService.Artist_x_Track
add constraint fk_artist_id
foreign key (artist_id) references MusicalService.Artist (artist_id);

alter table MusicalService.Artist_x_Track
add constraint fk_track_id
foreign key (track_id) references MusicalService.Track (track_id);

create table if not exists MusicalService.Artist_x_Genre (
    genre_id integer not null,
    artist_id integer not null,
    is_primary_genre boolean not null
);

alter table MusicalService.Artist_x_Genre
add constraint fk_artist_id
foreign key (artist_id) references MusicalService.Artist (artist_id);

alter table MusicalService.Artist_x_Genre
add constraint fk_genre_id
foreign key (genre_id) references MusicalService.Genre (genre_id);

create table if not exists MusicalService.Genre_x_Track (
    genre_id integer not null,
    track_id integer not null
);

alter table MusicalService.Genre_x_Track
add constraint fk_genre_id
foreign key (genre_id) references MusicalService.Genre (genre_id);

alter table MusicalService.Genre_x_Track
add constraint fk_track_id
foreign key (track_id) references MusicalService.Track (track_id);

create table if not exists MusicalService.Label_x_Album (
    label_id integer not null,
    album_id integer not null
);

alter table MusicalService.Label_x_Album
add constraint fk_album_id
foreign key (album_id) references MusicalService.Album (album_id);

alter table MusicalService.Label_x_Album
add constraint fk_label_id
foreign key (label_id) references MusicalService.Label (label_id);
