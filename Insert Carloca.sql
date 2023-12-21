-- INSERT tb_carro
INSERT INTO TB_CARRO (modelo, montadora, cor, versao, categoria, quilometragem, status_locacao_carro) VALUES
('Gol', 'Volkswagen', 'BRANCO', '1.0', 'HATCH', 15000, 1),
('Civic', 'Honda', 'PRATA', 'LXR', 'SEDAM', 20000, 1),
('Onix', 'Chevrolet', 'PRETO', 'LT', 'HATCH', 18000, 1),
('Corolla', 'Toyota', 'BRANCO', 'XLI', 'SEDAM', 22000, 0),
('Renegade', 'Jeep', 'PRATA', 'Longitude', 'SUV', 25000, 1),
('HB20', 'Hyundai', 'PRETO', 'Comfort', 'HATCH', 16000, 1),
('Creta', 'Hyundai', 'BRANCO', 'Attitude', 'SUV', 21000, 1),
('Fiesta', 'Ford', 'PRATA', 'SE', 'HATCH', 19000, 0),
('HR-V', 'Honda', 'PRETO', 'EXL', 'SUV', 23000, 0),
('Siena', 'Fiat', 'BRANCO', 'EL', 'SEDAM', 17000, 1);

-- INSERT tb_unidade
INSERT INTO TB_UNIDADE (nome_unidade, telefone_unidade, rua_unidade, bairro_unidade, cep_unidade, cidade_unidade, estado_unidade) VALUES
('Unidade Rio', '2123456789', 'Avenida Copacabana', 'Copacabana', '22000000', 'Rio de Janeiro', 'RJ'),
('Unidade SP', '1134567890', 'Avenida Paulista', 'Bela Vista', '01311000', 'São Paulo', 'SP'),
('Unidade BH', '3134567890', 'Rua da Bahia', 'Centro', '30160012', 'Belo Horizonte', 'BH'),
('Unidade Fortaleza', '8534567890', 'Avenida Beira Mar', 'Mucuripe', '60165121', 'Fortaleza', 'CE'),
('Unidade Recife', '8134567890', 'Rua do Recife', 'São José', '50020120', 'Recife', 'PE'),
('Unidade Centro', '2123456789', 'Rua do Centro', 'Centro', '20000000', 'Rio de Janeiro', 'RJ'),
('Unidade Morumbi', '1134567890', 'Avenida Morumbi', 'Morumbi', '05664000', 'São Paulo', 'SP'),
('Unidade Savassi', '3134567890', 'Rua Pernambuco', 'Savassi', '30130150', 'Belo Horizonte', 'BH'),
('Unidade Aldeota', '8534567890', 'Rua Barbosa de Freitas', 'Aldeota', '60170020', 'Fortaleza', 'CE'),
('Unidade Boa Viagem', '8134567890', 'Avenida Boa Viagem', 'Boa Viagem', '51020000', 'Recife', 'PE');


-- INSERT tb_cliente
INSERT INTO TB_CLIENTE (nome, telefone, email, rua, bairro, cep, cidade, estado, cnh, status_locacao_cliente)
VALUES
  ('João Silva', '81987654321', 'joao.silva@email.com', 'Rua do Forte, 89', 'São José', '12345678', 'Recife', 'PE', '1234567890', 1),
  ('Ana Santos', '1134567890', 'ana.santos@email.com', 'Avenida Mariana de Sousa Guerra', 'Jardim Vila Carrão', '23456789', 'São Paulo', 'SP', '0987654321', 1),
  ('Carlos Oliveira', '3133334444', 'carlos.oliveira@email.com', 'Rua Paraíba, 15', 'Savassi', '34567890', 'Belo Horizonte', 'MG', '5678901234', 1),
  ('Fernanda Costa', '8532112345', 'fernanda.costa@email.com', 'Rua Barata Ribeiro, 386', 'Copacabana', '45678901', 'Rio de Janeiro', 'RJ', '9876543210', 0),
  ('Ricardo Pereira', '1187654321', 'ricardo.pereira@email.com', 'Avenida Santos Dummont, 250', 'Aldeota', '56789012', 'Fortaleza', 'CE', '5432109876', 1),
  ('Empresa ABC Ltda', '81987654321', 'contato@empresaabc.com', 'Avenida Boa Viagem, 2910', 'Boa Viagem', '12345678', 'Recife', 'PE', 9876543210, 1),
  ('Comércio XYZ S/A', '1134567890', 'contato@comercioxyz.com', 'Rua dos Pinheiros, 1750 ', 'Pinheiros', '23456789', 'São Paulo', 'SP', 8765432109, 1),
  ('Indústria 123 Ltda', '3133334444', 'contato@industria123.com', 'Avenida Expedicionário Benvindo Belém de Lima, 734', 'São Luiz', '34567890', 'Belo Horizonte', 'MG', 7654321098, 0),
  ('Serviços LTDA', '8532112345', 'contato@servicosltda.com', 'Rua Barão da Torre, 62', 'Ipanema', '45678901', 'Rio de Janeiro', 'RJ', 6543210987, 0),
  ('Tech Solutions S/A', '1187654321', 'contato@techsolutions.com', 'Rua Pierre Luz, 1088', 'Jardim Guanabara', '60346195', 'Fortaleza', 'CE', 5432109876, 1);
  
-- INSERT tb_pessoa_fisica
INSERT INTO TB_PESSOA_FISICA (id_cliente, cpf)
VALUES
  (1, '12345678901'),
  (2, '98765432109'),
  (3, '23456789012'),
  (4, '34567890123'),
  (5, '56789012345');
  
-- INSERT tb_pessoa_juridica
INSERT INTO TB_PESSOA_JURIDICA (id_cliente, cnpj, nome_contato)
VALUES
  (6, '01234567890123', 'Fulano da Silva'),
  (7, '90123456789012', 'Ciclano Oliveira'),
  (8, '34567890123456', 'Beltrano Santos'),
  (9, '56789012345678', 'Maria Costa'),
  (10, '12345678901234', 'José Pereira');

-- INSERT tb_locacao
INSERT INTO TB_LOCACAO (data_retirada, data_devolucao, km_retirada, km_devolucao, id_carro, id_cliente, id_unidade_locacao, id_unidade_devolucao)
VALUES
('2023-12-05', '2023-12-15', 15000, 16500, 1, 1, 1, 2),
('2023-12-05', '2023-12-10', 20000, 23200, 2, 2, 2, 3),
('2023-12-15', '2023-12-20', 18000, 19000, 3, 3, 3, 4),
('2023-12-17',NULL, 22000,NULL, 4, 4, 4, NULL),
('2023-12-17', '2023-12-19', 25000, 26000, 5, 5, 5, 1),
('2023-12-18', '2023-12-21', 16000, 16800, 6, 6, 1, 2),
('2023-12-18', '2023-12-20', 21000, 23300, 7, 7, 2, 3),
('2023-12-19', NULL, 19000, NULL, 8, 8, 3, NULL),
('2023-12-20', NULL, 23000, NULL, 9, 9, 4, NULL),
('2023-12-20', '2023-12-21', 17000, 18200, 10, 10, 5, 1);
