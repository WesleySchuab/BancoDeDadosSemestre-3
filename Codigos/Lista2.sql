-- Cria o banco de Dados Ou habilita seu contexto 
IF DB_ID (N'LojaIFSP') IS NULL
    CREATE DATABASE LojaIFSP;
ELSE
    USE LojaIFSP;
GO
-- Exibir a data de criação e nome das tabelas
SELECT create_date AS 'Data de Criação',
    name AS 'Nome da Tabela'
FROM Sys.tables 

-- Cria tabela para armazenar os clientes
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY ,
    Nome  VARCHAR ( 50 ) NOT NULL,
    Sexo CHAR ( 1 ) NULL,
    Idade INT CHECK ( Idade > 18 ) NOT NULL,
    CPF CHAR ( 11 ) UNIQUE NOT NULL ,
    Email VARCHAR ( 200 ) DEFAULT 'meu@email.com' NOT NULL
);
GO

-- Verifica a inserção dos registros com restrições
-- OK, registros inseridos normalmente 
INSERT INTO CLIENTES VALUES
    (1, 'Ana Cristina', 'F', 20, '11111111111',
'ana@gmail.com');
GO

-- Erro devido ao valor repetido da chave primaria
INSERT INTO CLIENTES VALUES 
    (1, 'Marcos Paulo', 'M', 45, '22222222222',
'marcos@gmail.com');
GO

-- Erro no azure
--Msg 2627, Level 14, State 1, Line 1
--Violation of PRIMARY KEY constraint 'PK__CLIENTES__3214EC277C3456C8'. Cannot insert duplicate key in object 'dbo.CLIENTES'. The duplicate key value --is (1).

-- Erro devido a o valor da idade ser menor que 18
INSERT INTO CLIENTES VALUES
    (3, 'Andre Luis', 'M', 15, '33333333333',
'andre@gmail.com');
GO

--Msg 547, Level 16, State 0, Line 1
--The INSERT statement conflicted with the CHECK constraint "CK__CLIENTES__Idade__38996AB5". The conflict occurred in database "LojaIFSP", table "dbo.--CLIENTES", column 'Idade'.

-- OK, registros inseridos normalmente 
INSERT INTO CLIENTES VALUES
    (4, 'Maria Clara', 'M', 22, '44444444444',
'maria@gmail.com');
GO