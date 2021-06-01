/*
 1. Вывести среднюю длину треков в каждом альбоме по убыванию
*/

select album_nm, avg(length) as avg
from musicalservice.track_x_album
left join musicalservice.album
on track_x_album.album_id = album.album_id
left join musicalservice.track
on track_x_album.track_id = track.track_id
group by album.album_id
having avg(length) > 0
order by avg(length) desc;

/*
 2. Вывести количество альбомов у каждого исполнителя
*/

select artist_nm, count(album_id) as album_cnt
from musicalservice.artist
right join musicalservice.artist_x_album on artist.artist_id = artist_x_album.artist_id
group by artist.artist_id
having count(album_id) > 0
order by album_cnt desc;

/*
 3. Вывести всю информацию о бонусных треках
*/

select distinct track_number, artist_nm, album_nm, is_feat, disc_number, is_skit,
                track_nm, language, lyrics, is_explicit, remix_author, is_instrumental, length
from ((musicalservice.track_x_album
left join musicalservice.track on track_x_album.track_id = track.track_id
left join musicalservice.album on track_x_album.album_id = album.album_id)
right join musicalservice.artist_x_track on artist_x_track.track_id = track.track_id)
left join musicalservice.artist on artist.artist_id = artist_x_track.artist_id
where is_bonus_track = true;

/*
 4. Вывести для каждого альбома предыдущий и следующий по дате выхода
*/

select album_nm,
       lag(album_nm, 1) over (order by release_dt) prev_album,
       lead(album_nm, 1) over (order by release_dt) next_album
from musicalservice.label_x_album
left join musicalservice.label on label_x_album.label_id = label.label_id
left join musicalservice.album on label_x_album.album_id = album.album_id;

/*
 5. Вывести суммарную длину каждого альбома, по убыванию
*/

select distinct album_nm,
       sum(length) over (partition by album.album_id) as len
from musicalservice.track_x_album
left join musicalservice.track
on track_x_album.track_id = track.track_id
left join musicalservice.album
on track_x_album.album_id = album.album_id
order by len desc;

/*
 5.1. Топ-2 альбом по длительности у каждого исполнителя
*/

select artist_nm, album_nm, len
from (
    select artist_nm, album_nm, len, row_number() over (partition by artist_nm order by len desc) as row_num
from (
    select distinct artist_nm, album_nm,
    sum(length) over (partition by album.album_id) as len
    from ((musicalservice.track_x_album
    left join musicalservice.track
    on track_x_album.track_id = track.track_id
    left join musicalservice.album
    on track_x_album.album_id = album.album_id)
    left join musicalservice.artist_x_album
    on artist_x_album.album_id = album.album_id)
    left join musicalservice.artist
    on artist.artist_id = artist_x_album.artist_id
    ) as sumlen_table)
    as len_order_table
where row_num = 2
order by len desc;
