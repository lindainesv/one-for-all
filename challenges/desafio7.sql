SELECT 
    nome_artista AS artista,
    nome_album AS album,
    COUNT(id_usuario) AS pessoas_seguidoras
FROM
    seguindo_artistas
        INNER JOIN
    albuns ON albuns.id_artista = seguindo_artistas.id_artista
        INNER JOIN
    artistas ON seguindo_artistas.id_artista = artistas.id_artista
GROUP BY nome_artista , nome_album
ORDER BY pessoas_seguidoras DESC , nome_artista , nome_album;