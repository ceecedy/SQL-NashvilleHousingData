-- To use the database. Use 'USE' command. 
-- USE employeeDB;

/*
-- To create a table. 
CREATE TABLE employees(
	id INT NOT NULL PRIMARY KEY, 
    firstName varchar(100), 
    lastName varchar(100),
    email varchar(70),
    jobTitle varchar(70),
	age INT,
    hireDate DATE,
    salaryId INT
);

-- Insert values into employees table
INSERT INTO employees (id, firstName, lastName, email, jobTitle, age, hireDate, salaryId)
VALUES
	(1, 'John', 'Doe', 'john.doe@example.com', 'Software Engineer', 30, '2022-01-01', 101),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 'Data Analyst', 25, '2022-02-01', 102),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', 'Database Administrator', 35, '2022-03-01', 103),
    (4, 'Alice', 'Jones', 'alice.jones@example.com', 'Network Engineer', 28, '2022-04-01', 104),
    (5, 'Charlie', 'Brown', 'charlie.brown@example.com', 'Project Manager', 32, '2022-05-01', 105),
    (6, 'Eva', 'White', 'eva.white@example.com', 'Business Analyst', 27, '2022-06-01', 106),
    (7, 'Frank', 'Miller', 'frank.miller@example.com', 'Software Developer', 31, '2022-07-01', 107),
    (8, 'Grace', 'Anderson', 'grace.anderson@example.com', 'Database Analyst', 29, '2022-08-01', 108),
    (9, 'Henry', 'Taylor', 'henry.taylor@example.com', 'System Administrator', 34, '2022-09-01', 109),
    (10, 'Ivy', 'Williams', 'ivy.williams@example.com', 'UX Designer', 26, '2022-10-01', 110),
    (11, 'Jack', 'Moore', 'jack.moore@example.com', 'Software Engineer', 33, '2022-11-01', 111),
    (12, 'Katherine', 'Clark', 'katherine.clark@example.com', 'Data Scientist', 30, '2022-12-01', 112),
    (13, 'Leo', 'Davis', 'leo.davis@example.com', 'IT Manager', 35, '2023-01-01', 113),
    (14, 'Mia', 'Roberts', 'mia.roberts@example.com', 'Business Intelligence Analyst', 28, '2023-02-01', 114),
    (15, 'Noah', 'Martin', 'noah.martin@example.com', 'Software Developer', 31, '2023-03-01', 115);
*/

/*
CREATE TABLE salaries (
	salaryId INT PRIMARY KEY,
    salaryAmt DECIMAL(10, 2),
    effectiveDate DATE,
    id INT NOT NULL REFERENCES employees
);

-- Insert values into salaries table
INSERT INTO salaries (salaryId, salaryAmt, effectiveDate, id)
VALUES 
    (101, 75000.00, '2022-01-01', 1),
    (102, 60000.00, '2022-02-01', 2),
    (103, 80000.00, '2022-03-01', 3),
    (104, 70000.00, '2022-04-01', 4),
    (105, 90000.00, '2022-05-01', 5),
    (106, 65000.00, '2022-06-01', 6),
    (107, 82000.00, '2022-07-01', 7),
    (108, 75000.00, '2022-08-01', 8),
    (109, 88000.00, '2022-09-01', 9),
    (110, 72000.00, '2022-10-01', 10),
    (111, 76000.00, '2022-11-01', 11),
    (112, 95000.00, '2022-12-01', 12),
    (113, 80000.00, '2023-01-01', 13),
    (114, 68000.00, '2023-02-01', 14),
    (115, 89000.00, '2023-03-01', 15);
*/

/*
-- to make changes to a table 
-- you can use alter to make changes on an existing db, table, etc...
*/

-- Successfully created many (employees) to one (salaries) relationship. 

/*
	SELECT STATEMENTS 
    FUNCTIONS - DISTINCT, AS, 
    AGGREGATIONS - AVG, SUM, MIN, MAX, COUNT
    SCALAR - ROUND, CEIL, FLOOR, UPPER, LOWER, CONCAT, NOW, DATE_FORMAT
    STRING FUNCTIONS - CONCAT, SUBSTRING, CHAR_LENGTH, LOWER
    DATE AND TIME FUNC - NOW, CURDATE, CURTIME, DATEDIFF
    
# SELECT ALL in the table to display. 
-- SELECT * 
-- FROM employees;

# SELECT specific field in the table to display. 
-- SELECT firstName, lastName
-- FROM employees;

# SELECT with CONCAT
-- SELECT CONCAT(firstName, ' ', lastName)
-- FROM employees;

# SELECT average in the numeric field in the table. This is known as aggregation. 
-- SELECT AVG(AGE) AS averageAge
-- FROM employees;

# SELECT unique values in a specific field. 
-- SELECT DISTINCT (salaryAmt)
-- from salaries;

# SELECT maximum values in a specific field 
-- SELECT MAX(salaryAmt)
-- FROM salaries;

# SELECT minimum  values in a specific field 
-- SELECT MIN(salaryAmt)
-- FROM salaries;
*/

