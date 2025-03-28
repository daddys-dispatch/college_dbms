-- Create a table Employee containing attributes: Id, Name, Job, Salary
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

-- Insert 5 records
INSERT INTO Employee VALUES
(1, 'Adam', 'Manager', 80000.00, 5000.00),
(2, 'Ben', 'Analyst', 60000.00, 3000.00),
(3, 'Charlie', 'Clerk', 40000.00, 1000.00),
(4, 'David', 'Salesman', 70000.00, 4000.00),
(5, 'Emily', 'Clerk', 38000.00, 800.00);
SELECT * FROM Employee;

-- Update Job details of employees
UPDATE Employee SET Job = 'Senior Manager' WHERE Id = 1;
UPDATE Employee SET Job = 'Senior Analyst' WHERE Id = 2;
UPDATE Employee SET Job = 'Office Clerk' WHERE Id = 3 OR Id = 5;
UPDATE Employee SET Job = 'Sales Executive' WHERE Id = 4;
SELECT * FROM Employee;

-- Rename an attribute using ALTER
ALTER TABLE Employee RENAME COLUMN Name TO Emp_Name;
SELECT * FROM Employee;

-- Delete an employee
DELETE FROM Employee WHERE Id = 5;
SELECT * FROM Employee;
