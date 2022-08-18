USE AdventureWorks2019 

/**
Ejercicio 1, guia 2.
Mostrar el listado de los empleados:
. Nombre
a. Sueldo
b. Descripción departamento
c. Vacaciones
d. Fecha Nacimiento
e. Fecha Contratación
f. Estado Civil
g. Género
h. Edad
i. Antigüedad Laboral en años.
**/

SELECT 
p.FirstName +' '+ ISNULL(p.MiddleName, '') + ' ' +  p.LastName NombreEmpleado,
(sal.Rate * sal.PayFrequency) Salario,
dep.Department Depto, 
soh.VacationHours Vacaciones,
soh.BirthDate FechaNacimiento,
soh.HireDate FechaContratacion,
soh.MaritalStatus EstadoCivil, 
soh.Gender Genero,
DATEDIFF (YEAR, BirthDate, GETDATE()) Edad,
DATEDIFF (YEAR, HireDate, GETDATE()) AntiguedadLaboral
FROM HumanResources.Employee soh
JOIN Person.Person p 
	ON p.BusinessEntityID = soh.BusinessEntityID
JOIN HumanResources.EmployeePayHistory sal
	ON sal.BusinessEntityID = soh.BusinessEntityID
JOIN HumanResources.vEmployeeDepartment dep 
	ON dep.BusinessEntityID = soh.BusinessEntityID
 
/**
Ejercicio 2, guia 2.
Mostrar las direcciones de los empleados:
a. Nombre del empleado
b. Descripcion tipo de dirección
c. Direccion
**/

SELECT 
p.FirstName + ' ' + ISNULL(p.MiddleName, '') + ' ' + p.LastName Nombre,
	des.Name DescripcionDireccion,
	dire.AddressLine1 Direccion
FROM Person.BusinessEntityAddress bus
JOIN Person.Person p 
	ON p.BusinessEntityID = bus.BusinessEntityID
JOIN Person.Address dire
	ON dire.AddressID = bus.AddressID
JOIN Person.AddressType des 
	ON des.AddressTypeID = bus.AddressTypeID

/**
Ejercico 3, guia 2.
Mostrar las ordenes:
1. Número de Orden
2. Fecha de la orden
3. Fecha de Envío
4. Fecha Vencimiento
5. Direccion de Envio (La descripción)
6. Subtotal
7. Calcular el 15% del subtotal
8. Calcular el tota que es El subtotal más el 15% del subtotal.
9. Id Territorio
10. Descripcion del territorio
**/

SELECT 
soh.SalesOrderID,
soh.SalesOrderNumber,
soh.OrderDate,
soh.DueDate,
a.AddressLine1,
soh.SubTotal,
(soh.SubTotal * 0.15) Impuesto,
soh.SubTotal + (soh.SubTotal * 0.15) Total,
soh.TerritoryID
FROM Sales.SalesOrderHeader soh
JOIN Person.Address a 
	ON a.AddressID = soh.ShipToAddressID
JOIN Sales.SalesTerritory st 
	ON st.TerritoryID = soh.TerritoryID

/**
Ejercicio 4, guia 2.
Listar el detalle de las siguientes ordenes 43659,43660,43661
a. CarrierTrackingNumber
b. Descripcion del producto
c. Cantidad
d. Precio Unitario
e. Impuesto : 15% del precio unitario 
f. Precio Total : Para el precio total debe considerar la cantidad el impuesto y el precio 
unitario.
**/

SELECT
sord.SalesOrderID,
	sord.CarrierTrackingNumber CarrierTrackingNumber,
	prod.Name DescripcionProducto,
	sord.OrderQty Cantidad,
	sord.UnitPrice PrecioUnitario,
	(sord.UnitPrice * 0.15) ISV,
	((sord.UnitPrice * 0.15) + sord.LineTotal) PrecioTotal
FROM production.Product prod
JOIN Sales.SalesOrderDetail sord
	ON sord.ProductID = prod.ProductID
WHERE SalesOrderID IN (43659,43660,43661)
ORDER BY sord.SalesOrderID ASC


/**
Ejercicio 5, guia 2.
Mostrar todas las ordenes realizadas del 1 de enero del 2005 al 31 de enero del 2005.
a. Número de orden
b. Número de cuenta
c. CustomerId
d. BillToAddressID
e. Dirección donde llega la factura(BillToAddress)
**/

SELECT 
soh.SalesOrderID NumeroOrden,
soh.SalesOrderNumber NumeroCuenta,
soh.CustomerID CustomerID,
soh. BillToAddressID BillToAddressID,
adrl.AddressLine1 DireccionDeFacturacion
FROM Sales.SalesOrderHeader soh
JOIN Person.Address adrl 
	ON adrl.AddressID = soh.BillToAddressID
WHERE CONVERT(date, OrderDate) 
BETWEEN '2005-01-1' AND '2005-01-31'


/**
Ejercicio 6, guia 2.
Listar las órdenes del territorio 5 y 3 ordenadas por la fecha de envío desde las más antigua a la más 
reciente y por el territorio del menor a mayor.
**/

SELECT * FROM Sales.SalesOrderHeader
WHERE 
	(TerritoryID  = '5') OR (TerritoryID  = '3') 
	ORDER BY TerritoryID, ShipDate ASC 

/**
Ejercicio 7, guia 2.
Listar las órdenes cuyo número de cuenta contenga 4030.
**/

SELECT * FROM Sales.SalesOrderHeader WHERE AccountNumber LIKE '%4030%'

/**
Ejercicio 8, guia 2.
Listar el detalle de la orden de la siguiente cuenta(AccountNumbre) 10-4030-019357
**/

SELECT * FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh 
	ON soh.SalesOrderID = sod.SalesOrderID
WHERE AccountNumber = ('10-4030-019357')

/**
Ejercicio 9, guia 2.
Listar el inventario de productos :
1. Cantidad
2. LocationID
3. Descripcion de la ubicacion
**/

SELECT 
	pp.Name NombreProducto,
	prodpi.Quantity Cantidad,
	pl.LocationID,
	pl.Name DescripcionUbicacion
FROM Production.ProductInventory prodpi
JOIN Production.Location pl 
	ON pl.LocationID = prodpi.LocationID
JOIN Production.Product pp
	ON pp.ProductID = prodpi.ProductID
