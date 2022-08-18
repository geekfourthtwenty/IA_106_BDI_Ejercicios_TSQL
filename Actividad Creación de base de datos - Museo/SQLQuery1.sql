CREATE DATABASE Museo

GO
USE Museo
GO

CREATE SCHEMA Catalogo
GO

CREATE TABLE Catalogo.TipoObjetoArte (

	IdTipoObjetoArte INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_TipoObjetoArte
	PRIMARY KEY (IdTipoObjetoArte) 

)

CREATE TABLE Catalogo.Epoca (

	IdEpoca INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Epoca
	PRIMARY KEY (IdEpoca)

)

CREATE TABLE Catalogo.Pais (

	IdPais INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Pais
	PRIMARY KEY (IdPais)

)

CREATE TABLE Catalogo.EstiloArtista (

	IdEstiloArtista INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_EstiloArtista
	PRIMARY KEY (IdEstiloArtista)

)

CREATE TABLE Catalogo.Estado (

	IdEstado INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Estado
	PRIMARY KEY (IdEstado)

)

CREATE TABLE Catalogo.TipoColeccion (

	IdTipoColeccion INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_TipoColeccion
	PRIMARY KEY (IdTipoColeccion)

)

CREATE TABLE Catalogo.TipoObraOtro (

	IdTipoObra INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_TipoObraOtro
	PRIMARY KEY (IdTipoObra)

)

CREATE TABLE Catalogo.EstiloOtro (

	IdEstiloOtro INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_EstiloOtro
	PRIMARY KEY (IdEstiloOtro)

)

CREATE TABLE Catalogo.MaterialEscultura (

	IdMaterialEscultura INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_MaterialEscultura
	PRIMARY KEY (IdMaterialEscultura)

)

CREATE TABLE Catalogo.EstiloEscultura (

	IdEstiloEscultura INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_EstiloEscultura
	PRIMARY KEY (IdEstiloEscultura)

)

CREATE TABLE Catalogo.TipoPintura (

	IdTipoPintura INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,	
	CONSTRAINT PK_TipoPintura 
	PRIMARY KEY (IdTipoPintura)

)

CREATE TABLE Catalogo.EstiloPintura (

	IdEstiloPintura INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_EstiloPintura
	PRIMARY KEY (IdEstiloPintura)

)

CREATE TABLE Catalogo.MaterialPintura (

	IdMaterialPintura INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_MaterialPintura
	PRIMARY KEY (IdMaterialPintura)

)

CREATE TABLE Exhibicion (

	IdExhibicion INT NOT NULL,
	FechaInicio DATE,
	FechaFinalizacion DATE,
	CONSTRAINT PK_Exhibicion
	PRIMARY KEY (IdExhibicion)

)


CREATE TABLE Artista (

	IdArtista INT NOT NULL,
	Nombre VARCHAR (20) UNIQUE,
	FechaNacimiento DATE,
	FechaFallecimiento DATE,
	IdPais INT NOT NULL,
	IdEpoca INT NOT NULL,
	Descripcion VARCHAR (20),
	IdEstiloArtista INT NOT NULL,
	CONSTRAINT PK_Artista
	PRIMARY KEY (IdArtista),
	CONSTRAINT FK_Artista_Pais
	FOREIGN KEY (IdPais)
	REFERENCES Catalogo.Pais (IdPais),
	CONSTRAINT FK_Artista_Epoca
	FOREIGN KEY (IdEpoca)
	REFERENCES Catalogo.Epoca (IdEpoca),
	CONSTRAINT FK_Artista_EstiloArtista
	FOREIGN KEY (IdEstiloArtista)
	REFERENCES Catalogo.EstiloArtista (IdEstiloArtista)

)

CREATE TABLE ObjetoArte (

	IdObjetoArte INT NOT NULL,
	AnioCreacion DATE,
	Titulo VARCHAR (20),
	Descripcion VARCHAR (20),	
	IdArtista INT NOT NULL,
	IdTipoObjetoArte INT NOT NULL,
	IdPais INT NOT NULL,
	IdEpoca INT NOT NULL,
	CONSTRAINT PK_ObjetoArte
	PRIMARY KEY (IdObjetoArte),
	CONSTRAINT FK_ObjetoArte_Artista
	FOREIGN KEY (IdArtista)
	REFERENCES Artista (IdArtista),
	CONSTRAINT FK_ObjetoArte_TipoObjetoArte
	FOREIGN KEY (IdTipoObjetoArte)
	REFERENCES Catalogo.TipoObjetoArte (IdTipoObjetoArte),
	CONSTRAINT FK_ObjetoArte_Pais
	FOREIGN KEY (IdPais)
	REFERENCES Catalogo.Pais (IdPais),
	CONSTRAINT FK_ObjetoArte_Epoca
	FOREIGN KEY (IdEpoca)
	REFERENCES Catalogo.Epoca (IdEpoca) 

)

