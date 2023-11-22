CREATE DATABASE FINALEXAM;
USE FINALEXAM;
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(50),
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL
);

CREATE TABLE Borrowing (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ISBN VARCHAR(13),
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);


INSERT INTO Student (Name, Email, Phone, Address)
VALUES
    ('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, City'),
    ('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, Town'),
    ('Alice Johnson', 'alice.johnson@example.com', '555-555-5555', '789 Oak St, Village'),
    ('Bob Williams', 'bob.williams@example.com', '111-222-3333', '321 Pine St, Suburb'),
    ('Eve Davis', 'eve.davis@example.com', '999-888-7777', '654 Birch St, County');

INSERT INTO Book (ISBN, Title, Author, Genre, TotalCopies, AvailableCopies)
VALUES
    ('9781234567890', 'Sample Book 1', 'John Author', 'Fiction', 5, 3),
    ('9789876543210', 'Another Book', 'Jane Writer', 'Mystery', 10, 7),
    ('9785555555555', 'Adventure Chronicles', 'Robert Novelist', 'Adventure', 8, 4),
    ('9789999999999', 'Science Explained', 'Laura Scientist', 'Science', 15, 12),
    ('9788888888888', 'Historical Journey', 'Michael Historian', 'History', 6, 2);
    
    
INSERT INTO Borrowing (StudentID, ISBN, BorrowDate, DueDate, ReturnDate)
VALUES
	(2, '9789876543210', '2023-11-05', '2023-12-05', NULL),
    (1, '9781234567890', '2023-11-01', '2023-11-30', '2023-11-25'),
    (2, '9789876543210', '2023-11-05', '2023-12-05', NULL),
    (3, '9785555555555', '2023-11-10', '2023-12-10', NULL),
    (4, '9789999999999', '2023-11-15', '2023-12-15', NULL),
    (2, '9781234567890', '2023-11-05', '2023-12-05', NULL),
    (1, '9788888888888', '2023-11-20', '2023-12-20', NULL),
    (1, '9781234567890', '2023-10-01', '2023-11-01', '2023-10-15'),
    (2, '9789876543210', '2023-10-05', '2023-11-05', '2023-10-20'),
    (3, '9785555555555', '2023-10-10', '2023-11-10', '2023-10-25'),
    (4, '9789999999999', '2023-10-15', '2023-11-15', '2023-11-16'),
    (1, '9788888888888', '2023-10-20', '2023-11-20', NULL);



SELECT *
	FROM Student;
    
SELECT *
	FROM BOOK;
    
SELECT *
	FROM Borrowing;
    
UPDATE BOOK
SET AvailableCopies = AvailableCopies -20
WHERE ISBN = '9781234567890';


SELECT 3 AS STUDENTID, B.ISBN, B.TITLE
	FROM BOOK B
	WHERE B.AvailableCopies =(
							SELECT MAX(AvailableCopies)
							FROM BOOK
							);
                            
SELECT S.Name, COUNT(B.StudentID) AS TotalBorrowedBooks
FROM Student AS S
LEFT JOIN Borrowing AS B ON S.StudentID = B.StudentID
GROUP BY S.Name
ORDER BY TotalBorrowedBooks DESC
LIMIT 1;

SELECT B.Title, B.ISBN, B.Author, B.Genre, BO.ReturnDate
	FROM Borrowing AS BO
	JOIN Book AS B 
	ON BO.ISBN = B.ISBN
	WHERE Bo.ReturnDate < CURDATE();

SELECT B.TITLE, B.ISBN, BO.RETURNDATE
	FROM BORROWING AS BO
    JOIN BOOK AS B
    ON BO.ISBN = B.ISBN
    WHERE BO.RETURNDATE < CURDATE();

SELECT ISBN FROM Borrowing
UNION
SELECT ISBN FROM book;


SELECT MIN(Salary) A
FROM Employee
WHERE Salary > (
    SELECT MIN(Salary)
    FROM Employee
);


CREATE TABLE EMPLOYEE (
	EMPLOYEEID INT AUTO_INCREMENT PRIMARY KEY,
    FIRSTNAME VARCHAR(100) NOT NULL,
    LASTNAME VARCHAR(100) NOT NULL,
    SALARY DECIMAL(10, 2) NOT NULL,
    HIREDATE DATE NOT NULL
);
CREATE TABLE JOBHISTORY (
    JOBID INT AUTO_INCREMENT PRIMARY KEY,
    EMPLOYEEID INT,
    JOBTITLE VARCHAR(50) NOT NULL,
    STARTDATE DATE NOT NULL,
    ENDDATE DATE,
    DESCRIPTION TEXT,
    FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEE(EMPLOYEEID) ON DELETE CASCADE
);

INSERT INTO EMPLOYEE (FIRSTNAME, LASTNAME, SALARY, HIREDATE)
VALUES
    ('John', 'Doe', 55000.00, '2023-01-15'),
    ('Jane', 'Smith', 60000.50, '2023-02-20'),
    ('Bob', 'Johnson', 48000.75, '2023-03-10'),
    ('Alice', 'Brown', 52000.25, '2023-04-05');

SELECT *
	FROM EMPLOYEE;

INSERT INTO JOBHISTORY (EMPLOYEEID, JOBTITLE, STARTDATE, ENDDATE, DESCRIPTION)
VALUES
    (1, 'Software Engineer', '2023-01-15', '2023-06-30', 'Worked on web application development'),
    (2, 'Project Manager', '2023-02-20', '2023-05-15', 'Managed software development projects'),
    (3, 'Data Analyst', '2023-03-10', '2023-07-20', 'Performed data analysis and reporting'),
    (4, 'Marketing Specialist', '2023-04-05', NULL, 'Marketing and promotional activities');

SELECT *
	FROM JOBHISTORY;

CREATE TABLE DEPARTMENT (
    DEPARTMENTID INT AUTO_INCREMENT PRIMARY KEY,
    DEPARTMENTNAME VARCHAR(50) NOT NULL
);
    
CREATE TABLE Employee (
    EMPLOYEEID INT AUTO_INCREMENT PRIMARY KEY,
    FIRSTNAME VARCHAR(100) NOT NULL,
    LASTNAME VARCHAR(100) NOT NULL,
    SALARY DECIMAL(10, 2) NOT NULL,
    HIREDATE DATE NOT NULL,
    DEPARTMENTID INT,
    FOREIGN KEY (DEPARTMENTID) REFERENCES DEPARTMENT(DEPARTMENTID) ON DELETE SET NULL
);



SELECT *
	FROM Department;
SELECT *
	FROM Employee;

