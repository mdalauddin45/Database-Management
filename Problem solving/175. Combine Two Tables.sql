-- # Write your MySQL query statement below
SELECT firstName , lastName ,city , state
FROM PERSON AS P
    LEFT JOIN ADDRESS AS A
        ON P.PERSONID = A.PERSONID