/*
	WHERE STATEMENTS 
    FUNCTIONS (=, (!= or <>), >=, <=, AND, OR, LIKE, BETWEEN, IN, NOT, NOT NULL)

# to find employees who ages exactly 30. 
-- SELECT * 
-- FROM employees 
-- WHERE age = 30;

# to find employees who ages exactly 30 or greater than 30. 
-- SELECT * 
-- FROM employees 
-- WHERE age >= 30;

# to find employees who ages exactly 30 or less than 30. 
-- SELECT * 
-- FROM employees 
-- WHERE age <= 30;

# to find employees who ages exactly 50 or less than 50 and their 
# first name should be 'a' in the second letter and any characters afterwards. 
-- SELECT * 
-- FROM employees 
-- WHERE age <= 50 AND firstName LIKE '_a%';

# to select all employees who's name is not 'Jane'.
-- SELECT * 
-- FROM employees 
-- WHERE firstName != 'Jane'

# to select all employees who's name in the list is 'John', 'Charlie', 'Frank', 'Henry'.
-- SELECT * 
-- FROM employees 
-- WHERE firstName IN ('John', 'Charlie', 'Frank', 'Henry');

# to select all employees who's name in the list are not 'John', 'Charlie', 'Frank', 'Henry'. 
-- SELECT * 
-- FROM employees 
-- WHERE firstName NOT IN ('John', 'Charlie', 'Frank', 'Henry');

# to select all employee id who are not null. 
-- SELECT id 
-- FROM employees 
-- WHERE id IS NOT NULL;

# to select all employee id who is null. 
-- SELECT id 
-- FROM employees 
-- WHERE id IS NULL;
*/

/*
	Problem Set #1
    Retrieve Employee Information:
		Write a SQL query to retrieve the details (first name, last name, email, job title, and age) 
		of employees who have a job title of 'Manager' and are above 30 years old.
	Answer:
		-- SELECT firstName, lastName, email, jobTitle, age 
		-- FROM employees 
		-- WHERE jobTitle LIKE '%Manager' AND age > 30;
        
	Calculate Average Salary:
	Write a SQL query to calculate the average salary of employees hired after a specific date, let's say, '2023-01-01'.
    Answer: 
		-- SELECT 
			-- e.firstName, 
			-- e.lastName, 
			-- AVG(s.salaryAmt) as averageSal
		-- FROM 
			-- employees as e 
			-- LEFT JOIN 
			-- salaries as s 
			-- ON e.id = s.id
		-- WHERE 
			-- e.hireDate > '2023-01-01'
		-- GROUP BY 
			-- e.firstName, 
			-- e.lastName;
    
    Update Salary:
		Update the salary amount for employees with a job title of 'Engineer' to increase it by 10%. 
		Ensure that the effective date for this salary update is the current date.
	Answer: 
        -- To update a record and with sub-query
			-- UPDATE salaries 
			-- SET salaryAmt = salaryAmt * 1.1
			-- WHERE id IN (
				-- SELECT id 
				-- FROM employees
				-- WHERE jobTitle LIKE '%Engineer'
				);

			-- UPDATE salaries 
			-- SET effectiveDate = CURRENT_DATE
			-- WHERE id IN (
				-- SELECT id 
				-- FROM employees
				-- WHERE jobTitle LIKE '%Engineer'
				);
		-- Checking the updates. 
			-- SELECT 
				-- e.firstName, 
                -- e.lastName, 
                -- e.jobTitle,
                -- s.salaryAmt,
				-- s.effectiveDate
			-- FROM
				-- employees as e
				-- LEFT JOIN 
				-- salaries as s 
				-- ON 
					-- e.id = s.id 
			-- WHERE 
				-- jobTitle LIKE '%Engineer';
	
    Identify Overlapping Salaries:	
		Write a query to identify employees who have overlapping salary records. 
		An overlap occurs when the effective date of a salary record is within the range of another salary record for the same employee.
	Answer: 
		-- To self-join 
			-- SELECT 
				-- a.id as emp_id, 
				-- a.effectiveDate as startdate1,
				-- a.salaryAmt as salary1,
				-- b.effectiveDate as startdate2,
				-- b.salaryAmt as salary2
			-- FROM 
				-- salaries as a
				-- JOIN 
				-- salaries as b
			-- ON 
				-- a.id = b.id
				-- AND a.effectiveDate < b.effectiveDate 
				-- AND b.effectiveDate < DATE_ADD(a.effectiveDate, INTERVAL 1 DAY)
	
    Find Highest Paid Employee:
		Retrieve the details of the employee who has the highest salary as of the latest effective date recorded in the 'salaries' table. 
		Include their first name, last name, email, job title, and salary amount.
	Answer: 
		-- SELECT 
			-- e.firstName, 
			-- e.lastName,
			-- e.jobTitle, 
			-- s.salaryAmt AS highestSal
		-- FROM 
			-- employees AS e
			-- LEFT JOIN
			-- salaries AS s
			-- ON 
				-- e.id = s.id 
		-- WHERE 
			-- s.salaryAmt = (
				-- SELECT MAX(salaryAmt)
				-- FROM salaries
				-- WHERE effectiveDate = CURRENT_DATE
			-- );
    
    IMPORTANTS:    
	-- To disable safe updates in the query
	-- SET SQL_SAFE_UPDATES = 0;
	-- To enable safe updates in the query
	-- SET SQL_SAFE_UPDATES = 1;
*/

