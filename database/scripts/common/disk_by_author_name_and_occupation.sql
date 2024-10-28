SELECT DISTINCT disk.id, disk.name
FROM disk
         JOIN m2m_song_disk ON disk.id = m2m_song_disk.disk_id
         JOIN song ON m2m_song_disk.song_id = song.id
         JOIN m2m_author_song ON m2m_author_song.song_id = song.id
         JOIN author ON m2m_author_song.author_id = author.id
         JOIN occupation ON occupation.id = author.occupation_id
WHERE (occupation.description = 'Текстовик')
  AND (author.name = 'Светлана Смирнова')
