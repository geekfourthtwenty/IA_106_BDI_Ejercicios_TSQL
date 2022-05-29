USE BANCO

/*
Creación de table intermedia (M:N)
ClientePrestamo
Diagrama guia archivo Banco_ClientePrestamo_tablaIntermedia.JPG
*/

CREATE TABLE Cliente
(
	IdCliente INT NOT NULL, 
	Nombre VARCHAR(50) NOT NULL,
	FechaNacimiento DATE,
	Activo BIT,
	CONSTRAINT PK_Cliente
	PRIMARY KEY (IdCliente)
)

CREATE TABLE Prestamo(
	IdPrestamo INT NOT NULL,
	Monto DECIMAL (18,2),
	Descripcion VARCHAR(200),
	CONSTRAINT PK_Prestamo
	PRIMARY KEY (IdPrestamo)
)

--Tabla intermedia ClientePrestamo
CREATE TABLE ClientePrestamo (
	IdCliente INT,
	IdPrestamo INT,
	Fecha DATETIME,	
	CONSTRAINT PK_ClientePrestamo
	PRIMARY KEY (Idcliente,IdPrestamo),
	CONSTRAINT FK_ClientePrestamo_Cliente
	FOREIGN KEY (IdCliente)
	REFERENCES Cliente(IdCliente),
	CONSTRAINT FK_ClientePrestamo_Prestamo
	FOREIGN KEY (IdPrestamo)
	REFERENCES Prestamo (IdPrestamo)
)
