# Write your MySQL query statement below
SELECT E.NAME AS "Employee"
    FROM EMPLOYEE AS E
    INNER JOIN EMPLOYEE AS E2
        ON E2.ID = E.MANAGERID
            WHERE E.SALARY > E2.SALARY
            
            
        