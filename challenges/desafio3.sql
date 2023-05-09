SELECT 
  nome_usuario AS pessoa_usuaria,
    COUNT(cancoes.id_cancao) AS musicas_ouvidas,
    ROUND(SUM(duracao_segundos) / 60, 2) AS total_minutos
FROM
    SpotifyClone.historico
        INNER JOIN usuarios 
    ON historico.id_usuario = usuarios.id_usuario
        INNER JOIN cancoes 
    ON historico.id_cancao = cancoes.id_cancao
GROUP BY nome_usuario
ORDER BY nome_usuario;

