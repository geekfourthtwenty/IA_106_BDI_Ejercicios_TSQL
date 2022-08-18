CREATE DATABASE SolicitudBeca

GO
USE SolicitudBeca
GO

CREATE SCHEMA Catalogo

GO

CREATE TABLE Catalogo.Departamento (

	CodigoDepartamento INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Departamento
	PRIMARY KEY (CodigoDepartamento)
)

CREATE TABLE Catalogo.Municipio (

	CodigoMunicipio INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CodigoDepartamento INT NOT NULL,
	CONSTRAINT PK_Municipio
	PRIMARY KEY (CodigoMunicipio),
	CONSTRAINT FK_Municipio_Departamento
	FOREIGN KEY (CodigoDepartamento)
	REFERENCES Catalogo.Departamento(CodigoDepartamento)
)

CREATE TABLE Catalogo.Aldea (

	CodigoAldea INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CodigoMunicipio INT NOT NULL,
	CONSTRAINT PK_Aldea
	PRIMARY KEY (CodigoAldea),
	CONSTRAINT FK_Aldea_Municipio
	FOREIGN KEY (CodigoMunicipio)
	REFERENCES Catalogo.Municipio (CodigoMunicipio)
)

CREATE TABLE Catalogo.Caserio (

	CodigoCaserio INT NOT NULL,
	Nombre VARCHAR (20),
	CodigoAldea INT NOT NULL,
	CONSTRAINT PK_Caserio
	PRIMARY KEY (CodigoCaserio),
	CONSTRAINT FK_Caserio_Aldea
	FOREIGN KEY (CodigoAldea)
	REFERENCES Catalogo.Aldea(CodigoAldea)
)

CREATE TABLE Catalogo.Sexo (
	
	CodigoSexo INT NOT NULL,
	Nombre VARCHAR (20),
	CONSTRAINT PK_Sexo
	PRIMARY KEY (CodigoSexo)
)

CREATE TABLE Catalogo.EstadoCivil (

	CodigoEstadoCivil INT NOT NULL,
	Nombre VARCHAR (20),
	CONSTRAINT PK_EstadoCivil
	PRIMARY KEY (CodigoEstadoCivil)
)

CREATE TABLE Catalogo.TipoTelefono (

	CodigoTipoTelefono INT NOT NULL,
	Nombre VARCHAR (20), 
	CONSTRAINT PK_TipoTelofono
	PRIMARY KEY (CodigoTipoTelefono)
)

CREATE TABLE Catalogo.TipoCorreo (

	CodigoTipoCorreo INT NOT NULL,
	Nombre VARCHAR (20),
	CONSTRAINT PK_TipoCorreo
	PRIMARY KEY (CodigoTipoCorreo)
)

CREATE TABLE Catalogo.TipoDiscapacidad (

	CodigoTipoDiscapacidad INT NOT NULL,
	Nombre VARCHAR (20),
	CONSTRAINT PK_TipoDiscapacidad
	PRIMARY KEY (CodigoTipoDiscapacidad)
)

CREATE TABLE Catalogo.TipoOcupacion (
	
	CodigoTipoOcupacion INT NOT NULL,
	Nombre VARCHAR (20),
	CONSTRAINT PK_TipoOcupacion
	PRIMARY KEY (CodigoTipoOcupacion)
)

CREATE TABLE Catalogo.TipoDocumento (

	CodigoTipoDocumento INT NOT NULL,
	Nombre VARCHAR (20),
	CONSTRAINT PK_TipoDocumento
	PRIMARY KEY (CodigoTipoDocumento)
)

