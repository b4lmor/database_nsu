SELECT disk.id, disk.name
FROM disk
JOIN m2m_song_disk ON m2m_song_disk.disk_id = disk.id
JOIN song ON m2m_song_disk.song_id = song.id
WHERE song.name = 'Весенний дождь'
