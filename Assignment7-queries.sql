-- 1- from “orderdetails” table. Write a query to get the total payment for each order.
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS orderTotal
FROM orderdetails
GROUP BY orderNumber
ORDER BY orderTotal DESC;

-- 2- from “employees” table. Write a query to get the full name of all employees side by side with the full name of their managers. The employee number of the manager is stored in “reportsTo” column.
SELECT CONCAT( emp.firstName, ' ' , emp.lastName) AS empName , CONCAT(mang.firstName, ' ' ,mang.lastName) AS mangName 
FROM employees AS emp JOIN employees AS mang
ON  emp.reportsTo = mang.employeeNumber;

-- 3-Write a query to get all employees who work in the London office (using subqueries)
SELECT firstName, lastName,officeCode FROM employees
WHERE officeCode IN 
(SELECT officeCode 
FROM offices 
WHERE city = 'London');

-- 4- Write a query to get all employees who work in the London office (using joins).
SELECT employees.firstName, employees.lastName,offices.city FROM employees
JOIN (SELECT * FROM offices  WHERE city = 'London')
offices ON offices.officeCode =  employees.officeCode;

-- 5- From “customers”, “orders” and “orderdetails” tables. Write a query to get all customer names and the total amount they paid.
SELECT customers.customerName ,orders.orderNumber,orders.status ,SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS orderTotal 
FROM customers JOIN orders JOIN orderdetails
ON customers.customerNumber = orders.customerNumber 
AND orders.orderNumber = orderdetails.orderNumber;