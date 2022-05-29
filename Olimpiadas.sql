CREATE DATABASE Olimpiadas
GO
USE Olimpiadas
GO

CREATE TABLE Complejo(
	IdComplejo INT,
	Nombre VARCHAR(50),
	Localizacion VARCHAR(50) UNIQUE,
	Jefe VARCHAR(50),
	FechaFundacion DATE,
	CapacidadEspectadores INT,
	CONSTRAINT PK_Complejo_IdComplejo
	PRIMARY KEY(IdComplejo)
)

CREATE TABLE Especialidad(
	IdEspecialidad INT,
	Nombre VARCHAR(50)
	--No hice la llave primaria
)


CREATE TABLE Ubicacion(
	IdUbicacion INT,
	Nombre VARCHAR(50),
	CONSTRAINT PK_Ubicacion_IdUbicacion
	PRIMARY KEY(IdUbicacion)
)

CREATE TABLE Juez(
	IdJuez INT,
	Nombre VARCHAR(50),
	CONSTRAINT PK_Juez_IdJuez
	PRIMARY KEY(IdJuez)
)

CREATE TABLE Area(
	IdArea INT,
	IdComplejo INT,
	IdEspecialidad INT,
	IdUbicacion INT,
	CONSTRAINT PK_Area_IdArea
	PRIMARY KEY (IdArea),
	CONSTRAINT FK_Area_Complejo
	FOREIGN KEY (IdComplejo)
	REFERENCES Complejo(IdComplejo),
	--Falta la llave  de Especialidad
	CONSTRAINT FK_Area_Ubicacion
	FOREIGN KEY (IdUbicacion)
	REFERENCES Ubicacion(IdUbicacion)
)

CREATE TABLE Evento(
	IdEvento INT IDENTITY(1,1),
	IdComplejo INT,
	Fecha DATETIME,
	Duracion INT,
	NumeroParticipantes INT,
	Jueces VARCHAR(100), --Atributo malo
	CONSTRAINT PK_Evento_IdEvento
	PRIMARY KEY (IdEvento),
	CONSTRAINT FK_Evento_Complejo
	FOREIGN KEY (IdComplejo)
	REFERENCES Complejo(IdComplejo)
)

CREATE TABLE EventoJueces(
	IdEvento INT,
	IdJuez INT,
	CONSTRAINT PK_EventoJueces_IdEvento_IdJuez
	PRIMARY KEY (IdEvento,IdJuez),
	CONSTRAINT FK_EventoJueces_Juez
	FOREIGN KEY (IdJuez)
	REFERENCES Juez(IdJuez),
	CONSTRAINT FK_EventoJuez_Evento
	FOREIGN KEY (IdEvento)
	REFERENCES Evento(IdEvento) 
)


--Alter para hacer un campo NOT NULL
ALTER TABLE Especialidad
ALTER COLUMN IdEspecialidad INT NOT NULL
--CREACION de PK con ALTER
ALTER TABLE Especialidad
ADD CONSTRAINT PK_Especialidad
	PRIMARY KEY (IdEspecialidad)
--CREACION DE FK
ALTER TABLE Area
ADD CONSTRAINT FK_Area_Especialidad
	FOREIGN KEY (IdEspecialidad)
	REFERENCES Especialidad(IdEspecialidad)

--ELIMINAR EL CAMPO DE JUECES
ALTER TABLE Evento
DROP COLUMN Jueces