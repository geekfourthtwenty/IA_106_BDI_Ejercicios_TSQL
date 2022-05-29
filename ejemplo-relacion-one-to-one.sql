CREATE DATABASE EjemploRelacionOneToOne
GO

USE EjemploRelacionOneToOne
GO

CREATE TABLE Empleado
(
	IdEmpleado INT,
	Nombre VARCHAR(50),
	Apellido VARCHAR(50),
	Sueldo DECIMAL(18,2),
	CONSTRAINT PK_Empleado_IdEmpleado
	PRIMARY KEY (IdEmpleado)
)

CREATE TABLE EmpleadoPorHora
(
	IdEmpleado INT,
	PrecioPorHora DECIMAL(18,2),
	CONSTRAINT PK_EmpleadoPorHora_IdEmpleado
	PRIMARY KEY (IdEmpleado),
	CONSTRAINT FK_EmpleadoPorHora_Empleado
	FOREIGN KEY (IdEmpleado)
	REFERENCES Empleado(IdEmpleado)
)