/*
	GROUP BY AND ORDER BY STATEMENTS
    GROUP BY: 
		FUNCTIONS - HAVING
		- usually used with aggregate functions. 
		- used to combine multiple same data into one. 
	ORDER BY:
		FUNCTIONS - ASC (DEFAULT), DESC. 
        - used to order the results on either ascending or descending. 
    
	GROUP BY SAMPLE: 
    - This shows all the ages available in the employees table and 
    - count the data of similar ages that gets combined using group by. 
    -- SELECT age, count(age) as age_count
	-- FROM employees
	-- GROUP BY age;
    
    - USAGE OF HAVING 
		- SELECT age, COUNT(age) as age_count 
		- FROM employees 
		- GROUP BY age
		- HAVING COUNT(age) = 2;
    
    ORDER BY SAMPLE: 
    - SELECT 
		- age,
		- COUNT(age) AS age_count
	- FROM 
		- employees 
	- WHERE 
		- age > 20 
	- GROUP BY 
		- age
	- ORDER BY 
		- age DESC;
*/

/*
	JOINS 
		FUNCTIONS - JOIN, INNER JOIN, LEFT JOIN, RIGHT JOIN, OUTER JOIN, FULL JOIN (AVAIALBLE IN MS SQL)
	
    - LEFT JOIN
		- SELECT 
			- e.firstName, 
			- e.lastName, 
			- e.jobTitle, 
			- e.age, 
			- s.salaryAmt,
			- s.effectiveDate
		- FROM 
			- employees as e
			- LEFT JOIN 
			- salaries as s 
			- ON
			- e.Id = S.id
            
	- RIGHT JOIN
		- SELECT 
			- e.firstName, 
			- e.lastName, 
			- e.jobTitle, 
			- e.age, 
			- s.salaryAmt,
			- s.effectiveDate
		- FROM 
			- employees as e
			- RIGHT JOIN 
			- salaries as s 
			- ON
			- e.Id = S.id
	
    - INNER JOIN
		- SELECT 
			- e.firstName, 
			- e.lastName, 
			- e.jobTitle, 
			- e.age, 
			- s.salaryAmt,
			- s.effectiveDate
		- FROM 
			- employees as e
			- INNER JOIN 
			- salaries as s 
			- ON
			- e.Id = S.id;
            
    - FULL JOIN (USING UNION)
		- SELECT 
			- e.id,
			- s.salaryId
		- FROM 
			- employees as e
			- LEFT JOIN 
			- salaries as s 
			- ON
			- e.Id = S.id
    
		- UNION 

		- SELECT 
			- e.id,
			- s.salaryId
		- FROM 
			- employees as e
			- RIGHT JOIN 
			- salaries as s 
			- ON
			- e.Id = S.id;
            
		- CROSS JOIN 
			- SELECT * 
			-FROM 
				- employees e
				- CROSS JOIN 
				- salaries
				- ORDER BY e.id; 
                
		- SELF JOIN
			- SELECT 
				- s1.id AS employee1_id, s1.salaryAmt AS employee1_salary,
				- s2.id AS employee2_id, s2.salaryAmt AS employee2_salary
			- FROM 
				- salaries s1
				- JOIN 
				- salaries s2 
				- ON 
				- s1.salaryAmt = s2.salaryAmt AND s1.id < s2.id
			- ORDER BY 
				-s1.id;
*/

