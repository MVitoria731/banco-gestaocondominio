INSERT INTO Pessoa (cpf, nome, email) VALUES
('77804413009', 'Arsène Lupin', 'a.lupin@gmail.com'),
('80850784069', 'Valérie Asserman', 'v.asserman@gmail.com'),
('09676800007', 'Jim Barnett', 'jim.barnett@gmail.com'),
('38190893068', 'Olga Volkov', 'o.volkov@gmail.com'),
('47247616016', 'Théodore Béchoux', 't.bechoux@gmail.com'),
('56138812000', 'Justin Ganimard', 'j.ganimard@gmail.com'),
('61131772032', 'Alexandra Renaud', 'a.renaud@gmail.com'),
('24568791049', 'Pierre Dubreuil', 'p.dubreuil@gmail.com'),
('47415022017', 'Jean Daspry', 'j.daspry@gmail.com'),
('94696612066', 'Del Prego', 'd.prego@gmail.com'),
('08124117063', 'Léon Joseph Asserman', 'lj.asserman@gmail.com'),
('71493628050', 'Elizabeth Lovendale', 'e.lovendale@gmail.com'),
('82537491000', 'Paul Erstein', 'p.erstein@gmail.com'),
('93648502041', 'Maxime Tuillier', 'm.tuillier@gmail.com'),
('14759613082', 'Alfred Auvard', 'a.auvard@gmail.com'),
('25860724023' ,'Raoul Dupin', 'r.dupin@gmail.com'),
('36971835064' ,'Louis Batinet', 'l.batinet@gmail.com'),
('47082946005' ,'Alexandre Vernisson', 'a.vernisson@gmail.com'),
('58193057046' ,'Nicolas Gassire', 'n.gassire@gmail.com'),
('69204168087' ,'Nelly Underdown', 'n.underdown@gmail.com'),
('70315279028' ,'Isidore Beautrelet', 'i.beautrelet@gmail.com'),
('81426380069' ,'Joséphine Balsamo', 'j.balsamo@gmail.com'),
('92537491000' ,'Clarisse Etigues', 'c.etigues@gmail.com'),
('13648502051' ,'Maurice Leblanc', 'm.leblanc@gmail.com'),
('24759613092' ,'Sonia Krichnof', 's.krichnof@gmail.com'),
('35860724033' ,'Horace Velmont', 'h.velmont@gmail.com'),
('46971835074' ,'Aurélie Austeux', 'a.austeux@gmail.com'),
('58193057047','Beatriz Souza', 'beatriz.souza@email.com');

INSERT INTO Morador (cpf_morador) VALUES
('80850784069'),('38190893068'),('56138812000'),('61131772032'),
('47415022017'),('94696612066'),('71493628050'),('82537491000'),
('14759613082'),('47082946005');

INSERT INTO Funcionario (cpf_funcionario, cargo, salario, data_admissao) VALUES
('58193057047', 'Síndico', 6000.00, '2025-04-01'),
('46971835074', 'Subsíndico', 4500.00, '2025-04-01'),
('13648502051', 'Contador', 2500.00, '2025-04-01'),
('35860724033', 'Faxineiro', 2300.00, '2025-04-01'),
('69204168087', 'Segurança', 2000.00, '2025-04-01'),
('24759613092', 'Eletricista', 2200.00, '2025-04-01'),
('92537491000', 'Zelador', 2500.00, '2025-04-03'),
('81426380069', 'Gestor de TI', 4000.00, '2025-04-01'),
('58193057046', 'Encanador', 2200.00, '2025-04-01'),
('36971835064', 'Gerente de Recursos Humanos', 2600.00, '2025-04-01'),
('25860724023', 'Jardineiro', 1800.00, '2025-04-01');

INSERT INTO Terceirizado (cpf_terceirizado, empresa, servico_prestado, data_inicio, data_termino) VALUES
('47247616016', 'Academia Barnett', 'Treinamento Físico', '2025-05-02', NULL),
('24568791049', 'Perícia Contábil do Condomínio', 'Análise Financeira e Auditoria de Contas', '2025-05-02', NULL),
('08124117063', 'Assessoria Jurídica Condominal', 'Consultoria e Resolução de Conflitos', '2025-05-02', NULL),
('93648502041', 'Manutenção do Condomínio', 'Reparos e Conservação de Infraestrutura', '2025-05-02', NULL),
('70315279028', 'Limpeza e Conservação do Condomínio', 'Serviços de Limpeza e Manutenção de Áreas Comuns', '2025-05-02', NULL);

INSERT INTO Administrador (cpf_adm) VALUES
('09676800007'), ('77804413009');

INSERT INTO Unidade (bloco, numero_apartamento) VALUES
('A', '100'),
('A', '101'),
('B', '102'),
('B', '103'),
('C', '104'),
('C', '105'),
('D', '106'),
('D', '107'),
('E', '108'),
('E', '109');