CREATE TABLE ObjetoArteExhibicion (

	IdObjetoArte INT NOT NULL,
	IdExhibicion INT NOT NULL,
	CONSTRAINT PK_ObjetoArteExhibicion_IdObjetoArte_IdExhibicion
	PRIMARY KEY (IdObjetoArte, IdExhibicion),
	CONSTRAINT FK_ObjetoArteExhibicion_ObjetoArte
	FOREIGN KEY (IdObjetoArte)
	REFERENCES ObjetoArte (IdObjetoArte),
	CONSTRAINT FK_ObjetoArteExhibicion_Exhibicion
	FOREIGN KEY (IdExhibicion)
	REFERENCES Exhibicion (IdExhibicion)

)

CREATE TABLE Coleccion (

	IdColeccion INT NOT NULL,
	Nombre VARCHAR (20) UNIQUE,
	IdTipoColeccion INT NOT NULL,
	Descripcion VARCHAR (20),
	Direccion VARCHAR (20), 
	Telefono INT,
	PersonaContacto VARCHAR (20),
	CONSTRAINT PK_Coleccion
	PRIMARY KEY (IdColeccion),
	CONSTRAINT FK_Coleccion_TipoColeccion
	FOREIGN KEY (IdTipoColeccion)
	REFERENCES Catalogo.TipoColeccion (IdTipoColeccion)

)

CREATE TABLE Prestado (

		IdObjetoArte INT NOT NULL,
		IdColeccion INT NOT NULL,
		FechaPrestamo DATE,
		FechaDevolucion DATE,
		CONSTRAINT PK_Prestado
		PRIMARY KEY (IdObjetoArte),
		CONSTRAINT FK_Prestado_ObjetoArte
		FOREIGN KEY (IdObjetoArte)
		REFERENCES ObjetoArte (IdObjetoArte),
		CONSTRAINT FK_Prestado_Coleccion
		FOREIGN KEY (IdColeccion)
		REFERENCES Coleccion (IdColeccion)

)

CREATE TABLE Permanente (

	IdObjetoArte INT NOT NULL,
	FechaAdquision DATE,
	IdEstado INT NOT NULL,
	CONSTRAINT PK_Permanente
	PRIMARY KEY (IdObjetoArte),
	CONSTRAINT FK_Permanente_ObjetoArte
	FOREIGN KEY (IdObjetoArte)
	REFERENCES ObjetoArte (IdObjetoArte),
	CONSTRAINT FK_Permanente_Estado
	FOREIGN KEY (IdEstado)
	REFERENCES Catalogo.Estado (IdEstado)

)


CREATE TABLE Otro (

	IdObjetoArte INT NOT NULL,
	IdTipoObra INT NOT NULL,
	IdEstiloOtro INT NOT NULL,
	CONSTRAINT PK_Otro
	PRIMARY KEY (IdObjetoArte),
	CONSTRAINT FK_Otro_ObjetoArte
	FOREIGN KEY (IdObjetoArte)
	REFERENCES ObjetoArte (IdObjetoArte),
	CONSTRAINT FK_Otro_TipoObraOtro
	FOREIGN KEY (IdTipoObra)
	REFERENCES Catalogo.TipoObraOtro (IdTipoObra),
	CONSTRAINT FK_Otro_EstiloOtro
	FOREIGN KEY (IdEstiloOtro)
	REFERENCES Catalogo.EstiloOtro (IdEstiloOtro)

)

CREATE TABLE Escultura (
	
	IdObjetoArte INT NOT NULL,
	Altura INT,
	Anchura INT,
	IdMaterialEscultura INT NOT NULL,
	IdEstiloEscultura INT NOT NULL,
	CONSTRAINT PK_Escultura
	PRIMARY KEY (IdObjetoArte),
	CONSTRAINT FK_Escultura_ObjetoArte
	FOREIGN KEY (IdObjetoArte)
	REFERENCES ObjetoArte (IdObjetoArte),
	CONSTRAINT FK_Escultura_MaterialEscultura
	FOREIGN KEY (IdMaterialEscultura)
	REFERENCES Catalogo.MaterialEscultura (IdMaterialEscultura),
	CONSTRAINT FK_Escultura_EstiloEscultura
	FOREIGN KEY (IdEstiloEscultura)
	REFERENCES Catalogo.EstiloEscultura (IdEstiloEscultura)

)

CREATE TABLE Pintura (

	IdObjetoArte INT NOT NULL,
	IdTipoPintura INT NOT NULL,
	IdMaterialPintura INT NOT NULL,
	IdEstiloPintura INT NOT NULL,
	CONSTRAINT PK_Pintura
	PRIMARY KEY (IdObjetoArte),
	CONSTRAINT FK_Pintura_ObjetoArte
	FOREIGN KEY (IdObjetoArte)
	REFERENCES ObjetoArte (IdObjetoArte),
	CONSTRAINT FK_Pintura_TipoPintura
	FOREIGN KEY (IdTipoPintura)
	REFERENCES Catalogo.TipoPintura (IdTipoPintura),
	CONSTRAINT FK_Pintura_MaterialPintura
	FOREIGN KEY (IdMaterialPintura)
	REFERENCES Catalogo.MaterialPintura (IdMaterialPintura),
	CONSTRAINT FK_Pintura_EstiloPintura
	FOREIGN KEY (IdEstiloPintura)
	REFERENCES Catalogo.EstiloPintura (IdEstiloPintura)

)
