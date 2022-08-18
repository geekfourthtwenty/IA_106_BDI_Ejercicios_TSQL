USE AdventureWorks2019

/**
Se necesita saber el resumen de la cantidad de ofertas que se posee cada producto, la 
información mostrada debe ser ordenada de A-Z de acuerdo con el nombre del producto.
**/

SELECT
	pp.NAME,
	COUNT(*) CantidadDeOfertas
FROM Sales.SpecialOfferProduct ssop
	JOIN Production.Product pp ON pp.ProductID = ssop.ProductID
	JOIN Sales.SpecialOffer sso ON sso.SpecialOfferID = ssop.SpecialOfferID
	GROUP BY pp.NAME
	ORDER BY pp.NAME

/**
Listar las órdenes cuyo número de cuenta contenga 4020 y que el mes de la orden sea mayo, 
los campos que debe mostrar son:
1. Mes de la orden
2. Dia de la Orden
3. Año de la orden
4. Total (la fórmula para calcularlo es: Subtotal x 12% + Subtotal)
5. El nombre completo del vendedor: Los nombres están en la tabla Person considere el campo 
SalesPersonID. Se deben manejar los casos que no tenga middleName al momento de 
concatenar no muestre null
**/

SELECT 
DATEPART (MONTH, ssoh.OrderDate) MesDeOrden, DATEPART (DAY,ssoh.OrderDate) DiaDeOrden, DATEPART (YEAR,ssoh.OrderDate) AnioDeOrden,
((ssoh.SubTotal * 0.12) + ssoh.SubTotal) Total,
(pp.FirstName +' '+ ISNULL(pp.MiddleName, '') + ' ' +  pp.LastName) NombreCompletoVendedor
FROM Sales.SalesOrderHeader ssoh
	JOIN Person.Person pp ON ssoh.SalesPersonID = pp.BusinessEntityID
WHERE AccountNumber LIKE '%4020%' 
	AND DATEPART (MONTH, ssoh.OrderDate) = 5