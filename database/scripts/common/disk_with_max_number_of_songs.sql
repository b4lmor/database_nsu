SELECT disk.id, disk.name, COUNT(m2m_song_disk.song_id) AS count
FROM disk
         JOIN m2m_song_disk ON disk.id = m2m_song_disk.disk_id
GROUP BY disk.id, disk.name
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM m2m_song_disk
    GROUP BY disk_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
