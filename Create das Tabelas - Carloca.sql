CREATE DATABASE CARLOCA;
USE CARLOCA; 

CREATE TABLE TB_CARRO (
                id_carro INT AUTO_INCREMENT NOT NULL,
                modelo VARCHAR(30) NOT NULL,
                montadora VARCHAR(20) NOT NULL,
                cor ENUM('PRETO', 'BRANCO', 'PRATA') NOT NULL,
                versao VARCHAR(25) NOT NULL,
                categoria ENUM('HATCH', 'SEDAM', 'SUV') NOT NULL,
                quilometragem INT NOT NULL,
                status_locacao_carro BIT NOT NULL COMMENT '0 para locado 1 para disponível',
                PRIMARY KEY (id_carro)
);

CREATE TABLE TB_UNIDADE (
                id_unidade INT AUTO_INCREMENT NOT NULL,
                nome_unidade VARCHAR(50) NOT NULL,
                telefone_unidade VARCHAR(11) NOT NULL COMMENT 'apenas dd e telefone, sem caracteres especiais',
                rua_unidade VARCHAR(50) NOT NULL COMMENT 'Nome da rua, número e complemento',
                bairro_unidade VARCHAR(50) NOT NULL,
                cep_unidade VARCHAR(8) NOT NULL COMMENT 'apenas números',
                cidade_unidade VARCHAR(50) NOT NULL,
                estado_unidade VARCHAR(2) NOT NULL COMMENT 'Apenas a Sigla',
                PRIMARY KEY (id_unidade)
);


CREATE TABLE TB_CLIENTE (
                id_cliente INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                telefone VARCHAR(11) NOT NULL COMMENT 'apenas dd e telefone, sem caracteres especiais',
                email VARCHAR(50) NOT NULL,
                rua VARCHAR(60) NOT NULL COMMENT 'Nome da rua, número e complemento',
                bairro VARCHAR(50) NOT NULL,
                cep VARCHAR(8) NOT NULL COMMENT 'apenas números',
                cidade VARCHAR(50) NOT NULL,
                estado VARCHAR(2) NOT NULL COMMENT 'Apenas a Sigla',
                cnh VARCHAR(10) NOT NULL,
                status_locacao_cliente BIT NOT NULL COMMENT '0 para ALUGUEL EM ANDAMENTO 1 para SEM ALUGUEL EM ANDAMENTO',
                PRIMARY KEY (id_cliente)
);

CREATE TABLE TB_LOCACAO (
                id_locacao INT AUTO_INCREMENT NOT NULL,
                data_retirada DATE NOT NULL,
                data_devolucao DATE DEFAULT NULL COMMENT 'Caso esteja vazio, a locação ainda não foi concluída',
                km_retirada INT NOT NULL,
                km_devolucao INT DEFAULT NULL COMMENT 'Caso esteja vazio, a locação ainda não foi concluída',
                id_carro INT NOT NULL,
                id_cliente INT NOT NULL,
                id_unidade_locacao INT NOT NULL,
                id_unidade_devolucao INT DEFAULT NULL COMMENT 'Caso esteja vazio, a locação ainda não foi concluída',
                PRIMARY KEY (id_locacao),
                CONSTRAINT tb_carro_tb_locacao_fk FOREIGN KEY (id_carro) REFERENCES TB_CARRO (id_carro) ON DELETE NO ACTION ON UPDATE NO ACTION,
                CONSTRAINT tb_unidade_tb_locacao_fk FOREIGN KEY (id_unidade_locacao) REFERENCES TB_UNIDADE (id_unidade) ON DELETE NO ACTION ON UPDATE NO ACTION,
                CONSTRAINT tb_unidade_tb_locacao_fk1 FOREIGN KEY (id_unidade_devolucao) REFERENCES TB_UNIDADE (id_unidade) ON DELETE NO ACTION ON UPDATE NO ACTION,
                CONSTRAINT tb_cliente_tb_locacao_fk FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTE (id_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE TB_PESSOA_FISICA (
                id_cliente INT NOT NULL,
                cpf VARCHAR(11) NOT NULL,
                PRIMARY KEY (id_cliente),
                CONSTRAINT tb_cliente_tb_pessoa_fisica_fk FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTE (id_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE TB_PESSOA_JURIDICA (
                id_cliente INT NOT NULL,
                cnpj VARCHAR(14) NOT NULL,
                nome_contato VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_cliente),
                CONSTRAINT tb_cliente_tb_pessoa_juridica_fk FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTE (id_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION
);