/*
	CASE STATEMENTS 
		- It is usually performed in the SELECT STATEMENT. 
        - Returns predefined output based on conditions. 
        
	Example: 
		- SELECT 
			- *, 
			- CASE 
				- WHEN age > 30 THEN "Juvenile"
				- WHEN age >= 20 OR age <= 30 THEN "Rookie"
				- ELSE age
			- END ageDesc -> The case table name. 
		- FROM 
			- employees; 
*/

/*
	To update a data in a table use the UPDATE keyword: 
		UPDATE [table_name]
        SET [field_name] = [value]
        WHERE [primary_key] = [value]
	
    To insert new record in the table, use INSERT keyword: 
		INSERT INTO [table_name] values 
			(value_1, value_2, value_3); -> This should be respective according to the fields of the table.
		
        -- MULTIPLE INSERTION -- 
        INSERT INTO [table_name] values 
			(value_1, value_2, value_3), -> This should be respective according to the fields of the table.
            (value_1, value_2, value_3), -> This should be respective according to the fields of the table.
            (value_1, value_2, value_3); -> This should be respective according to the fields of the table.
	
    To delete a record in the table, use DELETE keyword: 
		DELETE FROM [table_name]
        WHERE [condition (can be any field)] = [value]
*/

/*
	WINDOWING: 
		- Windowing functions are used to perform calculations 
			on a specific set or "window" of rows in your result set.
		- They use the "OVER" keyword to define this window.
        
		PARTITION BY:
			- The PARTITION BY keyword divides your result set into groups 
				or "partitions" based on one or more columns.
			- It doesn't group or combine rows like GROUP BY does; 
				instead, it creates separate sections for calculations.
		
        How it Works?
			- For each row, the windowing function performs 
				its calculation within the defined window or partition.
			- The result of this calculation is then added as a new column in your result set.
		
        Example - ROW_NUMBER():
			- ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) 
            - assigns a unique number to each row within its department, based on salary order.
            
		- SELECT 
			- e.firstName,
			- e.lastName, 
			- e.jobTitle,
			- s.salaryAmt,
			- RANK() OVER (PARTITION BY e.jobTitle ORDER by s.salaryAmt DESC) AS salaryRankings
		- FROM 
			- employees e
			- INNER JOIN 
			- salaries s 
			- ON 
				- e.id = s.id; 
		
        FUNCTIONS: 
			- ROW_NUMBER(), RANK(), DENSE_RANK(), LEAD(column) AND LAG(column), 
				FIRST_VALUE(column) AND LAST_VALUE(column), SUM(), AVG(), 
                COUNT(), MAX(), MIN()
*/

/*
	COMMON TABLE EXPRESSIONS cte: 
		- Just like in programming languages, it is a defined function
			that can be used in your from statement instead on the full tables. 
		
        Syntax: 
			- WITH [cte name] AS (
				[your SQL script]
            )
		
        Example: 
			- WITH name_age AS (
				- SELECT 
					- firstName, 
					- lastName, 
					- age 
				- FROM 
					- employees 
				- WHERE 
					- jobTitle LIKE 'Data%'
			)

			- SELECT * 
			- FROM 
				- name_age 
			- WHERE 
				- age > 20;
*/

/*
	TEMPORARY TABLES 
		Syntax: 
			CREATE TEMPORARY TABLE [table_name] (
				[field],
				[field]
            );
		
        Example: 
			- CREATE TEMPORARY TABLE departments (
				- departmentId INT, 
				- deptDesc VARCHAR(100)
			- );
            
            - INSERT INTO departments VALUES 
				- (1, 'Software engineering Department'),
				- (2, 'Data Analytics and Science Department'),
				- (3, 'Test Automation Engineering Department');
			
			- You can even create a subquery and that subquery will be inserted as a data 
				in your temporary table. 
			- INSERT INTO departments VALUES 
				- SELECT *
                - FROM employees;
*/

