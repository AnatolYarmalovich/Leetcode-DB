/*
 183. Customers Who Never Order
Easy
2K
110
Companies
SQL Schema
Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID and name of a customer.


Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key column for this table.
customerId is a foreign key of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.


Write an SQL query to report all customers who never order anything.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output:
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
 */

CREATE TABLE IF NOT EXISTS Customers
(
    id   int,
    name varchar(255)
);
CREATE TABLE IF NOT EXISTS Orders
(
    id         int,
    customerId int
);
TRUNCATE TABLE Customers;
INSERT INTO Customers (id, name)
VALUES ('1', 'Joe');
INSERT INTO Customers (id, name)
VALUES ('2', 'Henry');
INSERT INTO Customers (id, name)
VALUES ('3', 'Sam');
INSERT INTO Customers (id, name)
VALUES ('4', 'Max');
TRUNCATE TABLE Orders;
INSERT INTO Orders (id, customerId)
VALUES ('1', '3');
INSERT INTO Orders (id, customerId)
VALUES ('2', '1');

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT customerId
                 FROM Orders);