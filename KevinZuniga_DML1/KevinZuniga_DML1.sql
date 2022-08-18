USE AdventureWorks2019

/**
Resumen de empleados por departamento :Se solicita la información del total de 
empleados que tiene cada departamento,debe contener los siguientes campos
a. Nombre de departamento
b. Número de empleados que posee
**/


SELECT 
	d.NAME, 
	COUNT(*) TotalEmpleado 
FROM HumanResources.EmployeeDepartmentHistory hedh
	JOIN HumanResources.Department d ON d.DepartmentID = hedh.DepartmentID
WHERE EndDate IS NULL
	GROUP BY d.NAME
	ORDER BY COUNT(*) DESC

/**
Resumen de ventas por territorio: Se necesita mostrar el total de ventas por 
territorio, los campos que se deben mostrar son:
a. Nombre Territorio
b. TotalVentasTerritorio
**/

SELECT
	sst.Name NombreTerritorio,
	SUM(ssoh.TotalDue) TotalVentasTerritorio
FROM Sales.SalesTerritory sst
JOIN Sales.SalesOrderHeader ssoh ON sst.TerritoryID = ssoh.TerritoryID
	GROUP BY sst.Name
	ORDER BY sst.Name


/**
Resumen de ventas por territorio y año: Se necesita mostrar el total de ventas por 
territorio y año, los campos que se deben mostrar son:
a. Nombre Territorio
b. Año
c. TotalVentasTerritorio
**/

SELECT 
	sst.Name NombreTerritorio,
	DATEPART(YEAR,orderdate) Año,
	SUM(ssoh.TotalDue) TotalVentasTerritorio
FROM sales.SalesTerritory sst
	JOIN sales.salesorderheader ssoh ON ssoh.TerritoryID = sst.TerritoryID
	GROUP BY sst.Name,DATEPART(Year,orderdate)
	ORDER BY sst.Name,DATEPART(Year,orderdate) ASC


/**
Información general de personas: Mostrar los datos de la persona, los campos 
requeridos son
a. NombreCompletoPersona
b. TelefonoCelular
c. DireccionHogar
**/

SELECT 
	pp.firstname + ' ' + ISNULL(pp.middlename, '') + ' ' + pp.lastname NombreCompletoPersona,
	ppp.PhoneNumber TelefonoCelular,
	pa.AddressLine1 DireccionHogar
FROM Person.BusinessEntityAddress pbea
	JOIN Person.Person pp ON pp.BusinessEntityID = pbea.BusinessEntityID
	JOIN Person.PersonPhone ppp ON ppp.BusinessEntityID = pbea.BusinessEntityID
	JOIN Person.Address pa ON pa.AddressID = pbea.AddressID
WHERE ppp.PhoneNumberTypeID = 1 AND pbea.AddressTypeID = 2
	ORDER BY pp.firstname + ' ' + ISNULL(pp.middlename, '') + ' ' + pp.lastname ASC