/*
	Problem Set #2 
		Problem 1: Employee Age Grouping
			- You have been tasked with categorizing employees into different age groups. 
				Create a SQL query to display the number of employees in each age group along with the age group range. 
				The age groups should be defined as follows:
					18-25 years
					26-35 years
					36-45 years
					46-55 years
					56 and above
			- Your query should return two columns: "AgeGroup" and "NumberOfEmployees," 
				displaying the age group range and the count of employees in each group. 
                Ensure that the age groups are inclusive of both ends.
		
		Answer: 
			- SELECT 
				- CASE
					- WHEN age >= 18 AND age <= 25 THEN '18-25 years'
					- WHEN age >= 26 AND age <= 35 THEN '26-35 years'
					- WHEN age >= 36 AND age <= 45 THEN '36-45 years'
					- WHEN age >= 46 AND age <= 55 THEN '46-55 years'
					- ELSE '56 and above'
				- END AgeGroup, 
				- COUNT(age) as NumberOfEmployees
			- FROM 
				- employees
			- GROUP BY 
				- AgeGroup; -- Or you can use the case statement here. 
		
        Problem 2 (Revised): Highest Salary by Job Title
			Write a SQL query to find the employee with the highest salary for each job title. Display the job title, 
            employee's first name, last name, and their corresponding salary. Your query should return four columns: 
            "JobTitle," "FirstName," "LastName," and "Salary." Ensure that the result includes only one employee per job title, 
            specifically the one with the highest salary. If there are multiple employees with the same highest salary for a job title, 
            include all of them in the result.

			Hint: You may need to use the RANK() window function to assign a rank to each employee based on their salary within each job title.
			Note: This revision assumes that the "salaries" table doesn't provide historical data for salary changes, 
            and thus we're focusing on the current salary information.
            
		Answer:
			- WITH highSal AS (
				- SELECT 
					- jobTitle, 
					- firstName,
					- lastName, 
					- salaryAmt,
					- RANK() OVER (PARTITION BY jobTitle ORDER BY salaryAmt DESC) as highestSalary
				- FROM 
					- employees 
					- INNER JOIN 
					- salaries 
					- ON	
						- employees.id = salaries.id
			- )

			- SELECT 
				- jobTitle, 
				- firstName,
				- lastName, 
				- salaryAmt
			- FROM 
				- highSal
			- WHERE 
				- highestSalary = 1;
                
		Problem 3: Salary Rank within Job Title
			Consider the employees and salaries tables. Write a SQL query to find the rank of each employee's 
            salary within their job title based on the effective date of the salary. Order the results by jobTitle, effectiveDate in 
            descending order, and then by the employee's salary in descending order. The output should include the columns id, firstName, 
            lastName, jobTitle, salaryAmt, effectiveDate, and salaryRank.
            
		Answer: 
			- SELECT
				- e.id,
				- e.firstName,
				- e.lastName,
				- e.jobTitle,
				- s.salaryAmt,
				- s.effectiveDate,
				- RANK() OVER (PARTITION BY e.jobTitle ORDER BY s.effectiveDate DESC) AS salaryRank
			- FROM 
				- employees e 
				- INNER JOIN 
				- salaries s 
				- ON
					- e.id = s.id;
		
        Problem 4: Identifying Seniority Based on Hire Date
			Consider the employees table. Write a SQL query to determine the seniority of each employee based on their hire date. 
            Calculate the number of employees hired before each employee within the same job title. Order the results by jobTitle, hireDate, 
            and then by id. The output should include the columns id, firstName, lastName, jobTitle, hireDate, and seniority.

			In this problem, you'll use a window function to calculate the number of employees hired before each employee with the same job title. 
            This can provide a sense of seniority within the company for each employee based on their job title and hire date.
            
		Answer: 
			- SELECT
				- e.id,
				- e.firstName,
				- e.lastName,
				- e.jobTitle,
				- e.hireDate,
				- ROW_NUMBER() OVER (PARTITION BY e.jobTitle ORDER BY e.hireDate, e.id) AS seniority
			- FROM 
				- employees e;
*/

