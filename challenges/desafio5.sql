SELECT nome_cancoes AS cancao,
	COUNT(historico.id_cancao) AS reproducoes
FROM
    SpotifyClone.historico
INNER JOIN cancoes
ON cancoes.id_cancao = historico.id_cancao
GROUP BY nome_cancoes
ORDER BY reproducoes DESC, nome_cancoes
LIMIT 2;