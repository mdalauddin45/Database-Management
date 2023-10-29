-- # Write your MySQL query statement below
SELECT U.UNIQUE_ID AS "unique_id", E.NAME AS "name"
    FROM EMPLOYEES AS E
    LEFT JOIN EMPLOYEEUNI AS U
    ON E.ID = U.ID