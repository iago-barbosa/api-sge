-- Populando tabela Alunos
INSERT INTO alunos (nome, sobrenome, cpf, senha, imagem) VALUES
('Lucas', 'Mendes', '12345678900', 'senhaLucas', ''),
('Mariana', 'Silva', '98765432100', 'senhaMariana', ''),
('Carlos', 'Santos', '45678912300', 'senhaCarlos', ''),
('Ana', 'Oliveira', '32165498700', 'senhaAna', '');

-- Populando tabela Área
INSERT INTO area (nome, descricao) VALUES
('Ciências Exatas', 'Área relacionada a disciplinas de exatas'),
('Ciências Humanas', 'Área relacionada a disciplinas humanas'),
('Ciências Biológicas', 'Área relacionada a biologia');

-- Populando tabela Disciplina
INSERT INTO disciplina (nome_disciplina, fk_id_area) VALUES
('Matemática', 1),
('Física', 1),
('História', 2),
('Biologia', 3);

-- Populando tabela Professores
INSERT INTO professor (nome, sobrenome, cpf, senha, imagem) VALUES
('Pedro', 'Almeida', '11111111111', 'senhaPedro', ''),
('Joana', 'Martins', '22222222222', 'senhaJoana', ''),
('Roberto', 'Gomes', '33333333333', 'senhaRoberto', '');

-- Populando tabela Professor-Disciplina
INSERT INTO professor_disciplina (fk_id_professor, fk_id_disciplina) VALUES
(1, 1), -- Pedro leciona Matemática
(1, 2), -- Pedro leciona Física
(2, 3), -- Joana leciona História
(3, 4); -- Roberto leciona Biologia

-- Populando tabela Turma
INSERT INTO turma (nome_turma, fk_id_professor_disciplina) VALUES
('Turma A - Matemática', 1), -- Pedro leciona para a Turma A em Matemática
('Turma A - Física', 2), -- Pedro leciona para a Turma A em Física
('Turma B - História', 3), -- Joana leciona para a Turma B em História
('Turma C - Biologia', 4); -- Roberto leciona para a Turma C em Biologia

-- Populando tabela Aluno-Turma
INSERT INTO aluno_turma (fk_id_aluno, fk_id_turma) VALUES
(1, 1), -- Lucas na Turma A - Matemática
(1, 2), -- Lucas na Turma A - Física
(2, 3), -- Mariana na Turma B - História
(3, 4), -- Carlos na Turma C - Biologia
(4, 1); -- Ana na Turma A - Matemática

-- Populando tabela Tarefas
INSERT INTO tarefa (nome_tarefa, descricao, data_entrega, fk_id_turma) VALUES
('Trabalho de Álgebra', 'Entregar lista de exercícios', '2024-10-15', 1), -- Matemática
('Experimento de Física', 'Relatório sobre experiência de gravidade', '2024-10-20', 2), -- Física
('Trabalho sobre Revolução Industrial', 'Pesquisa sobre revoluções', '2024-10-25', 3), -- História
('Relatório de Ecossistemas', 'Análise de um ecossistema local', '2024-11-01', 4); -- Biologia

-- Populando tabela Notas
INSERT INTO notas (nota, fk_id_aluno, fk_id_tarefa) VALUES
(8.5, 1, 1), -- Lucas - Trabalho de Álgebra
(7.0, 1, 2), -- Lucas - Experimento de Física
(9.0, 2, 3), -- Mariana - Trabalho sobre Revolução Industrial
(6.5, 3, 4), -- Carlos - Relatório de Ecossistemas
(9.0, 4, 1); -- Ana - Trabalho de Álgebra



-- Inserindo professores para as novas disciplinas
INSERT INTO professor (nome, sobrenome, cpf, senha, imagem) VALUES
('Onofre', 'Silva', '44444444444', 'senhaOnofre', ''),
('Roberval', 'Souza', '55555555555', 'senhaRoberval', ''),
('Lambarildo', 'Peixe', '66666666666', 'senhaLambarildo', ''),
('Fredegunda', 'Oliveira', '77777777777', 'senhaFredegunda', '');

-- Inserindo as disciplinas relacionadas
INSERT INTO disciplina (nome_disciplina, fk_id_area) VALUES
('Banco de Dados', 1), -- Banco de Dados faz parte de Ciências Exatas
('Modelagem de Dados', 1), -- Modelagem de Dados faz parte de Ciências Exatas
('Desenvolvimento de Sistemas', 1), -- Desenvolvimento de Sistemas faz parte de Ciências Exatas
('Programação de Aplicativos', 1); -- Programação de Aplicativos faz parte de Ciências Exatas

