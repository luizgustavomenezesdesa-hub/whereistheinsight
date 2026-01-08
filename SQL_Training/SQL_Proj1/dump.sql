INSERT INTO Cliente (nome, telefone, email) VALUES
('Lucas Ferreira', '8199999-1111', 'lucas@email.com'),
('Maria Silva', '8198888-2222', 'maria@email.com');

INSERT INTO Veiculo (modelo, placa, ano, cliente_id) VALUES
('Corolla', 'ABC-1234', 2018, 1),
('Fiesta', 'DEF-5678', 2015, 2);

INSERT INTO OrdemServico (data_emissao, data_conclusao, status, veiculo_id) VALUES
('2025-01-10', NULL, 'ABERTA', 1),
('2025-01-08', '2025-01-12', 'CONCLUÍDA', 2);

INSERT INTO Servico (descricao, valor_padrao) VALUES
('Troca de óleo', 120.00),
('Alinhamento', 80.00),
('Revisão completa', 350.00);

INSERT INTO Peca (nome, preco_unitario) VALUES
('Filtro de óleo', 30.00),
('Pneu', 450.00),
('Pastilha de freio', 150.00);

INSERT INTO OS_Servico VALUES
(1, 1, 1, 120.00),
(2, 3, 1, 350.00);

INSERT INTO OS_Peca VALUES
(1, 1, 1, 30.00),
(2, 2, 2, 450.00),
(2, 3, 1, 150.00);
