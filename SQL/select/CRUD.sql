insert into musicalservice.album
values (default, 'CRUDification', 'LP', 'youtube.com/dQw...');
select *
from musicalservice.album
where cover_image_link like 'youtube.com%';
update musicalservice.album
set album_nm = 'Songs for the CRUD' where album_nm = 'Songs for the CRUD';
delete from musicalservice.album
where album_nm = 'Songs for the CRUD';

insert into musicalservice.label
values (default, 'CRUD Records', '2004-06-30 14:27:53', '2704-06-30 14:27:53');
select *
from musicalservice.label
where label_nm = 'CRUD Records';
update musicalservice.label
set release_dt = '1994-06-30 14:27:53' where label_nm = 'CRUD Records';
delete from musicalservice.label
where label_nm = 'CRUD Records';

insert into musicalservice.genre
values (default, 'CRUD', null, 'CRUD genre');
select description
from musicalservice.genre
where genre_nm = 'CRUD';
update musicalservice.genre
set description = 'CRUD DESCRIPTION' where genre_nm = 'CRUD';
delete from musicalservice.genre
where genre_nm = 'CRUD';

insert into musicalservice.artist
values (default, 'CRUDO FLOPPA', 'Russia', null, 2020, null);
select artist_nm, country
from musicalservice.artist
where artist = 'CRUDO FLOPPA';
update musicalservice.artist
set foundation_year = 1337 where artist = 'CRUDO FLOPPA';
delete from musicalservice.artist
where artist = 'CRUDO FLOPPA';

insert into musicalservice.track
values (default, 'About CRUD', 'Ukranian', null, true, 'CRUDO FLOPPA', false, -5);
select language, remix_author
from musicalservice.track
where track_nm = 'About CRUD';
update musicalservice.track
set track_nm = 'CRUD CRUD CRUD' where track_nm = 'About CRUD';
delete from musicalservice.track
where track_nm = 'CRUD CRUD CRUD';
