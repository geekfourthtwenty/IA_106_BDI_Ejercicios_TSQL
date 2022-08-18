CREATE DATABASE Cine

GO
USE Cine
GO

CREATE TABLE Productora (

	IdProductora INT,
	Nombre VARCHAR (20),
	Direccion VARCHAR (100),
	CONSTRAINT PK_Productora_IdProductora
	PRIMARY KEY (IdProductora)

) 

 CREATE TABLE Pelicula (

	IdPelicula INT,
	Titulo VARCHAR (20),
	AñoProyeccion DATE,
	Duracion INT,
	Sinopsis VARCHAR (20),
	ResumenTrama VARCHAR (20),
	IdProductora INT,
	CONSTRAINT PK_Pelicula_IdPelicula
	PRIMARY KEY (IdPelicula),
	CONSTRAINT FK_Pelicula_Productora
	FOREIGN KEY (IdProductora)
	REFERENCES Productora(IdProductora)
)

CREATE TABLE Genero (
	
	IdGenero INT,
	Nombre VARCHAR (20),
	CONSTRAINT PK_Genero_IdGenero
	PRIMARY KEY (IdGenero)
)

CREATE TABLE PeliculaGenero (

	IdPelicula INT,
	IdGenero INT, 
	CONSTRAINT PK_PeliculaGenero_IdPelicula_IdGenero
	PRIMARY KEY (IdPelicula, IdGenero),
	CONSTRAINT FK_PeliculaGenero_Pelicula
	FOREIGN KEY (IdPelicula)
	REFERENCES Pelicula(IdPelicula),
	CONSTRAINT FK_PeliculaGenero_Genero
	FOREIGN KEY (IdGenero)
	REFERENCES Genero(IdGenero)

) 	

CREATE TABLE Papel (

	IdPapel INT,
	Nombre VARCHAR (20),
	CONSTRAINT PK_Papel_IdPapel
	PRIMARY KEY (IdPapel)

)

CREATE TABLE Pais (

	IdPaisNacimiento INT,
	Nombre VARCHAR (20),
	CONSTRAINT PK_Pais_IdPais
	PRIMARY KEY (IdPaisNacimiento)
)

CREATE TABLE Director (

	IdDirector INT,
	Nombre VARCHAR (20),
	FechaNacimiento DATE,
	IdPaisNacimiento INT,
	CONSTRAINT PK_Director_IdDirector
	PRIMARY KEY (IdDirector),
	CONSTRAINT FK_Director_Pais
	FOREIGN KEY (IdPaisNacimiento)
	REFERENCES Pais(IdPaisNacimiento)
)

CREATE TABLE Actor (
	
	IdActor INT,
	Nombre VARCHAR (20),
	FechaNacimiento DATE,
	IdPaisNacimiento INT,
	FechaInicio DATE,
	CONSTRAINT PK_Actor_IdActor
	PRIMARY KEY (IdActor),
	CONSTRAINT FK_Actor_Pais
	FOREIGN KEY (IdPaisNacimiento)
	REFERENCES Pais(IdPaisNacimiento)
)

CREATE TABLE PeliculaActor (
	
	IdPelicula INT,
	IdActor INT,
	IdPapel INT,
	CONSTRAINT PK_PeliculaActor_IdPelicula_IdActor_IdPapel
	PRIMARY KEY (IdPelicula, IdActor, IdPapel),
	CONSTRAINT FK_PeliculaActor_Pelicula
	FOREIGN KEY (IdPelicula)
	REFERENCES Pelicula(IdPelicula),
	CONSTRAINT FK_PeliculaActor_Actor
	FOREIGN KEY (IdActor)
	REFERENCES Actor(IdActor),
	CONSTRAINT FK_PeliculaActor_Papel
	FOREIGN KEY (IdPapel)
	REFERENCES Papel(IdPapel)
)

CREATE TABLE PeliculaDirector (

	IdPelicula INT,
	IdDirector INT,
	CONSTRAINT PK_PeliculaDirector_IdPelicula_IdDirector
	PRIMARY KEY (IdPelicula, IdDirector),
	CONSTRAINT FK_PeliculaDirector_Pelicula
	FOREIGN KEY (IdPelicula)
	REFERENCES Pelicula(IdPelicula),
	CONSTRAINT FK_PeliculaDirector_Director
	FOREIGN KEY (IdDirector)
	REFERENCES Director(IdDirector)
)

CREATE TABLE CitasReseñables (

	idCita INT,
	IdPelicula INT,
	IdActor INT,
	CONSTRAINT PK_CitasReseñables_IdCita
	PRIMARY KEY (IdCita),
	CONSTRAINT FK_CitasReseñables_Pelicula
	FOREIGN KEY (IdPelicula)
	REFERENCES Pelicula(IdPelicula),
	CONSTRAINT FK_CitasReseñables_Actor
	FOREIGN KEY (IdActor)
	REFERENCES Actor(IdActor)
)




