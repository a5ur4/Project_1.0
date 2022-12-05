# Todos os comandos abaixo estão na ordem de serem executados.

CREATE DATABASE Escola;
USE Escola;

# Utilize a seção abaixo somente se necessário

DROP TABLE Medias;
DROP TABLE Materias;
DROP TABLE Professor;
DROP TABLE Aluno;
DROP TABLE Turmas;

DROP DATABASE Escola;

# Veja cada uma das tabelas

SELECT * FROM Aluno;
SELECT * FROM Professor;
SELECT * FROM Turmas;
SELECT * FROM Materias;
SELECT * FROM Medias;

# Turmas pré-definidas no modelo 'Serie', 'Curso' e 'Turma'

INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('1°', 'TDS', 'A');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('1°', 'TDS', 'B');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('1°', 'MKT', 'A');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('1°', 'MKT', 'B');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('2°', 'TDS', 'A');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('2°', 'TDS', 'B');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('2°', 'MKT', 'A');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('2°', 'MKT', 'B');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('3°', 'TDS', 'A');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('3°', 'TDS', 'B');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('3°', 'MKT', 'A');
INSERT INTO Turmas (Serie, Curso, Turma) VALUES ('3°', 'MKT', 'B');

# Seção abaixo para inserir valores

INSERT INTO 
	Aluno (Nome, ID_Turma, Mensalidade) 
VALUES ();

INSERT INTO 
	Professor (Nome, Materia, Salario, CNPJ) 
VALUES ();

INSERT INTO 
	Materias (Nome_Materia, Aluno_Matricula, Professor_CNPJ, ID_Turma) 
VALUES ();

INSERT INTO 
	Medias (Aluno_Nome, Aluno_Matricula, Media_1°_Unidade, Media_2°_Unidade, Media_3°_Unidade, Media_4°_Unidade, Media_Anual) 
VALUES ();

/*
	Por último e mais importante as tabelas abaixo
    
	OBS: VAI aparecer um triângulo amarelo ao criar as tabelas Aluno e Professor, isso acontece porque
	elas possuem uma restrinção de float que futuramente vai ser descontinuada do MySQL, não precisa se preocupar por enquanto
*/

CREATE TABLE Turmas(
	ID
		SMALLINT
		PRIMARY KEY
        AUTO_INCREMENT,
	Serie
		CHAR(2)
        NOT NULL,
	Curso
		CHAR(3)
        NOT NULL,
	Turma
		CHAR(1)
        NOT NULL
);

CREATE TABLE Aluno(
	Nome
		VARCHAR(255)
        NOT NULL,
	ID_Turma
		SMALLINT
        NOT NULL,
	Mensalidade
		FLOAT(5,2)
        NOT NULL,
	Matricula
		SMALLINT
        NOT NULL
        AUTO_INCREMENT,
	PRIMARY KEY(Matricula, Nome),
	CONSTRAINT FK_ID_Turma FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID)
);

CREATE TABLE Professor(
	Nome
		VARCHAR(255)
        NOT NULL,
	Materia
		VARCHAR(50)
        NOT NULL,
	Salario
		FLOAT(6,2)
        NOT NULL,
	CNPJ
		CHAR(20)
        PRIMARY KEY
        NOT NULL
);

CREATE TABLE Materias(
	Nome_Materia
		VARCHAR(50)
        NOT NULL,
	Aluno_Matricula
		SMALLINT
        NOT NULL,
	Professor_CNPJ
		CHAR(20)
        NOT NULL,
	ID_Turma
		SMALLINT
        NOT NULL
        AUTO_INCREMENT,
        
	CONSTRAINT FK_Aluno_Matricula FOREIGN KEY (Aluno_Matricula) REFERENCES Aluno(Matricula),
    CONSTRAINT FK_Professor_CNPJ FOREIGN KEY (Professor_CNPJ) REFERENCES Professor(CNPJ),
    CONSTRAINT FK_Materias_ID_Turma FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID)
);

CREATE TABLE Medias(
	Aluno_Nome
		VARCHAR(255)
        NOT NULL,
	Aluno_Matricula
		SMALLINT
        NOT NULL,
	Media_1°_Unidade
		TINYINT
        NOT NULL,
	Media_2°_Unidade
		TINYINT
        NOT NULL,
	Media_3°_Unidade
		TINYINT
        NOT NULL,
	Media_4°_Unidade
		TINYINT
        NOT NULL,
	Media_Anual
		TINYINT
        NOT NULL,
	
    CONSTRAINT FK_Media_Aluno_Matricula FOREIGN KEY (Aluno_Matricula) REFERENCES Materias(Aluno_Matricula)
);
