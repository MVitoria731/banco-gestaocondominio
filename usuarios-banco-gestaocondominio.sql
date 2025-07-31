CREATE USER admin_barnett WITH PASSWORD 'jimbech123';
GRANT ALL ON DATABASE gestaocondominio TO admin_barnett;

CREATE USER admin_lupin WITH PASSWORD 'lupingra456';
GRANT ALL ON DATABASE gestaocondominio TO admin_lupin; 

CREATE USER morador_asserman WITH PASSWORD 'perolasm';
GRANT SELECT ON Pessoa TO morador_asserman;
GRANT SELECT ON Unidade TO morador_asserman;
GRANT SELECT ON Pagamento TO morador_asserman;
GRANT SELECT ON Area_comum TO morador_asserman;
GRANT SELECT ON Solicitacao_manutencao TO morador_asserman;

CREATE USER func_bsouza WITH PASSWORD '11b2a3tr'
GRANT SELECT, INSERT, UPDATE ON Solicitacao_manutencao TO func_bsouza;
GRANT SELECT, INSERT, UPDATE ON Entrega TO func_bsouza;
