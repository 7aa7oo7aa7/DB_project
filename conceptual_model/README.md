# [Концептуальная модель](https://github.com/7aa7oo7aa7/DB_project/blob/main/conceptual_model/conceptual_model.png)

## Сущности:

Трек, альбом, исполнитель, жанр, лейбл

## Связи:

Будем считать следующее:

- Если исполнитель существует, то у него есть хотя бы один трек.

- Если лейбл существует, то на нём записывается хотя бы один исполнитель.

- Каждый трек выпускается на каком-то альбоме (если выпускается он один, то это сингл).

### Альбом, исполнитель

- У каждого исполнителя один или несколько альбомов.

- Каждый альбом имеет одного или нескольких исполнителей.

### Альбом, лейбл

- Альбом может издаваться лейблом или самим исполнителем,
поэтому альбом связан с 0 или 1 лейблами.

- Лейбл может издавать один или несколько альбомов.

### Трек, исполнитель

- У каждого трека есть один или несколько исполнителей.

- У исполнителя может быть один или несколько треков.

### Трек, альбом

- Каждый трек находится в одном или нескольких альбомах (например, если он переиздаётся на другом альбоме).

- Альбом содержит один (single) или несколько (EP, LP) треков.

### Трек, жанр

- Каждый трек принадлежит к одному или нескольким жанрам.

- По каждому жанру есть несколько треков данного жанра.

### Исполнитель, жанр

- Исполнитель относится к одному или нескольким жанрам.

- Для каждого жанра есть один или несколько исполнителей.
