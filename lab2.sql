DROP TABLE Employee;

-- Create a table with required attributes
CREATE TABLE Employee (
    Id INTEGER PRIMARY KEY,
    Name VARCHAR(50),
    Job VARCHAR(50),
    Salary DECIMAL(10, 2)
);
SELECT * FROM Employee;

-- Add an attribute Commission
ALTER TABLE Employee ADD Commission DECIMAL(10, 2);
SELECT * FROM Employee;

-- Insert 3 records
INSERT INTO Employee VALUES
(1, 'Adam', 'Manager', 80000.00, 5000.00),
(2, 'Ben', 'Analyst', 70000.00, 4000.00),
(3, 'Charlie', 'Salesman', 60000.00, 3000.00);
SELECT * FROM Employee;

-- Update Job details of employees
UPDATE Employee SET Job = 'Senior Manager' WHERE Id = 1;
UPDATE Employee SET Job = 'Senior Analyst' WHERE Id = 2;
UPDATE Employee SET Job = 'Sales Executive' WHERE Id = 3;
SELECT * FROM Employee;

-- Rename an attribute using ALTER
ALTER TABLE Employee RENAME COLUMN Name TO Emp_Name;
SELECT * FROM Employee;

-- Delete an employee
DELETE FROM Employee WHERE Id = 3;
SELECT * FROM Employee;
