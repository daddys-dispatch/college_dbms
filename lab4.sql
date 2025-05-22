DROP TABLE Employee;

-- Create a table with required attributes
CREATE TABLE Employee (
    Id NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Salary NUMBER
);
SELECT * FROM Employee;

-- Create TRIGGER to show required information
CREATE OR REPLACE TRIGGER Salary_Difference_Trigger
AFTER INSERT OR UPDATE OR DELETE ON Employee
FOR EACH ROW DECLARE
    Old_Salary Employee.Salary%TYPE := 0;
    New_Salary Employee.Salary%TYPE := 0;
    Salary_Difference Employee.Salary%TYPE;
BEGIN
    IF INSERTING THEN
        New_Salary := :NEW.Salary;
    ELSIF UPDATING THEN
        Old_Salary := :OLD.Salary;
        New_Salary := :NEW.Salary;
        Salary_Difference := :NEW.Salary - :OLD.Salary;
        DBMS_OUTPUT.PUT_LINE('Salary Difference = ' || Salary_Difference);
    ELSIF DELETING THEN
        Old_Salary := :OLD.Salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Old Salary = ' || Old_Salary);
    DBMS_OUTPUT.PUT_LINE('New Salary = ' || New_Salary);
END;

-- Insert a record
INSERT INTO Employee VALUES (1, 'Adam', 5000);

-- Update a record
UPDATE Employee SET Salary = 7500 WHERE Id = 1;

-- Delete a record
DELETE FROM Employee WHERE Id = 1;
