-- Consulta 1: Listar todos os agendamentos confirmados com nome do usuário
SELECT u.nome, a.data, a.horario 
FROM Agendamento a
JOIN Usuario u ON a.id_usuario = u.id_usuario
WHERE a.status = 'confirmado';

-- Consulta 2: Contar dispositivos por tipo
SELECT tipo, COUNT(*) as quantidade
FROM Dispositivo
GROUP BY tipo;

-- Consulta 3: Agendamentos prioritários (idosos)
SELECT u.nome, a.data, a.horario
FROM Agendamento a
JOIN Usuario u ON a.id_usuario = u.id_usuario
WHERE u.prioridade = TRUE;
