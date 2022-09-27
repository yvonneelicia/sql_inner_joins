-- Joining Tables --

/* 
Inner Joins
Also known as equijoin, is a join based on the testing of equality between two tables.
*/

-- Join using where clause --
SELECT c.customerNumber,c.customerName, o.orderNumber
FROM classicmodels.customers as c, classicmodels.orders as o
WHERE o.customerNumber=c.customerNumber;

-- Join using inner join clause --
SELECT c.customerNumber,c.customerName, o.orderNumber
FROM classicmodels.customers as c
INNER JOIN classicmodels.orders as o
ON o.customerNumber=c.customerNumber;

-- Joining multiple tables using WHERE clause--
SELECT c.client_id, i.invoice_id, p.amount, p.payment_method, i.invoice_total
FROM sql_invoicing.clients as c, sql_invoicing.payments as p, sql_invoicing.invoices as i
WHERE c.client_id=p.client_id
AND p.invoice_id=i.invoice_id
AND payment_method = 2; -- condition --

-- Joing multiple tables using INNER JOIN clause --
SELECT c.client_id, i.invoice_id, p.amount, p.payment_method, i.invoice_total
FROM sql_invoicing.clients as c
INNER JOIN sql_invoicing.payments as p 
ON p.client_id=c.client_id
INNER JOIN sql_invoicing.invoices as i 
ON i.invoice_id=p.invoice_id
WHERE payment_method=1; -- condition --
