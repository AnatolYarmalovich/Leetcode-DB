/*
 181. Employees Earning More Than Their Managers

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.


Write an SQL query to find the employees who earn more than their managers.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output:
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
 */

CREATE TABLE IF NOT EXISTS Employee
(
    id        int,
    name      varchar(255),
    salary    int,
    managerId int
);
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, name, salary, managerId)
VALUES ('1', 'Joe', '70000', '3');
INSERT INTO Employee (id, name, salary, managerId)
VALUES ('2', 'Henry', '80000', '4');
INSERT INTO Employee (id, name, salary, managerId)
VALUES ('3', 'Sam', '60000', NULL);
INSERT INTO Employee (id, name, salary, managerId)
VALUES ('4', 'Max', '90000', NULL);

SELECT e.name AS Employee
FROM Employee e
WHERE e.managerId IS NOT NULL
  AND salary > (SELECT e2.salary
                FROM Employee e2
                WHERE e.managerId = e2.id);