-- # Write your MySQL query statement below
SELECT EMAIL AS "Email"
    FROM PERSON 
    GROUP BY EMAIL
    HAVING COUNT(*) >1