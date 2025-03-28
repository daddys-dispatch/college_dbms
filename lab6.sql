-- Create table A
CREATE TABLE Employee_A (
    Id NUMBER,
    Name VARCHAR2(50),
    Salary DECIMAL(10, 2)
);

-- Insert record into table A
INSERT INTO Employee_A VALUES
(1, 'Adam', 45000.00),
(2, 'Ben', 50000.00),
(3, 'Charlie', 40000.00);
SELECT * FROM Employee_A;

-- Create table B
CREATE TABLE Employee_B (
    Id NUMBER,
    Name VARCHAR2(50),
    Salary DECIMAL(10, 2)
);

-- Insert record into table B
INSERT INTO Employee_B VALUES
(4, 'David', 47500.00),
(5, 'Emily', 425000.00),
(6, 'Francis', 45000.00);
SELECT * FROM Employee_B;

-- Declare a cursor to merge table B to A
DECLARE
    Id Employee_B.Id%TYPE;
    Name Employee_B.Name%TYPE;
    Salary Employee_B.Salary%TYPE;
    CURSOR Merge_Employee IS SELECT Id, Name, Salary FROM Employee_B B
    WHERE NOT EXISTS (
        SELECT 1
        FROM Employee_A A
        WHERE A.Id = B.Id
        AND A.Name = B.Name
        AND A.Salary = B.Salary
    );
BEGIN
    OPEN Merge_Employee;
        LOOP
            FETCH Merge_Employee INTO Id, Name, Salary;
            EXIT WHEN Merge_Employee%NOTFOUND;
            INSERT INTO Employee_A (Id, Name, Salary) VALUES (Id, Name, Salary);
        END LOOP;
    CLOSE Merge_Employee;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employees merged from B to A');
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    ROLLBACK;
END;

-- Show merged table
SELECT * FROM Employee_A ORDER BY Id ASC;
