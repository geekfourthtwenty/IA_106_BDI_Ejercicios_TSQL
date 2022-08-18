CREATE DATABASE Complejo1

GO
USE Complejo1
GO

CREATE SCHEMA Catalago
GO

CREATE TABLE Catalago.Instalacion (

	IdInstalacion INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Instalacion
	PRIMARY KEY (IdInstalacion) 

)

CREATE TABLE Catalago.TipoComplejo (

	IdTipoComplejo INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_TipoComplejo
	PRIMARY KEY (IdTipoComplejo) 

)

CREATE TABLE Catalago.Localizacion (

	IdLocalizacion INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Localizacion
	PRIMARY KEY (IdLocalizacion) 

)

CREATE TABLE Catalago.Especialidad (

	IdEspecialidad INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Especialidad
	PRIMARY KEY (IdEspecialidad)

)

CREATE TABLE Catalago.Ubicacion (
	
	IdUbicacion INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Ubicacion
	PRIMARY KEY (IdUbicacion)

)

CREATE TABLE Complejo (

	IdComplejo INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	Tamaño INT,
	Jefe VARCHAR,
	FechaFundacion DATE,
	MaximoEspectadores INT,
	IdTipoComplejo INT NOT NULL,
	IdInstalacion INT NOT NULL,
	IdLocalizacion INT NOT NULL,
	CONSTRAINT PK_Complejo
	PRIMARY KEY (IdComplejo),
	CONSTRAINT FK_Complejo_TipoComplejo
	FOREIGN KEY (IdTipoComplejo)
	REFERENCES Catalago.TipoComplejo (IdTipoComplejo),
	CONSTRAINT FK_Complejo_Instalacion
	FOREIGN KEY (IdInstalacion)
	REFERENCES Catalago.Instalacion (IdInstalacion),
	CONSTRAINT FK_Complejo_Localizacion
	FOREIGN KEY (IdLocalizacion)
	REFERENCES Catalago.Localizacion (IdLocalizacion)

)

CREATE TABLE Area (
	
	IdArea INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	IdComplejo INT NOT NULL,
	IdEspecialidad INT NOT NULL,
	IdUbicacion INT NOT NULL,
	CONSTRAINT PK_Area
	PRIMARY KEY (IdArea),
	CONSTRAINT FK_Area_Complejo
	FOREIGN KEY (IdComplejo)
	REFERENCES Complejo (IdComplejo),
	CONSTRAINT FK_Area_Especialidad
	FOREIGN KEY (IdEspecialidad)
	REFERENCES Catalago.Especialidad (IdEspecialidad),
	CONSTRAINT FK_Area_Ubicacion
	FOREIGN KEY (IdUbicacion)
	REFERENCES Catalago.Ubicacion (IdUbicacion)

)

CREATE TABLE Evento (

	IdEvento INT NOT NULL,
	Fecha DATE,
	Duracion INT,
	NumeroParticipantes INT,
	IdComplejo INT NOT NULL,
	CONSTRAINT PK_Evento
	PRIMARY KEY (IdEvento),
	CONSTRAINT FK_Evento_Complejo
	FOREIGN KEY (IdComplejo)
	REFERENCES Complejo (IdComplejo)

)

CREATE TABLE Catalago.Juez (
	
	IdJuez INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Juez
	PRIMARY KEY (IdJuez)

)

CREATE TABLE EventoJuez (

	IdEvento INT NOT NULL,
	IdJuez INT NOT NULL,
	CONSTRAINT PK_EventoJuez_IdEvento_IdJuez
	PRIMARY KEY (IdEvento, IdJuez),
	CONSTRAINT FK_EventoJuez_Evento
	FOREIGN KEY (IdEvento)
	REFERENCES Evento (IdEvento),
	CONSTRAINT FK_EventoJuez_Juez
	FOREIGN KEY (IdJuez)
	REFERENCES Catalago.Juez (IdJuez)
	
)


