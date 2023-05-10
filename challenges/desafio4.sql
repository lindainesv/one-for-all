SELECT nome_usuario AS pessoa_usuaria,
    CASE
        WHEN MAX(data_reproducao) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM historico
	INNER JOIN usuarios 
		ON usuarios.id_usuario = historico.id_usuario
GROUP BY nome_usuario
ORDER BY nome_usuario;