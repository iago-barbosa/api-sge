CREATE DATABASE IF NOT EXISTS `projeto_sge` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `projeto_sge`;

-- Tabela Alunos
CREATE TABLE alunos (
  id_alunos INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  cpf VARCHAR(45) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  imagem VARCHAR(255),
  PRIMARY KEY (id_alunos)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Áreas
CREATE TABLE area (
  id_area INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT NOT NULL,
  PRIMARY KEY (id_area)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Disciplinas
CREATE TABLE disciplina (
  id_disciplina INT NOT NULL AUTO_INCREMENT,
  nome_disciplina VARCHAR(100) NOT NULL,
  fk_id_area INT NOT NULL,
  PRIMARY KEY (id_disciplina),
  FOREIGN KEY (fk_id_area) REFERENCES area(id_area)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Professores
CREATE TABLE professor (
  id_professor INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  imagem VARCHAR(255),
  PRIMARY KEY (id_professor),
  UNIQUE KEY (cpf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Professor-Disciplina (Associa professores às disciplinas que lecionam)
CREATE TABLE professor_disciplina (
  id_professor_disciplina INT NOT NULL AUTO_INCREMENT,
  fk_id_professor INT NOT NULL,
  fk_id_disciplina INT NOT NULL,
  PRIMARY KEY (id_professor_disciplina),
  FOREIGN KEY (fk_id_professor) REFERENCES professor(id_professor),
  FOREIGN KEY (fk_id_disciplina) REFERENCES disciplina(id_disciplina)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Turmas (Associa uma turma à disciplina e ao professor)
CREATE TABLE turma (
  id_turma INT NOT NULL AUTO_INCREMENT,
  nome_turma VARCHAR(100) NOT NULL,
  fk_id_professor_disciplina INT NOT NULL,
  PRIMARY KEY (id_turma),
  FOREIGN KEY (fk_id_professor_disciplina) REFERENCES professor_disciplina(id_professor_disciplina)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Aluno-Turma (Associa alunos às turmas)
CREATE TABLE aluno_turma (
  fk_id_aluno INT NOT NULL,
  fk_id_turma INT NOT NULL,
  PRIMARY KEY (fk_id_aluno, fk_id_turma),
  FOREIGN KEY (fk_id_aluno) REFERENCES alunos(id_alunos),
  FOREIGN KEY (fk_id_turma) REFERENCES turma(id_turma)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Tarefas (Associa tarefas a uma turma e uma disciplina específica)
CREATE TABLE tarefa (
  id_tarefa INT NOT NULL AUTO_INCREMENT,
  nome_tarefa VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  data_entrega DATE NOT NULL,
  fk_id_turma INT NOT NULL,
  PRIMARY KEY (id_tarefa),
  FOREIGN KEY (fk_id_turma) REFERENCES turma(id_turma)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Notas (Associa notas aos alunos para cada tarefa)
CREATE TABLE notas (
  id_notas INT NOT NULL AUTO_INCREMENT,
  nota FLOAT NOT NULL,
  fk_id_aluno INT NOT NULL,
  fk_id_tarefa INT NOT NULL,
  PRIMARY KEY (id_notas),
  FOREIGN KEY (fk_id_aluno) REFERENCES alunos(id_alunos),
  FOREIGN KEY (fk_id_tarefa) REFERENCES tarefa(id_tarefa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
