USE Autopartes

--a. Detalle de tipos de direcciones.
INSERT INTO Catalago.TipoDireccion(IdTipoDireccion, Nombre)
VALUES (1, 'Oficina'), (2, 'Trabajo'), (3, 'Personal'), (4, 'Secundaria'), (5, 'Taller');

--b. Detalle de las sucursales.

INSERT INTO Sucursal (IdSucursal, Nombre)
VALUES (1, 'Principal -Centro'), (2, 'City Mall'), (3, 'Metromall'), (4, 'Oficina')
INSERT INTO Direccion (IdDireccion, Calle, Bloque, IdTipoDireccion, IdSucursal)
VALUES (1, 'Calle CA', 'Bloque BA', 1,1), (2, 'Calle CB', 'Bloque BB', 1,2), (3, 'Calle CC', 'Bloque BC', 5,3), (4, 'Calle C','Bloque BD',2,4)
INSERT INTO Catalago.Telefono (IdTelefono, NumeroTelefono, IdSucursal)
VALUES (1, '99999901', 1), (2, '99999902', 2), (3, '99999903', 3), (4, '99999904', 4)

--c. Listado de marcas y modelos.
INSERT INTO Catalago.Marca (IdMarca, Nombre)
VALUES (1, 'BMW'), (2, 'Ford'), (3, 'Toyota'), (4, 'Honda'), (5, 'Honda'), (6, 'Honda'), (7, 'Toyota');
INSERT INTO Modelo (IdModelo, Nombre, IdMarca)
VALUES (1, '3 Series',1), (2, 'F-150',2), (3, 'Prius', 3), (4, 'Civic', 4), (5, 'Civic', 5), (6, 'CRV', 6), (7, 'Hilux', 7);

SELECT * FROM Catalago.TipoDireccion SELECT * FROM Sucursal SELECT * FROM Direccion
SELECT * FROM Catalago.Telefono SELECT * FROM Catalago.Marca
SELECT * FROM Catalago.Marca SELECT * FROM Modelo