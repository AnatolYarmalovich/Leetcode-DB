/*
 1757. Recyclable and Low Fat Products

Table: Products

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
product_id is the primary key for this table.
low_fats is an ENUM of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.


Write an SQL query to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+
Output:
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: Only products 1 and 3 are both low fat and recyclable.
 */

CREATE TYPE LowFats AS ENUM ('Y', 'N');
CREATE TYPE Recyclable AS ENUM ('Y', 'N');

CREATE TABLE IF NOT EXISTS Products
(
    product_id int,
    low_fats   LowFats,
    recyclable Recyclable
);
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, low_fats, recyclable)
VALUES ('0', 'Y', 'N');
INSERT INTO Products (product_id, low_fats, recyclable)
VALUES ('1', 'Y', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable)
VALUES ('2', 'N', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable)
VALUES ('3', 'Y', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable)
VALUES ('4', 'N', 'N');

SELECT product_id
FROM Products
WHERE recyclable = 'Y'
  AND low_fats = 'Y';