USE `licitacoes_contratos` ;

-- Inserting data into Secretaria
INSERT INTO `Secretaria` VALUES
(1, 'Secretaria de Educação'),
(2, 'Secretaria de Saúde'),
(3, 'Secretaria de Cultura'),
(4, 'Secretaria de Esporte'),
(5, 'Secretaria de Meio Ambiente');

-- Inserting data into Funcionario
INSERT INTO `Funcionario` VALUES
('11111111111', 'João Silva', 'Analista', 'A', '2020-01-01', 1),
('22222222222', 'Maria Santos', 'Gerente', 'A', '2019-05-10', 2),
('33333333333', 'Pedro Oliveira', 'Assistente', 'A', '2021-02-15', 3),
('44444444444', 'Ana Souza', 'Coordenadora', 'A', '2018-07-20', 4),
('55555555555', 'Carlos Lima', 'Técnico', 'A', '2020-10-30', 5);

-- Inserting data into Empresa
INSERT INTO `Empresa` VALUES
('11111111000111', 'ABC Ltda', 'ABC', 'Material Escolar'),
('22222222000122', 'DEF Ltda', 'DEF', 'Medicamentos'),
('33333333000133', 'GHI Ltda', 'GHI', 'Livros'),
('44444444000144', 'JKL Ltda', 'JKL', 'Equipamentos Esportivos'),
('55555555000155', 'MNO Ltda', 'MNO', 'Reciclagem');

-- Inserting data into Licitacao
INSERT INTO `Licitacao` VALUES
(1, '2021-01-10', 'Aquisição de material escolar', 'C', 1),
(2, '2021-02-05', 'Aquisição de medicamentos', 'C', 2),
(3, '2021-03-01', 'Aquisição de livros', 'C', 3),
(4, '2021-03-15', 'Aquisição de equipamentos esportivos', 'C', 4),
(5, '2021-04-01', 'Aquisição de serviços de reciclagem', 'C', 5);

-- Inserting data into Contrato
INSERT INTO `Contrato`  VALUES
(1, '2021-01-20', 'Contrato com a empresa ABC para fornecimento de material escolar', 'A', 1),
(2, '2021-02-10', 'Contrato com a empresa DEF para fornecimento de medicamentos', 'A', 2),
(3, '2021-03-10', 'Contrato com a empresa GHI para fornecimento de livros', 'A', 3),
(4, '2021-03-20', 'Contrato com a empresa JKL para fornecimento de equipamentos esportivos', 'A', 4),
(5, '2021-04-10', 'Contrato com a empresa MNO para prestação de serviços de reciclagem', 'A', 5);

-- Inserting data into EmpresasContratadas
INSERT INTO `EmpresasContratadas` VALUES
(1, '11111111000111'),
(2, '22222222000122'),
(3, '33333333000133'),
(4, '44444444000144'),
(5, '55555555000155');

-- Inserting data into FuncionariosResponsaveisContrato
INSERT INTO `FuncionariosResponsaveisContrato`VALUES
('11111111111', 1),
('22222222222', 2),
('33333333333', 3),
('44444444444', 4),
('55555555555', 5);

select f.nomefuncionario,c.idcontrato from Funcionario f
join funcionariosresponsaveiscontrato R on f.cpf = r.funcionario_cpf
join contrato c on c.idcontrato = r.contrato_idcontrato;  