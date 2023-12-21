-- SELECTs GERAIS
-- SELECT TABELA CARRO
USE CARLOCA;
SELECT * FROM tb_carro;

-- SELECT TABELA UNIDADE
USE CARLOCA;
SELECT * FROM tb_unidade;

-- SELECT TABELA CLIENTE
USE CARLOCA;
SELECT * FROM tb_cliente;

-- SELECT TABELA PESSOA FÍSICA
USE CARLOCA;
SELECT * FROM tb_pessoa_fisica;

-- SELECT TABELA PESSOA JURÍDICA
USE CARLOCA;
SELECT * FROM tb_pessoa_juridica;

-- SELECT TABELA LOCAÇÃO
USE CARLOCA;
SELECT * FROM tb_locacao;

-- VALIDAÇÕES DO PROJETO:
-- Carro possui modelo, montadora, cor e versão:
USE CARLOCA;
Select modelo, montadora, cor, versao FROM tb_carro;

-- COR DO CARRO NÃO PODE SER DIFERENTE DE PRETO, PRATA OU BRANCO (UTILIZEI UM TIPO ENUM, ENTÃO NÃO ACEITA COR DIFERENTE DAS ESTABELECIDAS):
USE CARLOCA;
INSERT INTO TB_CARRO (modelo, montadora, cor, versao, categoria, quilometragem, status_locacao_carro) VALUES
('Gol', 'Volkswagen', 'vermelho', '1.0', 'HATCH', 15000, 1),
('Civic', 'Honda', 'cinza', 'LXR', 'SEDAM', 20000, 0),
('Onix', 'Chevrolet', 'verde', 'LT', 'HATCH', 18000, 1);

-- EXISTEM VÁRIAS CATEGORIAS DE VEÍCULO (PARA O PROJETO COLOQUEI APENAS 3 ATRAVÉS DO TIPO ENUM):
USE CARLOCA;
INSERT INTO TB_CARRO (modelo, montadora, cor, versao, categoria, quilometragem, status_locacao_carro) VALUE
('Gol', 'Volkswagen', 'branco', '1.0', 'TESTE', 15000, 1);

-- UM CLIENTE PODE ALUGAR UM CARRO SOMENTE NA MODALIDADE DIÁRIA (O CONTROLE É FEITO ATRAVÉS DE DATA DE RETIRADA E DATA DE DEVOLUÇÃO):
USE CARLOCA;
SELECT id_locacao, id_cliente, data_retirada, data_devolucao FROM tb_locacao;

-- ENQUANTO UM CARRO ESTIVER LOCADO, ELE NÃO PODE SER OFERTADO PARA OUTRO CLIENTE (SELECT PARA CARROS QUE NÃO ESTÃO COM LOCAÇÃO EM ANDAMENTO):
USE CARLOCA;
SELECT * FROM tb_carro WHERE status_locacao_carro = 1; -- Assim apenas carros sem locação em andamento podem ser alugados. 

-- UM CLIENTE NÃO PODE ALUGAR MAIS DE UM CARRO (SELECT PARA STATUS DE LOCAÇÃO DO CLIENTE):
USE CARLOCA;
SELECT * FROM tb_cliente WHERE status_locacao_cliente = 1; -- Assim apenas clientes sem locação em andamento podem alugar. Além disso o BD não permite a inserção de mais de um carro na mesma locação. 

-- O SISTEMA DEVE MANTER O HISTÓRICO DOS CLIENTES QUE LOCARAM DETERMINADO CARRO: 
USE CARLOCA;
SELECT
    LC.id_locacao,
    LC.data_retirada,
    LC.data_devolucao,
    LC.km_retirada,
    LC.km_devolucao,
    CL.nome AS nome_cliente,
    CL.telefone AS telefone_cliente,
    CL.email AS email_cliente,
    CL.rua AS rua_cliente,
    CL.bairro AS bairro_cliente,
    CL.cep AS cep_cliente,
    CL.cidade AS cidade_cliente,
    CL.estado AS estado_cliente,
    CL.cnh AS cnh_cliente
FROM TB_LOCACAO LC INNER JOIN TB_CLIENTE CL ON LC.id_cliente = CL.id_cliente WHERE LC.id_carro = 1; -- SUBSTITUIR 1 PELO ID DO CARRO QUE GOSTARIA DE VERIFICAR;

-- O SISTEMA DEVE MANTER O HISTÓRICO DE QTS KM O CLIENTE RODOU COM O CARRO BEM COMO A KM ATUAL DE CADA UM DOS CARROS;
USE CARLOCA;
SELECT
    c.nome AS nome_cliente,
    c.telefone AS telefone_cliente,
    c.email AS email_cliente,
    l.data_retirada,
    l.data_devolucao,
    ca.modelo AS modelo_carro,
    l.km_retirada AS km_inicial,
    l.km_devolucao AS km_apos_locacao
FROM
    TB_CLIENTE c
JOIN
    TB_LOCACAO l ON c.id_cliente = l.id_cliente
JOIN
    TB_CARRO ca ON l.id_carro = ca.id_carro;

-- EXISTEM VÁRIAS UNIDADES CARLOCA, O SISTEMA DEVE SABER ONDE O CARRO FOI LOCADO E ONDE FOI DEVOLVIDO
USE CARLOCA;
SELECT
    LC.id_locacao,
    LC.data_retirada,
    LC.data_devolucao,
    LC.km_retirada,
    LC.km_devolucao,
    UC.nome_unidade AS unidade_locacao,
    UD.nome_unidade AS unidade_devolucao,
    CL.nome AS nome_cliente
FROM
    TB_LOCACAO LC
    INNER JOIN TB_UNIDADE UC ON LC.id_unidade_locacao = UC.id_unidade
    LEFT JOIN TB_UNIDADE UD ON LC.id_unidade_devolucao = UD.id_unidade
    INNER JOIN TB_CLIENTE CL ON LC.id_cliente = CL.id_cliente;

