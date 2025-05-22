DROP TABLE Employee;

-- Create a table with required attributes
CREATE TABLE Employee (
    Id INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Age INTEGER,
    Salary DECIMAL(10, 2)
);
SELECT * FROM Employee;

-- Insert 4 records
INSERT INTO Employee VALUES
(1, 'Adam', 30, 50000),
(2, 'Ben', 35, 62000),
(3, 'Charlie', 35, 68000),
(4, 'David', 38, 55000);
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
