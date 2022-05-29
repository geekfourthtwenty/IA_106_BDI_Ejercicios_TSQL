CREATE DATABASE Banco
GO
USE BANCO
GO

CREATE TABLE Pais (
	IdPais INT NOT NULL,
	Nombre VARCHAR(100),
	CONSTRAINT PK_Pais
	PRIMARY KEY (IdPais)
)

CREATE TABLE Departamento(
	IdDepartamento INT NOT NULL,
	Nombre VARCHAR(100),
	IdPais INT,
	CONSTRAINT PK_Departamento
	PRIMARY KEY (IdDepartamento),
	CONSTRAINT FK_Departamento_Pais
	FOREIGN KEY (IdPais)
	REFERENCES Pais(IdPais)
)

/*
Cuando una tabla ya esta creada, para modificar los campos se
utiliza el comando ALTER
*/

--Agregar un campo
ALTER TABLE Departamento
ADD Fecha DATE NULL

--Eliminar un campo
ALTER TABLE Departamento
DROP COLUMN Fecha

--Modificar el tipo de dato de la columna
ALTER TABLE Departamento
ALTER COLUMN Fecha VARCHAR(100)

--Modificar el tipo de dato de la columna
ALTER TABLE Departamento
ALTER COLUMN FECHA DATE 