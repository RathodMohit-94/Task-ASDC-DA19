--Lecture 7

create database adani

use adani

CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Employees
VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'IT', 'Ahmedabad'),
(102, 'Priya Patel', 'priya.patel@gmail.com', 'HR', 'Mumbai'),
(103, 'Amit Shah', 'amit.shah@gmail.com', 'Finance', 'Ahmedabad'),
(104, 'Neha Mehta', 'neha.mehta@gmail.com', 'IT', 'Pune'),
(105, 'Rohan Desai', 'rohan.desai@gmail.com', 'Sales', 'Delhi');


/* 
1.
UPPER() function is used to convert string in UPPERCASE 
2.
LOWER() function is used to convert string in LOWERCASE
3.
LEN() function is used for getting numbers of char in string 
4,
DATALENGHT() function is used for getting used byte of string
5,
CONCAT() is used to connect two different string toghether
6.
CONCAT_WS() 'CONCATE WITH SEPERATOR; is used to predefine the seperator in begginig for multiple values
*/

SELECT 
    employee_name AS Normal ,
    UPPER(employee_name) as UPPERCASE,
    LOWER(employee_name) as lowercase,
    LEN(employee_name) as len_of_string,
    DATALENGTH(employee_name) as byte_count,
    CONCAT(employee_name ,' from ',department) as departemnet_info,
    CONCAT_WS(' | ',employee_id,employee_name,department,email) detailed_info
FROM Employees;

/*
7.
LEFT()
8.
RIGHT()
9.
SUBSTRING()
*/


SELECT 
    LEFT(employee_name,5) AS FIRST_FIVE_CHAR,
    RIGHT(employee_name,5) AS LAST_FIVE_CHAR,
    SUBSTRING(employee_name,5,10) as Extracted_Text
FROM Employees 


/*
10.
CHARINDEX() gives charater position in string
11.
PATINDEX() gives pattern position in string
12.
REPLACE() replace string value 
13.
TRANSLATE() replace individual value in string Like 'a' into 'A' or anything
*/


SELECT 
    employee_name,
    CHARINDEX(' ',employee_name) AS POSITION_OF_CHAR,
    PATINDEX('%a %',employee_name) as postion_of_pattern,
    REPLACE(employee_name ,' ','_') as replaced_value,
    TRANSLATE(employee_name,'a','A') as translated_value
FROM Employees

/*
14.
TRIM() remove irregular spaces from the string 
15.
LTRIM() remove space from start of string
16.
RTRIM() remove space in end of the string
17.
LTRIM()+RTRIM() remove soace in both isde and used in traditional method
*/

select * from Employees;

INSERT INTO Employees VALUES (106,'     Mohit Rathod     ','mohitrathod9328@gmail.com','CEO','Ahmedabad')

select * from Employees;


SELECT
       TRIM(employee_name) as removed_space,
       LTRIM(employee_name) as remove_left_space,
       RTRIM(employee_name) as remove_right_space,
       LTRIM(RTRIM(employee_name)) as remove_both_space
FROM Employees

/*
18.
REVERSE() reverse the string characters
19.
SPACE() TO  GIVE HE SPACE BETWEEN THE CONCAT
20.
REPLICATE() USED FOR REPLICATING STRING VALUES MULTIPLE TIME
21.
FORMAT() USED TO FORMAT STRING OR NUMBER INTO MULTIPLE TYPES
*/


DELETE FROM Employees WHERE employee_id = 106;
GO
SELECT 
    employee_name,
    REVERSE(employee_name) AS REVERSED_STRING,
    CONCAT(employee_id,SPACE(5),employee_name) AS SPACED_CONCAT_COLUMN,
    CONCAT(employee_name,REPLICATE('*',3),email) AS REPLICATED_VALUES
FROM Employees;

SELECT 
FORMAT(1234567890,'N0') AS FORMATTED_NO


/*
22.
STRING_AGG()
23.
STRING_SPLIT()
24.
ASCII()
25.
CHAR()
26.
UNICODE()
27.
NCHAR()
*/








