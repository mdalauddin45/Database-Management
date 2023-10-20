USE assignment;

CREATE TABLE Student(
	Roll CHAR(4) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(60) UNIQUE,
    Adress VARCHAR(255),
    Age INT
);


SELECT * FROM Student;

CREATE TABLE Library(
	Book_Name VARCHAR(50) PRIMARY KEY,
    Whohired_Roll CHAR(4),
    FOREIGN KEY(Whohired_Roll) REFERENCES Student(Roll)
);

SELECT * FROM  Library;


CREATE TABLE Fees(
	fee_id INT PRIMARY KEY,
    student_id CHAR(4),
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(Roll)
);

SELECT * FROM  Fees;

CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Age INT,
    Department VARCHAR(100)
);

INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(1,'JHON','DOE',28,'Sales');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(2,'JANE','Smith',32,'Marketing');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(3,'Michael','Johnson',35,'Finance');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(4,'Sarah','Brown',30,'HR');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(5,'William','Davis',25,'Engineering');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(6,'Emily','Wilson',28,'Salse');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(7,'Robert','Lee',33,'Marketing');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(8,'Laura','Hall',29,'Finance');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(9,'Thomas','White',32,'HR');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Age, Department)
VALUES(10,'Olivia','Clark',27,'Engineering');

-- In MySQL, Update and Delete query was not executing if This statement did not set the SQL_SAFE_UPDATES mode to 0, which did not disable the safe update mode.
-- and This statement sets the SQL_SAFE_UPDATES mode back to 1, which enables the safe update mode again. 

SET SQL_SAFE_UPDATES = 0;
UPDATE Employee
SET FirstName = 'ALAUDDIN'
WHERE EmployeeID = 1; 
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Employee
WHERE EmployeeID=2;
SET SQL_SAFE_UPDATES = 1;


SELECT DISTINCT Department FROM Employee;

SELECT LastName FROM Employee
ORDER BY Age DESC;

SELECT LastName FROM Employee
WHERE Age > 30 AND Department = 'Marketing';

SELECT * FROM Employee;

SELECT * FROM Employee
WHERE FirstName LIKE '%son%' OR LastName LIKE '%son%';

SELECT * FROM Employee
WHERE Department = 'Engineering';


