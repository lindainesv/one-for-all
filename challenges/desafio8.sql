SELECT 
    nome_artista AS artista, nome_album AS album
FROM
    albuns
        INNER JOIN
    artistas ON albuns.id_artista = artistas.id_artista
HAVING nome_artista = 'Elis Regina'
ORDER BY nome_album;