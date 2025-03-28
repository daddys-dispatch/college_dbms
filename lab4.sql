-- Create a table Employee with attributes: Id, Name, Salary
CREATE TABLE Employee (
    Id NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Salary NUMBER
);

-- Create TRIGGER to show Old Salary, New Salary, Salary Difference
CREATE OR REPLACE TRIGGER Salary_Difference_Trigger
AFTER INSERT OR UPDATE OR DELETE ON Employee
FOR EACH ROW DECLARE
    Old_Salary Employee.Salary%TYPE := 0;
    New_Salary Employee.Salary%TYPE := 0;
    Salary_Difference Employee.Salary%TYPE := New_Salary - Old_Salary;
BEGIN
    IF INSERTING THEN
        New_Salary := :NEW.Salary;
    ELSIF UPDATING THEN
        Old_Salary := :OLD.Salary;
        New_Salary := :NEW.Salary;
    ELSIF DELETING THEN
        Old_Salary := :OLD.Salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Old Salary = ' || Old_Salary);
    DBMS_OUTPUT.PUT_LINE('New Salary = ' || New_Salary);
    DBMS_OUTPUT.PUT_LINE('Salary Difference = ' || Salary_Difference);
END;

-- Test INSERT operation
INSERT INTO Employee VALUES (1, 'Adam', 5000);

-- Test UPDATE operation
UPDATE Employee SET Salary = 7500 WHERE Id = 1;

-- Test DELETE operation
DELETE FROM Employee WHERE Id = 1;
