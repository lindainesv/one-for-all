SELECT 
    MIN(valor) AS faturamento_minimo,
    MAX(valor) AS faturamento_maximo,
    ROUND(AVG(valor), 2) AS faturamento_medio,
    SUM(valor) AS faturamento_total
FROM
    usuarios
        INNER JOIN
    SpotifyClone.plano ON usuarios.id_plano = plano.id_plano;
