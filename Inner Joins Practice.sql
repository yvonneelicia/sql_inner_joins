-- Inner Join Practice --

/*
Q1. Write a SQL statement to return customer name from the customers table and related order numbers from the orders table,
sorting the result by custimer name then by order number 
*/

SELECT customerName, orderNumber
FROM classicmodels.customers as c
INNER JOIN classicmodels.orders as o
ON o.customerNumber=c.customerNumber
ORDER BY customerName asc, orderNumber asc;

/*
Q2. In addition to returning customer name and order number, 
add a third column named orderTotal containing the total price of each order
*/

SELECT DISTINCT o.orderNumber, c.customerName , SUM(od.quantityOrdered*od.priceEach) as orderTotal
FROM classicmodels.customers as c
INNER JOIN classicmodels.orders as o
ON o.customerNumber=c.customerNumber
INNER JOIN classicmodels.orderdetails as od
ON od.orderNumber=o.orderNumber
GROUP BY 1,2;

/* 
Q3. Write a SQL statement that retrieves the dates when product S10_1678 was ordered using both inner join clause and simple equijoin syntax
*/

-- simple equijoin syntax --
SELECT p.productCode, o.orderDate
FROM classicmodels.products as p, classicmodels.orderdetails as od, classicmodels.orders as o
WHERE od.productCode=p.productCode
AND o.orderNumber=od.orderNumber
AND p.productCode='S10_1678';

-- inner join clause --
SELECT p.productCode, o.orderDate
FROM classicmodels.products as p 
INNER JOIN classicmodels.orderdetails as od
ON od.productCode=p.productCode
INNER JOIN classicmodels.orders as o
ON o.orderNumber=od.orderNumber
WHERE p.productCode='S10_1678';