INSERT INTO Morador_Unidade (cpf_morador, id_unidade, data_entrada, data_saida) VALUES
('80850784069', 1, '2025-05-20', NULL),
('47415022017', 2, '2025-05-20', NULL),
('38190893068', 3, '2025-05-20', NULL),
('61131772032', 4, '2025-05-20', NULL),
('94696612066', 5, '2025-05-20', NULL),
('56138812000', 6, '2025-05-20', NULL),
('71493628050', 7, '2025-05-20', NULL),
('47082946005', 8, '2025-05-20', NULL),
('82537491000', 9, '2025-05-20', NULL),
('14759613082', 10, '2025-05-20', NULL);

INSERT INTO Telefones (cpf_pessoa, numero, tipo) VALUES
('77804413009', '+33 6 12 34 56 78', 'Celular'),
('80850784069', '+33 1 45 67 89 10', 'Residencial'),
('09676800007', '+33 7 89 12 34 56', 'Comercial'),
('38190893068', '+33 6 55 44 33 22', 'Celular'),
('47247616016', '+33 1 11 22 33 44', 'Trabalho'),
('56138812000', '+33 1 99 88 77 66', 'Trabalho'),
('61131772032', '+33 6 10 20 30 40', 'Celular'),
('24568791049', '+33 1 50 60 70 80', 'Residencial'),
('47415022017', '+33 7 88 99 00 11', 'Celular'),
('94696612066', '+33 6 12 13 14 15', 'Celular');

INSERT INTO Entrega (cpf_morador, cpf_funcionario, data_recebimento, data_retirada, status) VALUES
('80850784069', '69204168087', '2025-07-01 10:30:00', '2025-07-01 18:00:00', 'Entregue'),
('38190893068', '69204168087', '2025-07-01 11:15:00', NULL, 'Aguardando retirada'),
('56138812000', '69204168087', '2025-06-30 20:00:00', '2025-07-01 08:30:00', 'Entregue'),
('61131772032', '69204168087', '2025-06-29 14:00:00', NULL, 'Aguardando retirada'),
('47415022017', '69204168087', '2025-06-28 16:45:00', '2025-06-28 17:00:00', 'Entregue'),
('94696612066', '69204168087', '2025-06-27 09:00:00', NULL, 'Aguardando retirada'),
('71493628050', '69204168087', '2025-06-26 22:10:00', NULL, 'Aguardando retirada'),
('82537491000', '69204168087', '2025-06-25 15:20:00', '2025-06-26 12:00:00', 'Entregue'),
('14759613082', '69204168087', '2025-06-24 18:00:00', NULL, 'Aguardando retirada'),
('47082946005', '69204168087', '2025-06-23 12:00:00', '2025-06-23 19:30:00', 'Entregue');

INSERT INTO Solicitacao_manutencao (cpf_morador, id_unidade, descricao, status, data_abertura, data_fim) VALUES
('80850784069', 1, 'Lâmpada do corredor do 1º andar queimada.', 'Concluída', '2025-06-20', '2025-06-21'),
('38190893068', 2, 'Vazamento na pia da cozinha.', 'Em Andamento', '2025-06-25', NULL),
('56138812000', 3, 'Portão da garagem não fecha automaticamente.', 'Aberta', '2025-06-28', NULL),
('61131772032', 4, 'Infiltração no teto do banheiro.', 'Aberta', '2025-07-01', NULL),
('47415022017', 5, 'Tomada do quarto sem energia.', 'Em Andamento', '2025-06-29', NULL),
('94696612066', 6, 'Interfone não está funcionando.', 'Cancelada', '2025-06-15', '2025-06-16'),
('71493628050', 7, 'Fechadura da porta de entrada emperrada.', 'Aberta', '2025-07-01', NULL),
('82537491000', 8, 'Ralo do box do banheiro entupido.', 'Concluída', '2025-06-18', '2025-06-18'),
('14759613082', 9, 'Barulho estranho no ar condicionado.', 'Aberta', '2025-06-30', NULL),
('47082946005', 10, 'Vidro da janela da sala trincado.', 'Em Andamento', '2025-06-27', NULL);

INSERT INTO Funcionario_manutencao (id_solicitacao, cpf_funcionario) VALUES
(1, '92537491000'), (2, '58193057046'), (5, '24759613092'), (8, '58193057046'),
(10, '92537491000');

