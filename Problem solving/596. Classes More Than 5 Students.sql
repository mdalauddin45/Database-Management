-- # Write your MySQL query statement below
SELECT CLASS
    FROM COURSES
    GROUP BY CLASS
    HAVING COUNT(DISTINCT student) >1