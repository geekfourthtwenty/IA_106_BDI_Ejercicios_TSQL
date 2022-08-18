CREATE DATABASE Autopartes

GO 
USE Autopartes
GO

CREATE SCHEMA Catalago
GO

CREATE TABLE Catalago.TipoDireccion (

	IdTipoDireccion INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_TipoDireccion
	PRIMARY KEY (IdTipoDireccion)

)

CREATE TABLE Catalago.Marca (

	IdMarca INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Marca
	PRIMARY KEY (IdMarca)

)

CREATE TABLE Catalago.TipoParte (

	IdTipoParte INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_TipoParte
	PRIMARY KEY (IdTipoParte)

)

CREATE TABLE Catalago.Estado (

	IdEstado INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Estado
	PRIMARY KEY (IdEstado)

)

CREATE TABLE Sucursal (

	IdSucursal INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Sucursal
	PRIMARY KEY (IdSucursal)

)

CREATE TABLE Direccion (

	IdDireccion INT NOT NULL,
	Calle  VARCHAR (20) NOT NULL,
	Bloque  VARCHAR (20) NOT NULL,
	IdTipoDireccion INT NOT NULL,
	IdSucursal INT NOT NULL 
	CONSTRAINT PK_Direccion
	PRIMARY KEY (IdDireccion),
	CONSTRAINT FK_Direccion_TipoDireccion
	FOREIGN KEY (IdTipoDireccion)
	REFERENCES Catalago.TipoDireccion (IdTipoDireccion),
	CONSTRAINT FK_Direccion_Sucursal
	FOREIGN KEY (IdSucursal)
	REFERENCES Sucursal (IdSucursal)

)

CREATE TABLE Catalago.Telefono (

	IdTelefono INT NOT NULL,
	IdSucursal INT NOT NULL,
	NumeroTelefono INT,
	Nombre VARCHAR (20),
	CONSTRAINT PK_Telefono
	PRIMARY KEY (IdTelefono),
	CONSTRAINT FK_Telefono_Sucursal
	FOREIGN KEY (IdSucursal)
	REFERENCES Sucursal (IdSucursal)

)

CREATE TABLE Modelo (

	IdModelo INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	IdMarca INT NOT NULL
	CONSTRAINT PK_Modelo
	PRIMARY KEY (IdModelo),
	CONSTRAINT FK_Modelo_Marca
	FOREIGN KEY (IdMarca)
	REFERENCES Catalago.Marca (IdMarca)

)

CREATE TABLE Automovil (

	IdAutomovil INT NOT NULL,
	Anio DATE,
	Precio DECIMAL,
	FechaCompra DATE,
	FechaIngreso DATE,
	CantidadMilla INT,
	IdSucursal INT NOT NULL,
	IdEstado INT NOT NULL,
	IdModelo INT NOT NULL
	CONSTRAINT PK_Automovil
	PRIMARY KEY (IdAutomovil),
	CONSTRAINT FK_Automovil_Sucursal
	FOREIGN KEY (IdSucursal)
	REFERENCES Sucursal (IdSucursal),
	CONSTRAINT FK_Automovil_Estado
	FOREIGN KEY (IdEstado)
	REFERENCES Catalago.Estado (IdEstado),
	CONSTRAINT FK_Automovil_Modelo
	FOREIGN KEY (IdModelo)
	REFERENCES Modelo (IdModelo)

)

CREATE TABLE Inventario (

	IdAutomovil INT NOT NULL,
	IdTipoParte INT NOT NULL,
	PrecioDeVenta DECIMAL,
	IdEstado INT NOT NULL,
	CONSTRAINT PK_Inventario_IdAutomovil_IdTipoParte
	PRIMARY KEY (IdAutomovil, IdTipoParte),
	CONSTRAINT FK_Inventario_Automovil
	FOREIGN KEY (IdAutomovil)
	REFERENCES Automovil (IdAutomovil),
	CONSTRAINT FK_Inventario_TipoParte
	FOREIGN KEY (IdTipoParte)
	REFERENCES Catalago.TipoParte (IdTipoParte),
	CONSTRAINT FK_Inventario_Estado
	FOREIGN KEY (IdEstado)
	REFERENCES Catalago.Estado (IdEstado)

)