INSERT INTO Avisos (cpf_adm, titulo, mensagem, data_publicacao) VALUES
('09676800007', 'Manutenção do Elevador - Bloco A', 'O elevador do Bloco A estará em manutenção no dia 05/07/2025, das 08h às 12h.', '2025-07-01'),
('77804413009', 'Festa Junina do Condomínio', 'Venha para nossa festa junina no dia 26/07/2025, às 18h, no Salão de Festas!', '2025-06-30'),
('09676800007', 'Limpeza da Caixa D''Água', 'A limpeza das caixas d''água ocorrerá em 10/07/2025. Pode haver interrupção no fornecimento.', '2025-06-28'),
('77804413009', 'Assembleia Geral Ordinária', 'Convocamos todos para a assembleia no dia 15/08/2025, às 19h30, no Salão de Festas.', '2025-06-25'),
('09676800007', 'Novas Regras para a Piscina', 'A partir de 01/08/2025, será obrigatório o exame médico para uso da piscina.', '2025-06-20'),
('77804413009', 'Campanha de Coleta Seletiva', 'Participe da nossa nova campanha de coleta seletiva. Descarte seu lixo corretamente.', '2025-06-18'),
('09676800007', 'Vagas de Garagem para Visitantes', 'Lembramos que o uso das vagas de visitantes é por no máximo 24 horas.', '2025-06-15'),
('09676800007', 'Controle de Pragas', 'A dedetização ocorrerá em 12/07/2025. Mantenham animais de estimação em locais seguros.', '2025-06-10'),
('09676800007', 'Reforma da Quadra Poliesportiva', 'A quadra estará interditada para reforma entre os dias 20/07 e 10/08/2025.', '2025-06-05'),
('77804413009', 'Atualização Cadastral', 'Solicitamos que todos os moradores atualizem seus dados cadastrais na administração até 31/07/2025.', '2025-06-01');


INSERT INTO Area_comum (nome, horario_funcionamento, descricao, capacidade, regras) VALUES
('Salão de Festas', '09:00 - 23:00', 'Espaço amplo para eventos.', 150, 'Limpeza obrigatória após o uso.'),
('Churrasqueira A', '10:00 - 22:00', 'Churrasqueira próxima à piscina.', 25, 'Reserva com 48h de antecedência.'),
('Churrasqueira B', '10:00 - 22:00', 'Churrasqueira coberta.', 30, 'Reserva com 48h de antecedência.'),
('Piscina Adulto e Infantil', '08:00 - 20:00', 'Piscinas para lazer.', 80, 'Obrigatório exame médico e touca.'),
('Quadra Poliesportiva', '08:00 - 22:00', 'Quadra para futebol, basquete e vôlei.', 40, 'Uso por ordem de chegada ou reserva.'),
('Academia', '06:00 - 23:00', 'Equipamentos de musculação e aeróbicos.', 20, 'Obrigatório uso de toalha.'),
('Playground', '08:00 - 20:00', 'Área de lazer para crianças.', 30, 'Crianças devem estar acompanhadas.'),
('Salão de Jogos', '10:00 - 22:00', 'Mesa de sinuca, pebolim e pingue-pongue.', 15, 'Zelar pelos equipamentos.'),
('Brinquedoteca', '09:00 - 19:00', 'Espaço interno para crianças pequenas.', 15, 'Manter o local organizado.'),
('Sauna', '16:00 - 21:00', 'Sauna seca e a vapor.', 10, 'Proibido para menores de 18 anos.');

INSERT INTO Reserva (data_reserva, horario_inicio, horario_fim, status, id_area, cpf_morador) VALUES
('2025-07-26', '19:00', '23:00', 'Confirmada', 1, '80850784069'),
('2025-07-27', '12:00', '16:00', 'Confirmada', 2, '38190893068'),
('2025-08-02', '18:00', '19:00', 'Confirmada', 5, '56138812000'),
('2025-08-10', '18:00', '22:00', 'Pendente', 1, '61131772032'),
('2025-07-15', '10:00', '12:00', 'Confirmada', 4, '47415022017'),
('2025-07-20', '07:00', '08:00', 'Confirmada', 6, '94696612066'),
('2025-07-22', '20:00', '22:00', 'Confirmada', 8, '71493628050'),
('2025-08-15', '13:00', '17:00', 'Confirmada', 3, '82537491000'),
('2025-09-01', '19:00', '23:00', 'Cancelada', 1, '14759613082'),
('2025-09-05', '12:00', '16:00', 'Confirmada', 2, '47082946005');

INSERT INTO Visitas (cpf_morador, nome_visitante, cpf_visitante, data_visita, horario_entrada, horario_saida) VALUES
('80850784069', 'Mariana Costa', '55566677701', '2025-06-28', '20:00', '23:00'),
('38190893068', 'José Pereira', '55566677702', '2025-06-29', '13:00', '17:30'),
('56138812000', 'Fernanda Lima', '55566677703', '2025-07-01', '15:00', NULL),
('61131772032', 'Ricardo Alves', '55566677704', '2025-06-30', '19:00', '22:00'),
('47415022017', 'Beatriz Santos', '55566677705', '2025-07-01', '10:00', '11:00'),
('94696612066', 'Felipe Barros', NULL, '2025-06-27', '14:00', '18:00'),
('71493628050', 'Cláudia Melo', '55566677707', '2025-06-26', '11:00', '12:30'),
('82537491000', 'Sérgio Gomes', '55566677708', '2025-06-25', '09:00', NULL),
('14759613082', 'Lúcia Ribeiro', '55566677709', '2025-06-24', '16:00', '20:00'),
('47082946005', 'André Martins', '55566677710', '2025-06-23', '18:30', '21:30');

