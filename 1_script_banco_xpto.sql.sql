-- 1. Criar e Selecionar o Banco de Dados
CREATE DATABASE IF NOT EXISTS xpto_investimentos;
USE xpto_investimentos;

-- 2. Tabela Cliente (Entidade Base)
CREATE TABLE Cliente (
    CPF CHAR(14) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (CPF)
);

-- 3. Tabela Telefone (1:N com Cliente - Composição)
CREATE TABLE Telefone (
    ID_Telefone INT AUTO_INCREMENT,
    CPF_Cliente CHAR(14) NOT NULL,
    Numero VARCHAR(20) NOT NULL,
    Tipo VARCHAR(20),
    PRIMARY KEY (ID_Telefone),
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE
);

-- 4. Tabela Email (1:N com Cliente - Composição)
CREATE TABLE Email (
    ID_Email INT AUTO_INCREMENT,
    CPF_Cliente CHAR(14) NOT NULL,
    Endereco_Email VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Email),
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE
);

-- 5. Tabela Conta Bancária (1:N com Cliente)
CREATE TABLE Conta_Bancaria (
    ID_Conta INT AUTO_INCREMENT,
    CPF_Cliente CHAR(14) NOT NULL,
    Banco VARCHAR(50) NOT NULL,
    Agencia VARCHAR(10) NOT NULL,
    Conta VARCHAR(20) NOT NULL,
    Saldo DECIMAL(15,2),
    Data_Saldo DATE,
    PRIMARY KEY (ID_Conta),
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE
);

-- 6. Tabela Investimento (1:N com Cliente)
CREATE TABLE Investimento (
    ID_Investimento INT AUTO_INCREMENT,
    CPF_Cliente CHAR(14) NOT NULL,
    Tipo_Investimento VARCHAR(50) NOT NULL,
    Valor_Investido DECIMAL(15,2),
    PRIMARY KEY (ID_Investimento),
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE
);

-- 7. Tabela Funcionário (Entidade Base)
CREATE TABLE Funcionario (
    ID_Funcionario INT AUTO_INCREMENT,
    Nome_Funcionario VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Funcionario)
);

-- 8. Tabela Contato (Entidade Associativa N:M entre Cliente e Funcionário)
CREATE TABLE Contato (
    ID_Contato INT AUTO_INCREMENT,
    CPF_Cliente CHAR(14) NOT NULL,
    ID_Funcionario INT NOT NULL,
    Forma_Contato VARCHAR(20),
    Data_Contato DATE,
    Produto_Assunto VARCHAR(100),
    PRIMARY KEY (ID_Contato),
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario) ON DELETE RESTRICT
);