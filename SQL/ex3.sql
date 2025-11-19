USE mgmtsys;

INSERT INTO Employee
VALUES (1, 'john.doe@example.com', 'John', 'Doe', '1990-05-10', 40, 55000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
VALUES (2, 'kathryneaton@example.org', 'Kathrylll', 'Neaton', '1990-05-10', 40, 55000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
SELECT 3, 'dlopez@example.org', 'Dwight', 'Lopez', '1985-07-25', 35, 60000.00;

SELECT * FROM Employee;