INSERT INTO Contrato (tipo_contrato, cpf_pessoa, arquivo) VALUES
('Contrato de Locação', '80850784069', '/docs/contratos/loc_80850784069.pdf'),
('Contrato de Compra e Venda', '38190893068', '/docs/contratos/comp_38190893068.pdf'),
('Contrato de Trabalho - CLT', '58193057047', '/docs/contratos/clt_58193057047.pdf'),
('Contrato de Prestação de Serviços', '77804413009', '/docs/contratos/serv_77804413009.pdf'),
('Termo de Posse - Síndico', '58193057047', '/docs/contratos/sind_58193057047.pdf'),
('Contrato de Trabalho - CLT', '46971835074', '/docs/contratos/clt_46971835074.pdf'),
('Contrato de Locação', '56138812000', '/docs/contratos/loc_56138812000.pdf'),
('Contrato de Locação', '61131772032', '/docs/contratos/loc_61131772032.pdf'),
('Contrato de Prestação de Serviços', '09676800007', '/docs/contratos/serv_09676800007.pdf'),
('Contrato de Locação', '14759613082', '/docs/contratos/loc_14759613082.pdf');

INSERT INTO Pagamento (cpf_morador, mes_ano, valor, status, comprovante, forma_pagamento, data_emissao, data_pagamento, vencimento) VALUES
('80850784069', '2025-06', 750.50, 'Pago', '/comprovantes/pag_01.pdf', 'Boleto', '2025-06-01', '2025-06-08', '2025-06-10'),
('38190893068', '2025-06', 820.00, 'Pago', '/comprovantes/pag_02.pdf', 'PIX', '2025-06-01', '2025-06-10', '2025-06-10'),
('56138812000', '2025-06', 750.50, 'Atrasado', NULL, NULL, '2025-06-01', NULL, '2025-06-10'),
('61131772032', '2025-06', 820.00, 'Pendente', NULL, NULL, '2025-06-01', NULL, '2025-06-10'),
('47415022017', '2025-06', 910.00, 'Pago', '/comprovantes/pag_05.pdf', 'Cartão de Crédito', '2025-06-01', '2025-06-09', '2025-06-10'),
('80850784069', '2025-07', 750.50, 'Pendente', NULL, NULL, '2025-07-01', NULL, '2025-07-10'),
('38190893068', '2025-07', 820.00, 'Pendente', NULL, NULL, '2025-07-01', NULL, '2025-07-10'),
('94696612066', '2025-06', 780.00, 'Pago', '/comprovantes/pag_06.pdf', 'Boleto', '2025-06-01', '2025-06-11', '2025-06-10'),
('71493628050', '2025-06', 850.00, 'Atrasado', NULL, NULL, '2025-06-01', NULL, '2025-06-10'),
('82537491000', '2025-06', 950.00, 'Pago', '/comprovantes/pag_08.pdf', 'PIX', '2025-06-01', '2025-06-05', '2025-06-10');

INSERT INTO Denuncias (cpf_pessoa, data_denuncia, descricao, status) VALUES
(NULL, '2025-06-29', 'Barulho excessivo vindo do apartamento A-201 após as 22h.', 'Em análise'),
('80850784069', '2025-06-30', 'Cachorro de um morador estava sem coleira na área do playground.', 'Recebida'),
(NULL, '2025-07-01', 'Veículo estacionado em vaga de visitante por mais de 24 horas.', 'Resolvida'),
('56138812000', '2025-06-28', 'Descarte de lixo fora do local apropriado no corredor do Bloco B.', 'Em análise'),
('69204168087', '2025-06-27', 'Visitante não identificado tentou entrar sem autorização.', 'Recebida'),
(NULL, '2025-06-26', 'Cheiro forte de cigarro vindo da unidade C-302.', 'Em análise'),
('47415022017', '2025-06-25', 'Crianças danificaram plantas no jardim principal.', 'Resolvida'),
(NULL, '2025-06-24', 'Uso da churrasqueira sem reserva prévia.', 'Recebida'),
('82537491000', '2025-06-23', 'Som alto na área da piscina fora do horário permitido.', 'Em análise'),
('58193057047', '2025-06-22', 'Morador utilizando a vaga de garagem de outra unidade sem permissão.', 'Resolvida');
