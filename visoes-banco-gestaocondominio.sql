--listar os moradores e suas respectivas unidades
CREATE VIEW moradores_atuais AS
SELECT p.nome, p.email, u.bloco, u.numero_apartamento, mu.data_entrada
FROM Morador m
JOIN Pessoa p ON m.cpf_morador = p.cpf
JOIN Morador_Unidade mu ON m.cpf_morador = mu.cpf_morador
JOIN Unidade u ON mu.id_unidade = u.id_unidade
WHERE mu.data_saida IS NULL;

--lista todas as solicitações que não foram concluitas e nem canceladas
CREATE VIEW Solicitacoes_Pendente AS
SELECT p.nome, u.bloco, u.numero_apartamento, sm.descricao, sm.data_abertura, sm.status
FROM Solicitacao_manutencao sm
JOIN Morador m ON sm.cpf_morador = m.cpf_morador
JOIN Pessoa p ON m.cpf_morador = p.cpf
JOIN Unidade u ON sm.id_unidade = u.id_unidade
WHERE sm.status NOT IN ('Concluída', 'Cancelada');

-- lista todos os moradores que ainda não pagaram
CREATE VIEW Pagamentos_Pendentes AS
SELECT p.nome, pg.mes_ano, pg.valor, pg.vencimento, pg.status
FROM Pagamento pg
JOIN Pessoa p ON pg.cpf_morador = p.cpf
WHERE pg.status NOT IN ('Pago')

--lista denúncias que ainda não foram resolvidas
CREATE VIEW Denuncias_Pendentes AS
SELECT d.id_denuncia, p.nome, d.descricao, d.data_denuncia, d.status
FROM Denuncias d
JOIN Pessoa p ON d.cpf_pessoa = p.cpf
WHERE d.status NOT IN ('Resolvida')

--lista as reservas confirmadas das áreas comuns
CREATE VIEW Agenda_Area_Comum AS
SELECT r.id_reserva, p.nome as morador, ac.nome as area_comum, r.data_reserva, r.horario_inicio, r.horario_fim
FROM Reserva r
JOIN Morador m ON r.cpf_morador = m.cpf_morador
JOIN Pessoa p ON m.cpf_morador = p.cpf
JOIN Area_comum ac ON r.id_area = ac.id_area_comum
WHERE r.status IN ('Confirmada');

--lista as entregas que ainda não foram recebidas com o nome do morador
CREATE VIEW Entregas_Pendentes AS
SELECT p.nome, e.data_recebimento, e.status
FROM Entrega e
JOIN Pessoa p ON e.cpf_morador = p.cpf
WHERE e.data_retirada IS NULL

--lista todos os funcionários atuais
CREATE VIEW Funcionarios_Ativos AS
SELECT p.nome, p.email, f.cargo, f.data_admissao
FROM Funcionario f
JOIN Pessoa p ON f.cpf_funcionario = p.cpf
WHERE f.data_demissao IS NULL;

--lista os contratos com o nome da pessoa, tipo e o arquivo
CREATE VIEW Contrato_Pessoa AS
SELECT p.nome, c.tipo_contrato, c.arquivo
FROM Contrato c
JOIN Pessoa p ON c.cpf_pessoa = p.cpf

--lista todos os telefones vinculados aos moradores com o numero e o tipo
CREATE VIEW Telefone_Morador AS
SELECT p.cpf, p.nome, t.numero, t.tipo
FROM Morador m
JOIN Pessoa p ON m.cpf_morador = p.cpf
JOIN Telefones t ON p.cpf = t.cpf_pessoa;

--lista todos os apartamentos que estão desocupados
CREATE VIEW Unidade_desocupadas AS
SELECT u.bloco, u.numero_apartamento
FROM Unidade u
WHERE u.id_unidade NOT IN(
	SELECT id_unidade
	FROM Morador_Unidade
	WHERE data_saida IS NULL
)

--listar todos os moradores
CREATE VIEW Moradores AS
SELECT p.nome, p.email, u.bloco, u.numero_apartamento, mu.data_entrada, mu.data_saida
FROM Morador m
JOIN Pessoa p ON m.cpf_morador = p.cpf
JOIN Morador_Unidade mu ON m.cpf_morador = mu.cpf_morador
JOIN Unidade u ON mu.id_unidade = u.id_unidade;
ORDER BY u.bloco, u.numero_apartamento

