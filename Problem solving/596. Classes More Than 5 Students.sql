-- # Write your MySQL query statement below
SELECT CLASS
    FROM COURSES
    GROUP BY CLASS
    HAVING COUNT(student) >=5