/*
	String Functions: 
		TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
		
        TRIM syntax: 
			- SELECT TRIM([BOTH [VALUE]] FROM | LEADING [VALUE] TRAILING) AS [name_of_the_field]
		e.g.1
        -- Trim 1: 
			- SELECT TRIM(BOTH ' ' FROM '   Doe   ')
			- FROM employeeErrors
			- WHERE id = 1;
		e.g.2
		-- Trim 2:
			- SELECT TRIM('  Doe  ')
			- FROM employeeErrors
			- WHERE id = 1;
		-- At trim 2, if there's no declared leading or trailing, it will trim the trailing by default.
        e.g.3
        -- Ltrim: 
			- SELECT LTRIM(' Doe')
			- FROM employeeErrors;
		e.g.4
        -- Rtrim:
            - SELECT RTRIM('Doe ')
			- FROM employeeErrors;
		e.g.5
        -- CONCAT:
            - SELECT CONCAT(RTRIM('Doe '), firstName)
			- FROM employeeErrors;
		e.g.6
        -- CONCAT_WS - This concatenates string with specified separator (separator is the first argument).
			- SELECT CONCAT_WS('-', firstName, lastname)
			- FROM employeeErrors;
        e.g.7
        -- UPPER() and LOWER()
			- SELECT UPPER(firstname) AS BigFirst, LOWER(lastName) AS smallLast
			- FROM employeeErrors;
		
        REPLACE syntax: 
			- SELECT REPLACE([str], [find_string], [replace_with]) AS newString
		e.g.8
        -- Replace 1
			- SELECT REPLACE('doe - doe', '- doe', 'nut')
			- FROM employeeErrors
			- WHERE id = 3;
		e.g.9
        SUBSTRING syntax:
			- SUBSTRING(str, start_position, length)
		-- Substring 1
			- SELECT SUBSTRING('doe - doe', 1, 5) -> The second and third argument is the start and end position respectively. 
			- FROM employeeErrors
			- WHERE id = 3;
		-- Substring 2
			- SELECT SUBSTRING('doe - doe', 5) -> If there's only two arguments, the last one is the starting position to show till the end. 
			- FROM employeeErrors
			- WHERE id = 3;
*/	

/*
	STORED PROCEDURE: 
		This is a procedure stored in the system that can be called by anyone who are interacting in the 
        particular database. It is like defining a method or a function in some programming languages.
        
        Syntax:
		DELIMITER // -> This is important in mysql since the body of the stored procedure has to have delimiter in the end, 
					 -> and also the end of the stored procedure.
                     -> Delimeter of the query body and the stored procedure body have to be different. 
		CREATE PROCEDURE [procedure_name]([parameters])
        BEGIN
			[Query];
        END //
        
        Example #1: No Parameter  
        DELIMITER //
		CREATE PROCEDURE get_employee_info()
		BEGIN
			SELECT *
			FROM employees;
		END //get_employee_infoget_employee_info
        
        Example #2: With Multiple Parameters
        DELIMITER //
		CREATE PROCEDURE get_employee_info(IN e_id INT, IN e_age INT)
		BEGIN
			SELECT *
			FROM employees
            WHERE id = e_id AND age = e_age;	 
		END //get_employee_infoget_employee_info
        
        To drop it: 
        DROP PROCEDURE IF EXISTS [procedure_name];
		
        Problem: Stored Procedures. 
        1. Create a stored procedure named CalculateAverageSalary that calculates and 
			returns the average salary of employees in a given department. 
            The procedure should take the department ID as a parameter.
            
		Answer:
			DELIMITER //
			CREATE PROCEDURE CalculateAverageSalary(IN d_id INT)
            BEGIN
				SELECT AVG(salary) AS AverageSalary
                FROM salaries
                WHERE dept_id = d_id
            END // 
		
        2. Develop a stored procedure called UpdateEmployeeSalary that updates the salary 
			of an employee based on their current salary and a percentage increase provided as a parameter. 
            The procedure should take employee ID and percentage increase as input.
		
        Answer: 
			DELIMITER //
			CREATE PROCEDURE UpdateEmployeeSalary(IN emp_id INT, IN percent_increase DECIMAL(5,2))
			BEGIN
				DECLARE current_salary DECIMAL(10,2);

				-- Retrieve the current salary of the employee
				SELECT salary INTO current_salary
				FROM employees
				WHERE employee_id = emp_id;

				-- Update the salary based on the percentage increase
				UPDATE employees
				SET salary = current_salary * (1 + percent_increase / 100)
				WHERE employee_id = emp_id;
			END //
			
*/

