SELECT c.customerName, od.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach, (od.quantityOrdered * od.priceEach) AS Total_Cost
FROM b_vargas.customers c
	INNER JOIN ccoca.orders o ON c.customerNUmber = o.customerNumber
	INNER JOIN ccoca.orderdetails od ON o.orderNumber = od.orderNumber
	INNER JOIN ccoca.products p ON od.productCode = p.productCode
WHERE quantityOrdered >= 50 AND (od.quantityOrdered * od.priceEach) >= 7500
ORDER BY (od.quantityOrdered * od.priceEach) DESC