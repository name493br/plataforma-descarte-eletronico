-- Criar o banco de dados
CREATE DATABASE plataforma_descarte_eletronico;
USE plataforma_descarte_eletronico;

-- Tabela Usuario
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL, -- Armazenar hash
    telefone VARCHAR(20),
    endereco TEXT NOT NULL,
    data_nascimento DATE,
    prioridade BOOLEAN DEFAULT FALSE -- Para idosos
);

-- Tabela Dispositivo
CREATE TABLE Dispositivo (
    id_dispositivo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    estado VARCHAR(20),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela FacilidadeReciclagem (Cooperativas)
CREATE TABLE FacilidadeReciclagem (
    id_facilidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    certificacoes TEXT
);

-- Tabela Agendamento
CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'pendente',
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Tabela Coleta
CREATE TABLE Coleta (
    id_coleta INT AUTO_INCREMENT PRIMARY KEY,
    data_processamento DATE,
    certificado_url VARCHAR(255),
    id_agendamento INT UNIQUE,
    id_facilidade INT,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento),
    FOREIGN KEY (id_facilidade) REFERENCES FacilidadeReciclagem(id_facilidade)
);

-- Tabela Localizacao (para rastreamento)
CREATE TABLE Localizacao (
    id_localizacao INT AUTO_INCREMENT PRIMARY KEY,
    coordenadas VARCHAR(50), -- Poderia ser GEOMETRY no MySQL
    id_coleta INT,
    FOREIGN KEY (id_coleta) REFERENCES Coleta(id_coleta)
);