/*
	VIEWS 
		A view is like a cte but its difference is views is stored in the system where even after the session you can use it again. 
		View is created to simplify the complexity of the query. It is a custom virtual table that is created from the fields of 
        other tables. 
        
        SYNTAX: 
			Creating:
				CREATE VIEW [view_name] AS 
					[query]; 
			
            Dropping: 
				DROP VIEW IF EXISTS [view_name];
			
            UPDATING: 
				UPDATE [view_name] 
				SET [something in query..]
				WHERE [something in query..]; 
		
        EXAMPLE: 
        1. Simple
			CREATE VIEW SimpleView AS
			SELECT column1, column2
			FROM table1;
		
        2. Complex
			CREATE VIEW ComplexView AS
			SELECT column1, AVG(column2) AS avg_column2
			FROM table1
			GROUP BY column1;
		
        Problems: 
			1. Create a view named TopEarners that displays the names and salaries of employees 
				earning more than the average salary in the employees table.
                
			Answer: 
				CREATE VIEW TopEarners 
					SELECT firstname, lastname, salary
                    FROM employees
                    WHERE salary > (SELECT AVG(salary) FROM salaries)
				
                SELECT *
                FROM TopEarners;

			2. Design a view named LatestOrders that includes details from the orders table, 
				showing only orders placed in the last 30 days. Ensure that the view is updatable, 
                allowing new orders to be inserted through the view. 
        
			Answer: 
				CREATE VIEW LatestOrders
					SELECT order 
                    FROM orders 
                    WHERE orderDate >= CURRENT_DATE - INTERVAL 30 DAY
                    WITH CHECK OPTION; -- Essential for the view to be updated. 
				
                SELECT * 
                FROM LatestOrders;
*/

/*
	TRIGGERS 
		This is a procedure that is stored within a system that automatically executed when a certain query is met. 
        some examples of it is the DCL query where you create, update and insert a record. When INSERT is called, 
        the insert trigger will be automatically executed. Same as the other DCL query. 
        
        SYNTAX: 
			CREATE TRIGGER [trigger_name]
			AFTER INSERT
			ON table_name
			FOR EACH ROW
			BEGIN
				[query]
			END;
		
        Example 
			-- Create the employees table
			DROP TABLE IF EXISTS employ;
			CREATE TABLE employ (
				employee_id INT,
				employee_name VARCHAR(100),
				salary DECIMAL(10, 2)
			);

			-- Create the audit_log table
			DROP TABLE IF EXISTS audit_log;
			CREATE TABLE audit_log (
				log_id INT,
				action_type VARCHAR(10),
				employee_id INT,
				employee_name VARCHAR(100),
				audit_date TIMESTAMP
			);

			-- Create the trigger
			DELIMITER //
			CREATE TRIGGER after_insert_audit
			AFTER INSERT
			ON employ
			FOR EACH ROW
			BEGIN
				INSERT INTO audit_log (action_type, employee_id, employee_name, audit_date)
				VALUES ('INSERT', NEW.employee_id, NEW.employee_name, NOW());
			END;
			//
			DELIMITER ;

			INSERT INTO employ (employee_id, employee_name, salary)
			VALUES (1, 'John Doe', 50000);

			SELECT * FROM audit_log;
			SELECT * FROM employ;
			
            Problems: 
				1. Create a trigger named auto_increment_log that automatically logs each new record insertion in a 
                table called main_table into a log table named insert_log. The log should include the auto-incremented
                ID of the new record, the action type ('INSERT'), and the timestamp of the insertion.
			
				Answer: 
					DELIMITER // 
					CREATE TRIGGER auto_increment_log 
					AFTER INSERT 
					ON 
					main_table
					FOR EACH ROW
					BEGIN
						INSERT INTO insert_log  (id, timestamp)
						VALUES ('INSERT', NEW.ID, NEW,timestamp, NOW());
					END // 
                
                2. Design a trigger named cascading_update that, after an update operation on the employees table, automatically 
					updates the corresponding records in the department_summary table. The department_summary table maintains the 
                    total salary for each department.
				
                Answer: 
					DELIMITER // 
                    CREATE TRIGGER cascading update
                    AFTER UPDATE
                    ON 
                    employees 
                    FOR EACH ROW 
                    BEGIN
						UPDATE department_summary
						SET total_salary = (
							SELECT SUM(salary) 
							FROM employees 
							WHERE department_id = NEW.department_id
						)
						WHERE department_id = NEW.department_id;
                    END // 
*/



















