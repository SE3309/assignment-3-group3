USE mgmtsys;

INSERT INTO Employee
VALUES (1, 'john.doe@example.com', 'John', 'Doe', '1990-05-10', 40, 55000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
VALUES (2, 'kathryneaton@example.org', 'Kathrylll', 'Neaton', '1990-05-10', 40, 55000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
SELECT 3, 'dlopez@example.org', 'Dwight', 'Lopez', '1985-07-25', 35, 60000.00;

SELECT * FROM Employee;

-- MEANINGFUL DATA --

-- Employee
INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
VALUES (1, 'alicejones@example.com', 'Alice', 'Jones', '1985-09-22', 40, 60000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
VALUES (2, 'bobmartin@example.com', 'Bob', 'Martin', '1990-02-15', 35, 55000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
VALUES (3, 'charliebrown@example.com', 'Charlie', 'Brown', '1987-07-30', 45, 65000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
VALUES (4, 'dianawilson@example.com', 'Diana', 'Wilson', '1992-03-18', 40, 57000.00);

INSERT INTO Employee (employee_id, email, f_name, l_name, birthday, hours_worked, salary)
VALUES (5, 'ethanmiller@example.com', 'Ethan', 'Miller', '1984-11-25', 50, 70000.00);

-- Sales Associate
INSERT INTO SalesAssociate (employee_id, commission_rate)
VALUES (1, 0.05);

INSERT INTO SalesAssociate (employee_id, commission_rate)
VALUES (2, 0.04);

INSERT INTO SalesAssociate (employee_id, commission_rate)
VALUES (3, 0.06);

INSERT INTO SalesAssociate (employee_id, commission_rate)
VALUES (4, 0.05);

INSERT INTO SalesAssociate (employee_id, commission_rate)
VALUES (5, 0.07);

-- Manager
INSERT INTO Manager (employee_id, bonus_rate)
VALUES (3, 0.10);

INSERT INTO Manager (employee_id, bonus_rate)
VALUES (4, 0.12);

INSERT INTO Manager (employee_id, bonus_rate)
VALUES (5, 0.15);

INSERT INTO Manager (employee_id, bonus_rate)
VALUES (6, 0.08);

INSERT INTO Manager (employee_id, bonus_rate)
VALUES (7, 0.09);

-- Store
INSERT INTO Store (store_id, street, city, postcode, employee_id)
VALUES (101, '123 Maple Street', 'Springfield', '62701', 3);

INSERT INTO Store (store_id, street, city, postcode, employee_id)
VALUES (102, '456 Oak Avenue', 'Chicago', '60601', 4);

INSERT INTO Store (store_id, street, city, postcode, employee_id)
VALUES (103, '789 Pine Road', 'New York', '10001', 5);

INSERT INTO Store (store_id, street, city, postcode, employee_id)
VALUES (104, '101 Birch Lane', 'Los Angeles', '90001', 6);

INSERT INTO Store (store_id, street, city, postcode, employee_id)
VALUES (105, '202 Cedar Blvd', 'Austin', '73301', 7);

-- Customer
INSERT INTO Customer (customer_id, f_name, l_name, phone_number, birthday, gender, email)
VALUES (1, 'Sophia', 'Johnson', '555-1234', '1995-08-21', 'Female', 'sophiajohnson@example.com');

INSERT INTO Customer (customer_id, f_name, l_name, phone_number, birthday, gender, email)
VALUES (2, 'Liam', 'Williams', '555-5678', '1992-11-12', 'Male', 'liamwilliams@example.com');

INSERT INTO Customer (customer_id, f_name, l_name, phone_number, birthday, gender, email)
VALUES (3, 'Emma', 'Brown', '555-8765', '1989-03-05', 'Female', 'emmabrown@example.com');

INSERT INTO Customer (customer_id, f_name, l_name, phone_number, birthday, gender, email)
VALUES (4, 'Oliver', 'Smith', '555-2345', '1997-01-30', 'Male', 'oliversmith@example.com');

INSERT INTO Customer (customer_id, f_name, l_name, phone_number, birthday, gender, email)
VALUES (5, 'Ava', 'Taylor', '555-6789', '1993-06-17', 'Female', 'avataylor@example.com');

-- Warehouse
INSERT INTO Warehouse (warehouse_id, street, city, postcode, sqft, capacity)
VALUES (1, '500 Industrial Ave', 'Springfield', '62702', 15000.00, 200);

INSERT INTO Warehouse (warehouse_id, street, city, postcode, sqft, capacity)
VALUES (2, '800 Commerce St', 'Chicago', '60602', 20000.00, 300);

INSERT INTO Warehouse (warehouse_id, street, city, postcode, sqft, capacity)
VALUES (3, '1000 North Rd', 'New York', '10002', 18000.00, 250);

INSERT INTO Warehouse (warehouse_id, street, city, postcode, sqft, capacity)
VALUES (4, '1200 West St', 'Los Angeles', '90002', 22000.00, 350);

INSERT INTO Warehouse (warehouse_id, street, city, postcode, sqft, capacity)
VALUES (5, '1400 South Blvd', 'Austin', '73302', 16000.00, 180);

-- Supplies
INSERT INTO Supplies (store_id, warehouse_id)
VALUES (101, 1);

INSERT INTO Supplies (store_id, warehouse_id)
VALUES (102, 2);

INSERT INTO Supplies (store_id, warehouse_id)
VALUES (103, 3);

INSERT INTO Supplies (store_id, warehouse_id)
VALUES (104, 4);

INSERT INTO Supplies (store_id, warehouse_id)
VALUES (105, 5);

-- Supplier
INSERT INTO Supplier (supplier_id, supplier_name, street, city, postcode, phone, email)
VALUES (1, 'TechCorp', '123 Tech Road', 'San Francisco', '94110', '555-1000', 'contact@techcorp.com');

INSERT INTO Supplier (supplier_id, supplier_name, street, city, postcode, phone, email)
VALUES (2, 'EcoGoods', '456 Green Way', 'Portland', '97201', '555-2000', 'info@ecogoods.com');

INSERT INTO Supplier (supplier_id, supplier_name, street, city, postcode, phone, email)
VALUES (3, 'HomeSupplies Inc.', '789 Home St', 'Denver', '80202', '555-3000', 'sales@homesupplies.com');

INSERT INTO Supplier (supplier_id, supplier_name, street, city, postcode, phone, email)
VALUES (4, 'Foodies Supply', '101 Food Ln', 'Los Angeles', '90003', '555-4000', 'service@foodiessupply.com');

INSERT INTO Supplier (supplier_id, supplier_name, street, city, postcode, phone, email)
VALUES (5, 'CleanTech', '202 Clean Ave', 'Seattle', '98101', '555-5000', 'contact@cleantech.com');

-- Product
INSERT INTO Product (product_id, product_name, brand, category, discount, pricing, supplier_id, warehouse_id)
VALUES (1, 'Smartphone X', 'TechCorp', 'Electronics', 0.10, 499.99, 1, 1);

INSERT INTO Product (product_id, product_name, brand, category, discount, pricing, supplier_id, warehouse_id)
VALUES (2, 'EcoWater Bottle', 'EcoGoods', 'Home & Kitchen', 0.15, 19.99, 2, 2);

INSERT INTO Product (product_id, product_name, brand, category, discount, pricing, supplier_id, warehouse_id)
VALUES (3, 'Comfort Pillow', 'HomeSupplies Inc.', 'Furniture', 0.20, 39.99, 3, 3);

INSERT INTO Product (product_id, product_name, brand, category, discount, pricing, supplier_id, warehouse_id)
VALUES (4, 'Organic Granola', 'Foodies Supply', 'Food & Beverages', 0.05, 9.99, 4, 4);

INSERT INTO Product (product_id, product_name, brand, category, discount, pricing, supplier_id, warehouse_id)
VALUES (5, 'Air Purifier', 'CleanTech', 'Home Appliances', 0.25, 129.99, 5, 5);

-- Shipment
INSERT INTO Shipment (shipment_id, store_id, supplier_id, order_date, arrival_date, num_pallet, cost)
VALUES (1, 101, 1, '2025-10-01', '2025-10-05', 20, 1000.00);

INSERT INTO Shipment (shipment_id, store_id, supplier_id, order_date, arrival_date, num_pallet, cost)
VALUES (2, 102, 2, '2025-10-03', '2025-10-07', 15, 500.00);

INSERT INTO Shipment (shipment_id, store_id, supplier_id, order_date, arrival_date, num_pallet, cost)
VALUES (3, 103, 3, '2025-10-04', '2025-10-09', 25, 1200.00);

INSERT INTO Shipment (shipment_id, store_id, supplier_id, order_date, arrival_date, num_pallet, cost)
VALUES (4, 104, 4, '2025-10-06', '2025-10-10', 18, 800.00);

INSERT INTO Shipment (shipment_id, store_id, supplier_id, order_date, arrival_date, num_pallet, cost)
VALUES (5, 105, 5, '2025-10-08', '2025-10-12', 22, 1500.00);

-- ProductShipment
INSERT INTO ProductShipment (shipment_id, product_id)
VALUES (1, 1);

INSERT INTO ProductShipment (shipment_id, product_id)
VALUES (1, 2);

INSERT INTO ProductShipment (shipment_id, product_id)
VALUES (2, 3);

INSERT INTO ProductShipment (shipment_id, product_id)
VALUES (2, 4);

INSERT INTO ProductShipment (shipment_id, product_id)
VALUES (3, 5);

-- Sale
INSERT INTO Sale (sale_id, order_type, customer_id, employee_id, product_id, store_id, sale_date)
VALUES (1, 'Online', 1, 1, 1, 101, '2025-10-01');

INSERT INTO Sale (sale_id, order_type, customer_id, employee_id, product_id, store_id, sale_date)
VALUES (2, 'In-Store', 2, 2, 2, 102, '2025-10-02');

INSERT INTO Sale (sale_id, order_type, customer_id, employee_id, product_id, store_id, sale_date)
VALUES (3, 'In-Store', 3, 3, 3, 103, '2025-10-03');

INSERT INTO Sale (sale_id, order_type, customer_id, employee_id, product_id, store_id, sale_date)
VALUES (4, 'Online', 4, 4, 4, 104, '2025-10-04');

INSERT INTO Sale (sale_id, order_type, customer_id, employee_id, product_id, store_id, sale_date)
VALUES (5, 'In-Store', 5, 5, 5, 105, '2025-10-05');

-- Advertisement
INSERT INTO Advertisement (ad_id, ad_name, channels, budget, start_date, end_date)
VALUES (1, 'Winter Sale', 'TV, Social Media', 10000.00, '2025-11-01', '2025-11-30');

INSERT INTO Advertisement (ad_id, ad_name, channels, budget, start_date, end_date)
VALUES (2, 'Summer Deals', 'Radio, Billboards', 5000.00, '2025-06-01', '2025-06-30');

INSERT INTO Advertisement (ad_id, ad_name, channels, budget, start_date, end_date)
VALUES (3, 'Tech Gadgets Launch', 'Online, Social Media', 12000.00, '2025-09-15', '2025-10-15');

INSERT INTO Advertisement (ad_id, ad_name, channels, budget, start_date, end_date)
VALUES (4, 'Holiday Promotions', 'TV, Social Media, Billboards', 15000.00, '2025-12-01', '2025-12-31');

INSERT INTO Advertisement (ad_id, ad_name, channels, budget, start_date, end_date)
VALUES (5, 'Back to School Campaign', 'Online, Social Media', 7000.00, '2025-08-01', '2025-08-31');

-- Ad_Product
INSERT INTO Ad_Product (ad_id, product_id)
VALUES (1, 1);

INSERT INTO Ad_Product (ad_id, product_id)
VALUES (1, 2);

INSERT INTO Ad_Product (ad_id, product_id)
VALUES (2, 3);

INSERT INTO Ad_Product (ad_id, product_id)
VALUES (3, 4);

INSERT INTO Ad_Product (ad_id, product_id)
VALUES (4, 5);