CREATE TABLE SolicitudBeca (

	CodigoSolicitud INT NOT NULL,
	PrimerNombre VARCHAR (20),
	SegundoNombre VARCHAR (20),
	PrimerApellido VARCHAR (20),
	SegundoApellido VARCHAR (20),
	NumeroIdentidad INT NOT NULL,
	FechaNacimiento DATE,
	CodigoSexo INT,
	CodigoEstadoCivil INT,
	CodigoCaserio INT,
	NumerosHijos INT,
	OrigenEtnico VARCHAR (20),
	DireccionResidencias VARCHAR (20),
	CONSTRAINT PK_SolicitudBeca
	PRIMARY KEY (CodigoSolicitud),
	CONSTRAINT FK_SolicitudBeca_Sexo
	FOREIGN KEY (CodigoSexo)
	REFERENCES Catalogo.Sexo(CodigoSexo),
	CONSTRAINT FK_SolicitudBeca_EstadoCivil
	FOREIGN KEY (CodigoEstadoCivil)
	REFERENCES Catalogo.EstadoCivil (CodigoEstadoCivil),
	CONSTRAINT FK_SolicitudBeca_Caserio
	FOREIGN KEY (CodigoCaserio)
	REFERENCES Catalogo.Caserio(CodigoCaserio)
)

CREATE TABLE OcupacionDetalle (

	CodigoSolicitud INT,
	Descripcion VARCHAR (20),	
	CodigoTipoOcupacion INT,
	CONSTRAINT FK_OcupacionDetalle_SolicitudBeca
	FOREIGN KEY (CodigoSolicitud)
	REFERENCES SolicitudBeca(CodigoSolicitud),
	CONSTRAINT FK_OcupacionDetalle_TipoOcupacion
	FOREIGN KEY (CodigoTipoOcupacion)
	REFERENCES Catalogo.TipoOcupacion(CodigoTipoOcupacion)
)

CREATE TABLE Correo (

	CodigoSolicitud INT,
	CodigoTipoCorreo INT,
	CONSTRAINT FK_Correo_SolicitudBeca
	FOREIGN KEY (CodigoSolicitud)
	REFERENCES SolicitudBeca(CodigoSolicitud),
	CONSTRAINT FK_Correo_TipoCorreo
	FOREIGN KEY (CodigoTipoCorreo)
	REFERENCES Catalogo.TipoCorreo (CodigoTipoCorreo)
)

CREATE TABLE Documentos (

	CodigoSolicitud INT,
	NombreArchivo VARCHAR (20),
	CodigoDocumento INT,
	CodigoTipoDocumento INT,
	CONSTRAINT PK_Documentos
	PRIMARY KEY (CodigoDocumento),
	CONSTRAINT FK_Documentos_SolicitudBeca
	FOREIGN KEY (CodigoSolicitud)
	REFERENCES SolicitudBeca(CodigoSolicitud),
	CONSTRAINT FK_Documentos_TipoDocumento
	FOREIGN KEY (CodigoTipoDocumento)
	REFERENCES Catalogo.TipoDocumento(CodigoTipoDocumento)
)

CREATE TABLE Telefono (

	CodigoSolicitud INT,
	CodigoTipoTelefono INT,
	NumeroTelefono INT,
	CONSTRAINT PK_Telefono_CodigoSolicitud_CodigoTipoTelefono
	PRIMARY KEY (CodigoSolicitud,CodigoTipoTelefono),
	CONSTRAINT FK_Telefono_SolicitudBeca
	FOREIGN KEY (CodigoSolicitud)
	REFERENCES SolicitudBeca(CodigoSolicitud),
	CONSTRAINT FK_Telefono_TipoTelefono
	FOREIGN KEY (CodigoTipoTelefono)
	REFERENCES Catalogo.TipoTelefono(CodigoTipoTelefono)
)

CREATE TABLE Discapacidad (

	CodigoSolicitud INT,
	CodigoTipoDiscapacidad INT,
	CONSTRAINT PK_Discapacidad_CodigoSolicitud_CodigoTipoDiscapacidad
	PRIMARY KEY (CodigoSolicitud, CodigoTipoDiscapacidad),
	CONSTRAINT FK_Discapacidad_SolicitudBeca
	FOREIGN KEY (CodigoSolicitud)
	REFERENCES SolicitudBeca(CodigoSolicitud),
	CONSTRAINT FK_Discapacidad_TipoDiscapacidad
	FOREIGN KEY (CodigoTipoDiscapacidad)
	REFERENCES Catalogo.TipoDiscapacidad(CodigoTipoDiscapacidad)
)
