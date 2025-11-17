-- Inserir um usuário idoso (com prioridade)
INSERT INTO Usuario (nome, email, senha, telefone, endereco, data_nascimento, prioridade)
VALUES ('Carlos Silva', 'carlos.silva@email.com', 'hash_senha_segura', '(67) 91234-5678', 'Rua das Flores, 123 - Bairro Centro, Campo Grande-MS', '1950-05-20', TRUE);

-- Inserir dispositivos para o usuário
INSERT INTO Dispositivo (tipo, marca, modelo, estado, id_usuario)
VALUES 
('Smartphone', 'Samsung', 'Galaxy S8', 'Não liga', 1),
('Notebook', 'Dell', 'Inspiron 15', 'Lenta, sem bateria', 1);

-- Inserir uma cooperativa
INSERT INTO FacilidadeReciclagem (nome, endereco, certificacoes)
VALUES ('Recicla Tech MS', 'Av. Afonso Pena, 1000 - Centro, Campo Grande-MS', 'Certificação Ambiental ISO 14001');

-- Inserir um agendamento
INSERT INTO Agendamento (data, horario, status, id_usuario)
VALUES ('2025-10-05', '14:00:00', 'confirmado', 1);
