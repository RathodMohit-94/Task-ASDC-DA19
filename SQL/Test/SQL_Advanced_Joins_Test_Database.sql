-- SQL TEST DATABASE SETUP
CREATE DATABASE SQL_Advanced_Joins_Test;
GO

USE SQL_Advanced_Joins_Test;
GO

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL,
    customer_segment VARCHAR(20) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(12,2) NOT NULL,
    joining_date DATE NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    sales_employee_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (sales_employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    paid_amount DECIMAL(12,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE SupportTickets (
    ticket_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    ticket_date DATE NOT NULL,
    ticket_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Customers VALUES (1, 'Aarav Mehta', 'Ahmedabad', 'Gujarat', '2025-01-15', 'Enterprise');
INSERT INTO Customers VALUES (2, 'Diya Shah', 'Mumbai', 'Maharashtra', '2025-01-20', 'Premium');
INSERT INTO Customers VALUES (3, 'Rohan Patel', 'Ahmedabad', 'Gujarat', '2025-02-03', 'Standard');
INSERT INTO Customers VALUES (4, 'Ananya Iyer', 'Bengaluru', 'Karnataka', '2025-02-10', 'Premium');
INSERT INTO Customers VALUES (5, 'Kabir Joshi', 'Pune', 'Maharashtra', '2025-02-18', 'Standard');
INSERT INTO Customers VALUES (6, 'Meera Desai', 'Surat', 'Gujarat', '2025-03-01', 'Premium');
INSERT INTO Customers VALUES (7, 'Vivaan Kapoor', 'Delhi', 'Delhi', '2025-03-08', 'Enterprise');
INSERT INTO Customers VALUES (8, 'Ishita Rao', 'Hyderabad', 'Telangana', '2025-03-15', 'Standard');
INSERT INTO Customers VALUES (9, 'Aditya Singh', 'Jaipur', 'Rajasthan', '2025-03-21', 'Premium');
INSERT INTO Customers VALUES (10, 'Sara Khan', 'Lucknow', 'Uttar Pradesh', '2025-04-02', 'Standard');
INSERT INTO Customers VALUES (11, 'Arjun Verma', 'Noida', 'Uttar Pradesh', '2025-04-11', 'Enterprise');
INSERT INTO Customers VALUES (12, 'Nisha Shah', 'Vadodara', 'Gujarat', '2025-04-18', 'Premium');
INSERT INTO Customers VALUES (13, 'Kunal Shah', 'Rajkot', 'Gujarat', '2025-05-03', 'Standard');
INSERT INTO Customers VALUES (14, 'Tanya Malhotra', 'Chandigarh', 'Chandigarh', '2025-05-14', 'Premium');
INSERT INTO Customers VALUES (15, 'Dev Agarwal', 'Indore', 'Madhya Pradesh', '2025-05-22', 'Standard');
INSERT INTO Customers VALUES (16, 'Pooja Nair', 'Kochi', 'Kerala', '2025-06-05', 'Premium');
INSERT INTO Customers VALUES (17, 'Manav Gupta', 'Gurugram', 'Haryana', '2025-06-17', 'Enterprise');
INSERT INTO Customers VALUES (18, 'Riya Kulkarni', 'Nashik', 'Maharashtra', '2025-06-25', 'Standard');
INSERT INTO Customers VALUES (19, 'Yash Trivedi', 'Ahmedabad', 'Gujarat', '2025-07-03', 'Premium');
INSERT INTO Customers VALUES (20, 'Sneha Menon', 'Chennai', 'Tamil Nadu', '2025-07-12', 'Standard');
INSERT INTO Customers VALUES (21, 'Rahul Bansal', 'Bhopal', 'Madhya Pradesh', '2025-07-21', 'Premium');
INSERT INTO Customers VALUES (22, 'Aisha Sheikh', 'Mumbai', 'Maharashtra', '2025-08-02', 'Standard');
INSERT INTO Customers VALUES (23, 'Harsh Vora', 'Ahmedabad', 'Gujarat', '2025-08-16', 'Enterprise');
INSERT INTO Customers VALUES (24, 'Neha Soni', 'Udaipur', 'Rajasthan', '2025-08-25', 'Standard');
INSERT INTO Customers VALUES (25, 'Om Prakash', 'Patna', 'Bihar', '2025-09-04', 'Premium');
INSERT INTO Customers VALUES (26, 'Mahi Jain', 'Kolkata', 'West Bengal', '2025-09-13', 'Standard');
INSERT INTO Customers VALUES (27, 'Siddharth Roy', 'Bengaluru', 'Karnataka', '2025-09-20', 'Enterprise');
INSERT INTO Customers VALUES (28, 'Palak Mehta', 'Surat', 'Gujarat', '2025-10-01', 'Standard');
INSERT INTO Customers VALUES (29, 'Atharv Shah', 'Vadodara', 'Gujarat', '2025-10-12', 'Premium');
INSERT INTO Customers VALUES (30, 'Kiara Patel', 'Pune', 'Maharashtra', '2025-10-19', 'Standard');

INSERT INTO Products VALUES (101, 'Laptop Pro 14', 'Electronics', 85000, 40);
INSERT INTO Products VALUES (102, 'Business Laptop 15', 'Electronics', 72000, 55);
INSERT INTO Products VALUES (103, 'Wireless Mouse', 'Accessories', 1800, 250);
INSERT INTO Products VALUES (104, 'Mechanical Keyboard', 'Accessories', 4200, 120);
INSERT INTO Products VALUES (105, 'USB-C Dock', 'Accessories', 6500, 90);
INSERT INTO Products VALUES (106, '24-inch Monitor', 'Monitors', 14500, 75);
INSERT INTO Products VALUES (107, '27-inch Monitor', 'Monitors', 22000, 60);
INSERT INTO Products VALUES (108, 'Office Chair', 'Furniture', 18500, 35);
INSERT INTO Products VALUES (109, 'Standing Desk', 'Furniture', 28500, 25);
INSERT INTO Products VALUES (110, 'Noise Cancelling Headset', 'Audio', 9800, 80);
INSERT INTO Products VALUES (111, 'Webcam Full HD', 'Accessories', 5200, 100);
INSERT INTO Products VALUES (112, 'External SSD 1TB', 'Storage', 8500, 65);
INSERT INTO Products VALUES (113, 'External SSD 2TB', 'Storage', 14500, 45);
INSERT INTO Products VALUES (114, 'Laser Printer', 'Office Equipment', 16500, 30);
INSERT INTO Products VALUES (115, 'Wi-Fi 6 Router', 'Networking', 7800, 70);
INSERT INTO Products VALUES (116, 'Network Switch 24 Port', 'Networking', 12500, 25);
INSERT INTO Products VALUES (117, 'Tablet 11-inch', 'Electronics', 32000, 50);
INSERT INTO Products VALUES (118, 'Smartphone Business', 'Electronics', 48000, 70);
INSERT INTO Products VALUES (119, 'Conference Speaker', 'Audio', 12500, 40);
INSERT INTO Products VALUES (120, 'UPS 1.5 KVA', 'Power', 15500, 45);

INSERT INTO Employees VALUES (201, 'Neel Joshi', 'Sales', 65000, '2023-06-12');
INSERT INTO Employees VALUES (202, 'Priya Shah', 'Sales', 72000, '2022-09-18');
INSERT INTO Employees VALUES (203, 'Vikram Rao', 'Sales', 58000, '2024-01-10');
INSERT INTO Employees VALUES (204, 'Kavya Patel', 'Support', 62000, '2023-11-05');
INSERT INTO Employees VALUES (205, 'Raj Malhotra', 'Support', 68000, '2022-04-22');
INSERT INTO Employees VALUES (206, 'Aditi Mehta', 'Finance', 85000, '2021-08-14');
INSERT INTO Employees VALUES (207, 'Sahil Verma', 'Operations', 70000, '2023-03-19');
INSERT INTO Employees VALUES (208, 'Isha Nair', 'Operations', 76000, '2022-12-01');
INSERT INTO Employees VALUES (209, 'Aman Gupta', 'Sales', 61000, '2024-05-09');
INSERT INTO Employees VALUES (210, 'Rhea Kapoor', 'Marketing', 74000, '2023-07-17');
INSERT INTO Employees VALUES (211, 'Nitin Desai', 'Support', 59000, '2024-02-27');
INSERT INTO Employees VALUES (212, 'Simran Kaur', 'Sales', 80000, '2021-11-11');

INSERT INTO Orders VALUES (1001, 1, 104, 1, '2025-02-04', 'Pending', 203);
INSERT INTO Orders VALUES (1002, 1, 108, 4, '2025-04-11', 'Completed', 201);
INSERT INTO Orders VALUES (1003, 1, 118, 2, '2025-06-18', 'Shipped', 209);
INSERT INTO Orders VALUES (1004, 2, 102, 1, '2025-03-07', 'Completed', 202);
INSERT INTO Orders VALUES (1005, 2, 108, 1, '2025-05-14', 'Shipped', 202);
INSERT INTO Orders VALUES (1006, 2, 118, 7, '2025-07-21', 'Completed', 209);
INSERT INTO Orders VALUES (1007, 2, 119, 5, '2025-09-03', 'Cancelled', 201);
INSERT INTO Orders VALUES (1008, 3, 106, 7, '2025-04-10', 'Completed', 203);
INSERT INTO Orders VALUES (1009, 3, 105, 4, '2025-06-17', 'Cancelled', 203);
INSERT INTO Orders VALUES (1010, 4, 104, 2, '2025-05-13', 'Completed', 201);
INSERT INTO Orders VALUES (1011, 4, 112, 6, '2025-07-20', 'Shipped', 203);
INSERT INTO Orders VALUES (1012, 4, 102, 8, '2025-09-02', 'Shipped', 201);
INSERT INTO Orders VALUES (1013, 4, 113, 2, '2025-11-09', 'Shipped', 203);
INSERT INTO Orders VALUES (1014, 4, 120, 6, '2025-01-16', 'Shipped', 202);
INSERT INTO Orders VALUES (1015, 5, 103, 1, '2025-06-16', 'Pending', 202);
INSERT INTO Orders VALUES (1016, 5, 110, 2, '2025-08-23', 'Cancelled', 202);
INSERT INTO Orders VALUES (1017, 6, 104, 7, '2025-07-19', 'Completed', 209);
INSERT INTO Orders VALUES (1018, 6, 112, 3, '2025-09-01', 'Completed', 203);
INSERT INTO Orders VALUES (1019, 6, 107, 5, '2025-11-08', 'Pending', 201);
INSERT INTO Orders VALUES (1020, 7, 120, 3, '2025-08-22', 'Shipped', 202);
INSERT INTO Orders VALUES (1021, 7, 106, 8, '2025-10-04', 'Completed', 203);
INSERT INTO Orders VALUES (1022, 7, 118, 4, '2025-12-11', 'Pending', 203);
INSERT INTO Orders VALUES (1023, 7, 102, 4, '2025-02-18', 'Cancelled', 201);
INSERT INTO Orders VALUES (1024, 7, 111, 7, '2025-04-25', 'Completed', 201);
INSERT INTO Orders VALUES (1025, 8, 107, 6, '2025-09-25', 'Completed', 209);
INSERT INTO Orders VALUES (1026, 9, 113, 8, '2025-10-03', 'Completed', 203);
INSERT INTO Orders VALUES (1027, 9, 105, 4, '2025-12-10', 'Pending', 212);
INSERT INTO Orders VALUES (1028, 9, 118, 5, '2025-02-17', 'Pending', 212);
INSERT INTO Orders VALUES (1029, 9, 114, 7, '2025-04-24', 'Completed', 202);
INSERT INTO Orders VALUES (1030, 10, 105, 8, '2025-11-06', 'Completed', 201);
INSERT INTO Orders VALUES (1031, 10, 104, 3, '2025-01-13', 'Pending', 202);
INSERT INTO Orders VALUES (1032, 11, 114, 2, '2025-12-09', 'Completed', 209);
INSERT INTO Orders VALUES (1033, 11, 120, 8, '2025-02-16', 'Shipped', 203);
INSERT INTO Orders VALUES (1034, 11, 118, 1, '2025-04-23', 'Pending', 201);
INSERT INTO Orders VALUES (1035, 11, 118, 5, '2025-06-05', 'Cancelled', 203);
INSERT INTO Orders VALUES (1036, 11, 104, 5, '2025-08-12', 'Completed', 202);
INSERT INTO Orders VALUES (1037, 12, 115, 1, '2025-01-12', 'Pending', 203);
INSERT INTO Orders VALUES (1038, 12, 117, 3, '2025-03-19', 'Shipped', 201);
INSERT INTO Orders VALUES (1039, 12, 110, 4, '2025-05-01', 'Completed', 203);
INSERT INTO Orders VALUES (1040, 13, 106, 1, '2025-02-15', 'Cancelled', 203);
INSERT INTO Orders VALUES (1041, 14, 116, 1, '2025-03-18', 'Completed', 203);
INSERT INTO Orders VALUES (1042, 14, 110, 4, '2025-05-25', 'Completed', 202);
INSERT INTO Orders VALUES (1043, 14, 119, 2, '2025-07-07', 'Completed', 209);
INSERT INTO Orders VALUES (1044, 14, 103, 3, '2025-09-14', 'Completed', 209);
INSERT INTO Orders VALUES (1045, 15, 118, 3, '2025-04-21', 'Completed', 212);
INSERT INTO Orders VALUES (1046, 15, 120, 7, '2025-06-03', 'Completed', 212);
INSERT INTO Orders VALUES (1047, 16, 107, 5, '2025-05-24', 'Completed', 203);
INSERT INTO Orders VALUES (1048, 16, 115, 8, '2025-07-06', 'Completed', 202);
INSERT INTO Orders VALUES (1049, 16, 108, 2, '2025-09-13', 'Completed', 201);
INSERT INTO Orders VALUES (1050, 17, 119, 4, '2025-06-02', 'Shipped', 202);
INSERT INTO Orders VALUES (1051, 17, 101, 2, '2025-08-09', 'Pending', 201);
INSERT INTO Orders VALUES (1052, 17, 108, 2, '2025-10-16', 'Completed', 203);
INSERT INTO Orders VALUES (1053, 17, 103, 4, '2025-12-23', 'Completed', 209);
INSERT INTO Orders VALUES (1054, 17, 107, 3, '2025-02-05', 'Pending', 212);
INSERT INTO Orders VALUES (1055, 18, 119, 8, '2025-07-05', 'Completed', 209);
INSERT INTO Orders VALUES (1056, 18, 114, 4, '2025-09-12', 'Completed', 201);
INSERT INTO Orders VALUES (1057, 19, 114, 6, '2025-08-08', 'Completed', 209);
INSERT INTO Orders VALUES (1058, 19, 115, 1, '2025-10-15', 'Pending', 201);
INSERT INTO Orders VALUES (1059, 19, 102, 7, '2025-12-22', 'Pending', 203);
INSERT INTO Orders VALUES (1060, 19, 104, 4, '2025-02-04', 'Completed', 202);
INSERT INTO Orders VALUES (1061, 20, 118, 8, '2025-09-11', 'Completed', 209);
INSERT INTO Orders VALUES (1062, 20, 106, 5, '2025-11-18', 'Completed', 202);
INSERT INTO Orders VALUES (1063, 21, 103, 8, '2025-10-14', 'Cancelled', 212);
INSERT INTO Orders VALUES (1064, 21, 104, 1, '2025-12-21', 'Pending', 212);
INSERT INTO Orders VALUES (1065, 21, 101, 2, '2025-02-03', 'Cancelled', 202);
INSERT INTO Orders VALUES (1066, 22, 106, 7, '2025-11-17', 'Completed', 209);
INSERT INTO Orders VALUES (1067, 23, 107, 7, '2025-12-20', 'Completed', 202);
INSERT INTO Orders VALUES (1068, 23, 113, 1, '2025-02-02', 'Completed', 203);
INSERT INTO Orders VALUES (1069, 23, 115, 5, '2025-04-09', 'Completed', 212);
INSERT INTO Orders VALUES (1070, 23, 116, 3, '2025-06-16', 'Completed', 203);
INSERT INTO Orders VALUES (1071, 23, 107, 1, '2025-08-23', 'Shipped', 212);
INSERT INTO Orders VALUES (1072, 24, 102, 6, '2025-01-23', 'Completed', 201);
INSERT INTO Orders VALUES (1073, 24, 119, 8, '2025-03-05', 'Shipped', 212);
INSERT INTO Orders VALUES (1074, 25, 106, 1, '2025-02-01', 'Shipped', 201);
INSERT INTO Orders VALUES (1075, 25, 106, 2, '2025-04-08', 'Shipped', 201);
INSERT INTO Orders VALUES (1076, 25, 108, 7, '2025-06-15', 'Completed', 212);
INSERT INTO Orders VALUES (1077, 26, 108, 1, '2025-03-04', 'Cancelled', 201);
INSERT INTO Orders VALUES (1078, 27, 114, 6, '2025-04-07', 'Completed', 202);
INSERT INTO Orders VALUES (1079, 27, 111, 4, '2025-06-14', 'Completed', 209);
INSERT INTO Orders VALUES (1080, 27, 105, 5, '2025-08-21', 'Completed', 203);
INSERT INTO Orders VALUES (1081, 27, 103, 1, '2025-10-03', 'Completed', 212);
INSERT INTO Orders VALUES (1082, 28, 119, 2, '2025-05-10', 'Completed', 212);
INSERT INTO Orders VALUES (1083, 28, 107, 5, '2025-07-17', 'Completed', 203);
INSERT INTO Orders VALUES (1084, 29, 103, 4, '2025-06-13', 'Completed', 203);
INSERT INTO Orders VALUES (1085, 29, 106, 8, '2025-08-20', 'Cancelled', 212);
INSERT INTO Orders VALUES (1086, 29, 110, 1, '2025-10-02', 'Pending', 212);
INSERT INTO Orders VALUES (1087, 30, 110, 2, '2025-07-16', 'Completed', 203);
INSERT INTO Orders VALUES (1088, 30, 104, 2, '2025-09-23', 'Pending', 212);

INSERT INTO Payments VALUES (9001, 1001, 0, 'Pending', '2025-02-04');
INSERT INTO Payments VALUES (9002, 1002, 74000, 'Paid', '2025-04-11');
INSERT INTO Payments VALUES (9003, 1003, 96000, 'Paid', '2025-06-18');
INSERT INTO Payments VALUES (9004, 1004, 72000, 'Paid', '2025-03-07');
INSERT INTO Payments VALUES (9005, 1005, 18500, 'Paid', '2025-05-14');
INSERT INTO Payments VALUES (9006, 1006, 336000, 'Paid', '2025-07-21');
INSERT INTO Payments VALUES (9007, 1007, 0, 'Refunded', '2025-09-03');
INSERT INTO Payments VALUES (9008, 1008, 101500, 'Paid', '2025-04-10');
INSERT INTO Payments VALUES (9009, 1009, 0, 'Refunded', '2025-06-17');
INSERT INTO Payments VALUES (9010, 1010, 8400, 'Paid', '2025-05-13');
INSERT INTO Payments VALUES (9011, 1011, 51000, 'Paid', '2025-07-20');
INSERT INTO Payments VALUES (9012, 1012, 576000, 'Paid', '2025-09-02');
INSERT INTO Payments VALUES (9013, 1013, 29000, 'Paid', '2025-11-09');
INSERT INTO Payments VALUES (9014, 1014, 93000, 'Paid', '2025-01-16');
INSERT INTO Payments VALUES (9015, 1015, 0, 'Pending', '2025-06-16');
INSERT INTO Payments VALUES (9016, 1016, 0, 'Refunded', '2025-08-23');
INSERT INTO Payments VALUES (9017, 1017, 29400, 'Paid', '2025-07-19');
INSERT INTO Payments VALUES (9018, 1018, 25500, 'Paid', '2025-09-01');
INSERT INTO Payments VALUES (9019, 1019, 0, 'Pending', '2025-11-08');
INSERT INTO Payments VALUES (9020, 1020, 46500, 'Paid', '2025-08-22');
INSERT INTO Payments VALUES (9021, 1021, 116000, 'Paid', '2025-10-04');
INSERT INTO Payments VALUES (9022, 1022, 0, 'Pending', '2025-12-11');
INSERT INTO Payments VALUES (9023, 1023, 0, 'Refunded', '2025-02-18');
INSERT INTO Payments VALUES (9024, 1024, 36400, 'Paid', '2025-04-25');
INSERT INTO Payments VALUES (9025, 1025, 132000, 'Paid', '2025-09-25');
INSERT INTO Payments VALUES (9026, 1026, 116000, 'Paid', '2025-10-03');
INSERT INTO Payments VALUES (9027, 1027, 0, 'Pending', '2025-12-10');
INSERT INTO Payments VALUES (9028, 1028, 0, 'Pending', '2025-02-17');
INSERT INTO Payments VALUES (9029, 1029, 115500, 'Paid', '2025-04-24');
INSERT INTO Payments VALUES (9030, 1030, 52000, 'Paid', '2025-11-06');
INSERT INTO Payments VALUES (9031, 1031, 0, 'Pending', '2025-01-13');
INSERT INTO Payments VALUES (9032, 1032, 33000, 'Paid', '2025-12-09');
INSERT INTO Payments VALUES (9033, 1033, 124000, 'Paid', '2025-02-16');
INSERT INTO Payments VALUES (9034, 1034, 0, 'Pending', '2025-04-23');
INSERT INTO Payments VALUES (9035, 1035, 0, 'Refunded', '2025-06-05');
INSERT INTO Payments VALUES (9036, 1036, 21000, 'Paid', '2025-08-12');
INSERT INTO Payments VALUES (9037, 1037, 0, 'Pending', '2025-01-12');
INSERT INTO Payments VALUES (9038, 1038, 96000, 'Paid', '2025-03-19');
INSERT INTO Payments VALUES (9039, 1039, 39200, 'Paid', '2025-05-01');
INSERT INTO Payments VALUES (9040, 1040, 0, 'Refunded', '2025-02-15');
INSERT INTO Payments VALUES (9041, 1041, 12500, 'Paid', '2025-03-18');
INSERT INTO Payments VALUES (9042, 1042, 39200, 'Paid', '2025-05-25');
INSERT INTO Payments VALUES (9043, 1043, 25000, 'Paid', '2025-07-07');
INSERT INTO Payments VALUES (9044, 1044, 5400, 'Paid', '2025-09-14');
INSERT INTO Payments VALUES (9045, 1045, 144000, 'Paid', '2025-04-21');
INSERT INTO Payments VALUES (9046, 1046, 108500, 'Paid', '2025-06-03');
INSERT INTO Payments VALUES (9047, 1047, 110000, 'Paid', '2025-05-24');
INSERT INTO Payments VALUES (9048, 1048, 62400, 'Paid', '2025-07-06');
INSERT INTO Payments VALUES (9049, 1049, 37000, 'Paid', '2025-09-13');
INSERT INTO Payments VALUES (9050, 1050, 50000, 'Paid', '2025-06-02');
INSERT INTO Payments VALUES (9051, 1051, 0, 'Pending', '2025-08-09');
INSERT INTO Payments VALUES (9052, 1052, 37000, 'Paid', '2025-10-16');
INSERT INTO Payments VALUES (9053, 1053, 7200, 'Paid', '2025-12-23');
INSERT INTO Payments VALUES (9054, 1054, 0, 'Pending', '2025-02-05');
INSERT INTO Payments VALUES (9055, 1055, 100000, 'Paid', '2025-07-05');
INSERT INTO Payments VALUES (9056, 1056, 66000, 'Paid', '2025-09-12');
INSERT INTO Payments VALUES (9057, 1057, 99000, 'Paid', '2025-08-08');
INSERT INTO Payments VALUES (9058, 1058, 0, 'Pending', '2025-10-15');
INSERT INTO Payments VALUES (9059, 1059, 0, 'Pending', '2025-12-22');
INSERT INTO Payments VALUES (9060, 1060, 16800, 'Paid', '2025-02-04');
INSERT INTO Payments VALUES (9061, 1061, 384000, 'Paid', '2025-09-11');
INSERT INTO Payments VALUES (9062, 1062, 72500, 'Paid', '2025-11-18');
INSERT INTO Payments VALUES (9063, 1063, 0, 'Refunded', '2025-10-14');
INSERT INTO Payments VALUES (9064, 1064, 0, 'Pending', '2025-12-21');
INSERT INTO Payments VALUES (9065, 1065, 0, 'Refunded', '2025-02-03');
INSERT INTO Payments VALUES (9066, 1066, 101500, 'Paid', '2025-11-17');
INSERT INTO Payments VALUES (9067, 1067, 154000, 'Paid', '2025-12-20');
INSERT INTO Payments VALUES (9068, 1068, 14500, 'Paid', '2025-02-02');
INSERT INTO Payments VALUES (9069, 1069, 39000, 'Paid', '2025-04-09');
INSERT INTO Payments VALUES (9070, 1070, 37500, 'Paid', '2025-06-16');
INSERT INTO Payments VALUES (9071, 1071, 22000, 'Paid', '2025-08-23');
INSERT INTO Payments VALUES (9072, 1072, 432000, 'Paid', '2025-01-23');
INSERT INTO Payments VALUES (9073, 1073, 100000, 'Paid', '2025-03-05');
INSERT INTO Payments VALUES (9074, 1074, 14500, 'Paid', '2025-02-01');
INSERT INTO Payments VALUES (9075, 1075, 29000, 'Paid', '2025-04-08');
INSERT INTO Payments VALUES (9076, 1076, 129500, 'Paid', '2025-06-15');
INSERT INTO Payments VALUES (9077, 1077, 0, 'Refunded', '2025-03-04');
INSERT INTO Payments VALUES (9078, 1078, 99000, 'Paid', '2025-04-07');
INSERT INTO Payments VALUES (9079, 1079, 20800, 'Paid', '2025-06-14');
INSERT INTO Payments VALUES (9080, 1080, 32500, 'Paid', '2025-08-21');
INSERT INTO Payments VALUES (9081, 1081, 1800, 'Paid', '2025-10-03');
INSERT INTO Payments VALUES (9082, 1082, 25000, 'Paid', '2025-05-10');
INSERT INTO Payments VALUES (9083, 1083, 110000, 'Paid', '2025-07-17');
INSERT INTO Payments VALUES (9084, 1084, 7200, 'Paid', '2025-06-13');
INSERT INTO Payments VALUES (9085, 1085, 0, 'Refunded', '2025-08-20');
INSERT INTO Payments VALUES (9086, 1086, 0, 'Pending', '2025-10-02');
INSERT INTO Payments VALUES (9087, 1087, 19600, 'Paid', '2025-07-16');
INSERT INTO Payments VALUES (9088, 1088, 0, 'Pending', '2025-09-23');

INSERT INTO SupportTickets VALUES (5001, 1, 204, '2025-02-05', 'Resolved');
INSERT INTO SupportTickets VALUES (5002, 2, 205, '2025-02-22', 'Resolved');
INSERT INTO SupportTickets VALUES (5003, 4, 204, '2025-03-12', 'Open');
INSERT INTO SupportTickets VALUES (5004, 6, 205, '2025-03-19', 'Resolved');
INSERT INTO SupportTickets VALUES (5005, 7, 211, '2025-04-01', 'Resolved');
INSERT INTO SupportTickets VALUES (5006, 9, 204, '2025-04-14', 'Escalated');
INSERT INTO SupportTickets VALUES (5007, 11, 205, '2025-05-05', 'Resolved');
INSERT INTO SupportTickets VALUES (5008, 12, 211, '2025-05-21', 'Open');
INSERT INTO SupportTickets VALUES (5009, 14, 204, '2025-06-03', 'Resolved');
INSERT INTO SupportTickets VALUES (5010, 16, 205, '2025-06-19', 'Resolved');
INSERT INTO SupportTickets VALUES (5011, 17, 211, '2025-07-07', 'Escalated');
INSERT INTO SupportTickets VALUES (5012, 19, 204, '2025-07-18', 'Resolved');
INSERT INTO SupportTickets VALUES (5013, 20, 205, '2025-08-09', 'Open');
INSERT INTO SupportTickets VALUES (5014, 21, 211, '2025-08-23', 'Resolved');
INSERT INTO SupportTickets VALUES (5015, 23, 204, '2025-09-08', 'Resolved');
INSERT INTO SupportTickets VALUES (5016, 25, 205, '2025-09-22', 'Escalated');
INSERT INTO SupportTickets VALUES (5017, 27, 211, '2025-10-10', 'Resolved');
INSERT INTO SupportTickets VALUES (5018, 29, 204, '2025-10-26', 'Open');

GO
