SELECT 
    COUNT(cancoes.id_cancao) AS cancoes,
    COUNT(DISTINCT artistas.id_artista) AS artistas,
    COUNT(DISTINCT albuns.id_album) AS albuns
FROM
    SpotifyClone.cancoes
        INNER JOIN
    albuns ON cancoes.id_album = albuns.id_album
        INNER JOIN
    artistas ON albuns.id_artista = artistas.id_artista;
