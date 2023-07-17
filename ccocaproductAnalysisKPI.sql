CREATE DEFINER=``@`%` PROCEDURE `ccoca_productsKPI`(IN qord int, ttc int)
BEGIN
    DECLARE v1 INT;
    DECLARE v2 INT;
    SET v1 = qord; 
    SET v2 = ttc; 
    
    CREATE TABLE ccocaProductsKPI AS (
		SELECT c.customerName, od.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach, (od.quantityOrdered * od.priceEach) AS Total_Cost
		FROM b_vargas.customers c
			INNER JOIN ccoca.orders o ON c.customerNUmber = o.customerNumber
			INNER JOIN ccoca.orderdetails od ON o.orderNumber = od.orderNumber
			INNER JOIN ccoca.products p ON od.productCode = p.productCode
		WHERE quantityOrdered >= qord AND (od.quantityOrdered * od.priceEach) >= ttc
		ORDER BY (od.quantityOrdered * od.priceEach) DESC ); 
END