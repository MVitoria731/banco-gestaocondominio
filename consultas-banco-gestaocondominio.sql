--consulta para ver moradores que estão com o pagamento atrasado
--retorna o nome, email, mes e ano do atraso e o valor
SELECT
    p.nome AS nome_do_morador,
    p.email,
    pag.mes_ano AS competencia,
    pag.valor
FROM
    Pagamento pag
JOIN
    Pessoa p ON pag.cpf_morador = p.cpf
WHERE
    pag.status = 'Atrasado'
ORDER BY
    p.nome;

--valor total recebido em um determinado mes
--retorna o valor total e o mes
SELECT
    mes_ano,
    SUM(valor) AS total_arrecadado
FROM
    Pagamento
WHERE
    status = 'Pago'
GROUP BY
    mes_ano
ORDER BY
    mes_ano;

--valores para receber
--retorna a soma dos valores que ainda estao pendentes mas nao atrasados
SELECT
    SUM(CASE WHEN status = 'Pendente' THEN valor ELSE 0 END) AS total_pendente
FROM
    Pagamento
WHERE
    mes_ano = '2025-06';

--contar a quantidade de denuncia de acordo com os status
--retorna o status da denuncia junto com a quantidade
SELECT
    status,
    COUNT(id_denuncia) AS quantidade
FROM
    Denuncias
GROUP BY
    status
ORDER BY
    status;

--contar a quantidade de contratos de acordo com o tipo
--retorna o tipo junto com a quantidade
SELECT
    tipo_contrato,
    COUNT(id_contrato) AS quantidade_de_contratos
FROM
    Contrato
GROUP BY
    tipo_contrato
ORDER BY
    quantidade_de_contratos;

--moradores que pagaram apos o vencimento
--retorna o nome, o mes, data de vencimento, data de pagamento
SELECT
    p.nome,
    pag.mes_ano,
    pag.vencimento,
    pag.data_pagamento
FROM
    Pagamento pag
JOIN
    Pessoa p ON pag.cpf_morador = p.cpf
WHERE
    pag.status = 'Pago' AND pag.data_pagamento > pag.vencimento
ORDER BY
    pag.data_pagamento;
