CREATE DATABASE aluguel_veiculos;
USE aluguel_veiculos;

CREATE TABLE cliente (
    nome CHAR(30)  NOT NULL,
    cpf CHAR(11) PRIMARY KEY,
    cnh CHAR(10) UNIQUE
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario CHAR(30) NOT NULL,
	cargo VARCHAR(50)
);



CREATE TABLE veiculo (
    marca CHAR(30) NOT NULL,
    placa CHAR(30) UNIQUE,
    ano INT NOT NULL,
    cor CHAR(30) NOT NULL,
    modelo CHAR(30) NOT NULL,
    id_veiculo INT PRIMARY KEY
);

CREATE TABLE movimento (
    id_movimento INT PRIMARY KEY,
    id_funcionario INT,
    id_veiculo INT,
    cpf VARCHAR(11) UNIQUE,
    tipo_movimento CHAR(30) NOT NULL,
    data DATE,
    valor_aluguel DECIMAL(10, 2) NOT NULL,
    fk_cliente_cpf CHAR(11),
    fk_veiculo_id_veiculo INT,
    fk_funcionario_id_funcionario INT
);

CREATE TABLE oficina (
    id_servico INT PRIMARY KEY,
    tipo_servico CHAR(30) NOT NULL,
    data DATE,
    id_funcionario INT,
    fk_funcionario_id_funcionario INT,
    fk_veiculo_id_veiculo INT
);
 
