DROP TABLE Employee

-- Create a table with required attributes
CREATE TABLE Employee (
    Id NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Salary NUMBER
);
SELECT * FROM Employee;

-- Insert 3 records
INSERT INTO EMPLOYEE VALUES 
(1, 'Adam', 50000),
(2, 'Ben', 55000),
(3, 'Charlie', 48000);
SELECT * FROM Employee;

-- Declare CURSOR to extract and display values
DECLARE
    Id Employee.Id%TYPE;
    Name Employee.Name%TYPE;
    Salary Employee.Salary%TYPE;
    CURSOR CURSOR_Employee IS SELECT Id, Name, Salary FROM Employee;
BEGIN
    OPEN CURSOR_Employee;
    LOOP
        FETCH CURSOR_Employee INTO Id, Name, Salary;
        EXIT WHEN CURSOR_Employee%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Id: ' || Id || ', Name: ' || Name || ', Salary: ' || Salary);
    END LOOP;
    CLOSE CURSOR_Employee;
END;
