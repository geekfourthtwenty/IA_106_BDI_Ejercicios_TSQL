USE BANCO

/*
Creación de table intermedia (M:N) - Utilizando Alters
ClientePrestamo
Diagrama guia archivo Banco_ClientePrestamo_tablaIntermedia.JPG
A continuacion los constraints se crearan con ALTER
*/

CREATE TABLE Cliente
(
	IdCliente INT NOT NULL, 
	Nombre VARCHAR(50) NOT NULL,
	FechaNacimiento DATE,
	Activo BIT	
)

CREATE TABLE Prestamo(
	IdPrestamo INT NOT NULL,
	Monto DECIMAL (18,2),
	Descripcion VARCHAR(200)
)

--Tabla intermedia ClientePrestamo
CREATE TABLE ClientePrestamo (
	IdCliente INT,
	IdPrestamo INT,
	Fecha DATETIME	
)

--Creacion de PK con ALTER a cliente
ALTER TABLE Cliente
ADD CONSTRAINT PK_Cliente 
PRIMARY KEY (IdCliente)


--Creacion de PK con ALTER a prestamo
ALTER TABLE Prestamo
ADD CONSTRAINT PK_Prestamo
PRIMARY KEY (IdPrestamo)

--Creacion de Pk y FK

ALTER TABLE ClientePrestamo
ALTER COLUMN IdCliente INT NOT NULL

ALTER TABLE ClientePrestamo
ALTER COLUMN IdPrestamo INT NOT NULL

ALTER TABLE ClientePrestamo
ADD CONSTRAINT PK_ClientePrestamo
PRIMARY KEY (Idcliente,IdPrestamo)

--Llaves foraneas

ALTER TABLE ClientePrestamo
ADD CONSTRAINT FK_ClientePrestamo_Cliente
	FOREIGN KEY (IdCliente)
	REFERENCES Cliente(IdCliente)

ALTER TABLE ClientePrestamo
ADD	CONSTRAINT FK_ClientePrestamo_Prestamo
	FOREIGN KEY (IdPrestamo)
	REFERENCES Prestamo (IdPrestamo)