-- Relacionando professores com suas disciplinas
INSERT INTO professor_disciplina (fk_id_professor, fk_id_disciplina) VALUES
((SELECT id_professor FROM professor WHERE cpf = '44444444444'), (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Banco de Dados')),
((SELECT id_professor FROM professor WHERE cpf = '55555555555'), (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Modelagem de Dados')),
((SELECT id_professor FROM professor WHERE cpf = '66666666666'), (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Desenvolvimento de Sistemas')),
((SELECT id_professor FROM professor WHERE cpf = '77777777777'), (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Programação de Aplicativos'));

-- Inserindo a nova turma "3º Módulo Desenvolvimento de Sistemas"
INSERT INTO turma (nome_turma, fk_id_professor_disciplina) VALUES
('3º Módulo Desenvolvimento de Sistemas - Banco de Dados', (SELECT fk_id_professor FROM professor_disciplina WHERE fk_id_disciplina = (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Banco de Dados'))),
('3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados', (SELECT fk_id_professor FROM professor_disciplina WHERE fk_id_disciplina = (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Modelagem de Dados'))),
('3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas', (SELECT fk_id_professor FROM professor_disciplina WHERE fk_id_disciplina = (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Desenvolvimento de Sistemas'))),
('3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos', (SELECT fk_id_professor FROM professor_disciplina WHERE fk_id_disciplina = (SELECT id_disciplina FROM disciplina WHERE nome_disciplina = 'Programação de Aplicativos')));



-- Inserir 20 alunos
INSERT INTO alunos (nome, sobrenome, cpf, senha, imagem) VALUES
('Lucas', 'Pereira', '11111111111', 'senhaLucas', 'url_imagem_lucas'),
('Mariana', 'Souza', '22222222222', 'senhaMariana', 'url_imagem_mariana'),
('João', 'Silva', '33333333333', 'senhaJoao', 'url_imagem_joao'),
('Ana', 'Costa', '44444444444', 'senhaAna', 'url_imagem_ana'),
('Carlos', 'Mendes', '55555555555', 'senhaCarlos', 'url_imagem_carlos'),
('Beatriz', 'Almeida', '66666666666', 'senhaBeatriz', 'url_imagem_beatriz'),
('Pedro', 'Santos', '77777777777', 'senhaPedro', 'url_imagem_pedro'),
('Julia', 'Lima', '88888888888', 'senhaJulia', 'url_imagem_julia'),
('Renato', 'Gomes', '99999999999', 'senhaRenato', 'url_imagem_renato'),
('Fernanda', 'Ferreira', '10101010101', 'senhaFernanda', 'url_imagem_fernanda'),
('Ricardo', 'Nunes', '20202020202', 'senhaRicardo', 'url_imagem_ricardo'),
('Paula', 'Oliveira', '30303030303', 'senhaPaula', 'url_imagem_paula'),
('Gabriel', 'Martins', '40404040404', 'senhaGabriel', 'url_imagem_gabriel'),
('Isabela', 'Barros', '50505050505', 'senhaIsabela', 'url_imagem_isabela'),
('Leonardo', 'Azevedo', '60606060606', 'senhaLeonardo', 'url_imagem_leonardo'),
('Camila', 'Rocha', '70707070707', 'senhaCamila', 'url_imagem_camila'),
('Rafael', 'Cardoso', '80808080808', 'senhaRafael', 'url_imagem_rafael'),
('Larissa', 'Silveira', '90909090909', 'senhaLarissa', 'url_imagem_larissa'),
('Thiago', 'Monteiro', '12121212121', 'senhaThiago', 'url_imagem_thiago'),
('Sofia', 'Moreira', '13131313131', 'senhaSofia', 'url_imagem_sofia');


-- Associar alunos à turma 3º Módulo Desenvolvimento de Sistemas
INSERT INTO aluno_turma (fk_id_aluno, fk_id_turma) VALUES
((SELECT id_alunos FROM alunos WHERE cpf = '11111111111'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '22222222222'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '33333333333'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '44444444444'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '55555555555'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '66666666666'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '77777777777'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '88888888888'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '99999999999'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '10101010101'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '20202020202'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '30303030303'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '40404040404'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '50505050505'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '60606060606'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '70707070707'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '80808080808'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '90909090909'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '12121212121'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '13131313131'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Banco de Dados')),


((SELECT id_alunos FROM alunos WHERE cpf = '11111111111'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '22222222222'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '33333333333'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '44444444444'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '55555555555'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '66666666666'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '77777777777'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '88888888888'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '99999999999'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '10101010101'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '20202020202'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '30303030303'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '40404040404'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '50505050505'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '60606060606'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '70707070707'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '80808080808'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '90909090909'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '12121212121'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),
((SELECT id_alunos FROM alunos WHERE cpf = '13131313131'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Modelagem de Dados')),



((SELECT id_alunos FROM alunos WHERE cpf = '11111111111'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '22222222222'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '33333333333'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '44444444444'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '55555555555'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '66666666666'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '77777777777'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '88888888888'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '99999999999'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '10101010101'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '20202020202'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '30303030303'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '40404040404'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '50505050505'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '60606060606'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '70707070707'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '80808080808'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '90909090909'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '12121212121'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),
((SELECT id_alunos FROM alunos WHERE cpf = '13131313131'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Desenvolvimento de Sistemas')),



((SELECT id_alunos FROM alunos WHERE cpf = '11111111111'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '22222222222'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '33333333333'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '44444444444'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '55555555555'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '66666666666'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '77777777777'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '88888888888'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '99999999999'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '10101010101'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '20202020202'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '30303030303'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '40404040404'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '50505050505'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '60606060606'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '70707070707'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '80808080808'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '90909090909'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '12121212121'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos')),
((SELECT id_alunos FROM alunos WHERE cpf = '13131313131'), (SELECT id_turma FROM turma WHERE nome_turma = '3º Módulo Desenvolvimento de Sistemas - Programação de Aplicativos'));