ALTER TABLE movimento ADD CONSTRAINT FK_movimento_2
    FOREIGN KEY (fk_cliente_cpf)
    REFERENCES cliente (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE movimento ADD CONSTRAINT FK_movimento_3
    FOREIGN KEY (fk_veiculo_id_veiculo)
    REFERENCES veiculo (id_veiculo)
    ON DELETE CASCADE;
 
ALTER TABLE movimento ADD CONSTRAINT FK_movimento_4
    FOREIGN KEY (fk_funcionario_id_funcionario)
    REFERENCES funcionario (id_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE oficina ADD CONSTRAINT FK_oficiona_2
    FOREIGN KEY (fk_funcionario_id_funcionario)
    REFERENCES funcionario (id_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE oficiona ADD CONSTRAINT FK_oficiona_3
    FOREIGN KEY (fk_veiculo_id_veiculo)
    REFERENCES veiculo (id_veiculo)
    ON DELETE CASCADE;

ALTER TABLE funcionario MODIFY COLUMN cargo VARCHAR(50);
ALTER TABLE movimento MODIFY COLUMN cpf VARCHAR(50);
ALTER TABLE movimento MODIFY COLUMN tipo_movimento VARCHAR(50);
ALTER TABLE movimento MODIFY COLUMN fk_cliente_cpf VARCHAR(50);

-- Inseção dados da tabela cliente
INSERT INTO cliente (nome, cpf, cnh)
VALUES
    ('João da Silva', '12345678901', '1234567890'),
    ('Maria Oliveira', '23456789012', '2345678901'),
    ('Pedro Santos', '34567890123', '3456789012'),
    ('Ana Souza', '45678901234', '4567890123'),
    ('Carlos Pereira', '56789012345', '5678901234');

-- Inseção dados da tabela funcionario
INSERT INTO funcionario (id_funcionario, nome_funcionario, cargo)
VALUES
    (1, 'João Silva', 'Gerente'),
    (2, 'Maria Santos', 'Assistente de Vendas'),
    (3, 'Carlos Oliveira', 'Analista de Marketing'),
    (4, 'Ana Sousa', 'Desenvolvedor'),
    (5, 'Lucas Pereira', 'Atendimento ao Cliente');

-- Inseção dados da tabela veiculo
-- Inserir o primeiro veículo
INSERT INTO veiculo (marca, placa, ano, cor, modelo, id_veiculo)
VALUES ('Toyota', 'ABC-123', 2022, 'Azul', 'Corolla', 1);

-- Inserir o segundo veículo
INSERT INTO veiculo (marca, placa, ano, cor, modelo, id_veiculo)
VALUES ('Ford', 'XYZ-789', 2021, 'Vermelho', 'Mustang', 2);

-- Inserir o terceiro veículo
INSERT INTO veiculo (marca, placa, ano, cor, modelo, id_veiculo)
VALUES ('Honda', 'DEF-456', 2020, 'Prata', 'Civic', 3);

-- Inserir o quarto veículo
INSERT INTO veiculo (marca, placa, ano, cor, modelo, id_veiculo)
VALUES ('Chevrolet', 'GHI-789', 2022, 'Preto', 'Cruze', 4);

-- Inserir o quinto veículo
INSERT INTO veiculo (marca, placa, ano, cor, modelo, id_veiculo)
VALUES ('Volkswagen', 'JKL-012', 2021, 'Branco', 'Golf', 5);

--- Inserção do primeiro movimento
INSERT INTO movimento (id_movimento, id_funcionario, id_veiculo, cpf, tipo_movimento, data, valor_aluguel, fk_cliente_cpf, fk_veiculo_id_veiculo, fk_funcionario_id_funcionario)
VALUES (1, 101, 201, '12345678901', 'Aluguel', '2023-09-10', 150.00, '98765432101', 201, 101);

-- Inserção do segundo movimento
INSERT INTO movimento (id_movimento, id_funcionario, id_veiculo, cpf, tipo_movimento, data, valor_aluguel, fk_cliente_cpf, fk_veiculo_id_veiculo, fk_funcionario_id_funcionario)
VALUES (2, 102, 202, '23456789012', 'Devolução', '2023-09-15', 50.00, '87654321012', 202, 102);

-- Inserção do terceiro movimento
INSERT INTO movimento (id_movimento, id_funcionario, id_veiculo, cpf, tipo_movimento, data, valor_aluguel, fk_cliente_cpf, fk_veiculo_id_veiculo, fk_funcionario_id_funcionario)
VALUES (3, 103, 203, '34567890123', 'Aluguel', '2023-09-20', 200.00, '76543210923', 203, 103);

-- Inserção do quarto movimento
INSERT INTO movimento (id_movimento, id_funcionario, id_veiculo, cpf, tipo_movimento, data, valor_aluguel, fk_cliente_cpf, fk_veiculo_id_veiculo, fk_funcionario_id_funcionario)
VALUES (4, 104, 204, '45678901234', 'Devolução', '2023-09-25', 70.00, '65432109834', 204, 104);

-- Inserção do quinto movimento
INSERT INTO movimento (id_movimento, id_funcionario, id_veiculo, cpf, tipo_movimento, data, valor_aluguel, fk_cliente_cpf, fk_veiculo_id_veiculo, fk_funcionario_id_funcionario)
VALUES (5, 105, 205, '56789012345', 'Aluguel', '2023-09-30', 180.00, '54321098745', 205, 105);

-- Inseção dados da tabela oficina
INSERT INTO oficina (id_servico, tipo_servico, data, id_funcionario, fk_funcionario_id_funcionario, fk_veiculo_id_veiculo)
VALUES
    (1, 'Troca de óleo', '2023-09-09', 101, 101, 201),
    (2, 'Reparo de freios', '2023-09-10', 102, 102, 202),
    (3, 'Alinhamento e balanceamento', '2023-09-11', 103, 103, 203),
    (4, 'Substituição de bateria', '2023-09-12', 104, 104, 204),
    (5, 'Troca de pneus', '2023-09-13', 105, 105, 205);

-- Usuários e seus repectivos privilégios
CREATE USER 'joao'@'localhost' IDENTIFIED BY '123';
GRANT ALL ON movimento TO 'joao'@'localhost';

CREATE USER 'ana'@'localhost' IDENTIFIED BY '456';
GRANT SELECT, INSERT ON funcionario TO 'ana'@'localhost';

CREATE USER 'maria'@'localhost' IDENTIFIED BY '789';
GRANT UPDATE, DELETE ON cliente TO 'maria'@'localhost';

CREATE USER 'carlos'@'localhost' IDENTIFIED BY '123';
GRANT ALTER ON oficina TO 'carlos'@'localhost';

CREATE USER 'lucas'@'localhost' IDENTIFIED BY '456';
GRANT DROP ON veiculo TO 'lucas'@'localhost';