-- Create a table Employee containing attributes: Id, Name, Age, Salary
CREATE TABLE Employee (
    Id INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Age INTEGER,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee VALUES
(1, 'Adam', 30, 50000),
(2, 'Ben', 35, 60000),
(3, 'Charlie', 35, 55000),
(4, 'David', 28, 62000),
(5, 'Emily', 40, 70000);
SELECT * FROM Employee;

-- Count the Number of Employees using Id
SELECT COUNT(Id) AS "Number of Employees" FROM Employee;

-- Find the Maximum Age
SELECT MAX(Age) AS "Maximum Age" FROM Employee;

-- Find the Minimum Age
SELECT MIN(Age) AS "Minimum Age" FROM Employee;

-- List employees in Ascending Order of Salary
SELECT Name, Salary FROM Employee ORDER BY Salary ASC;

-- Find Total Salary grouped by Age 
SELECT Age, SUM(Salary) AS "Total Salary" FROM Employee GROUP BY Age;
