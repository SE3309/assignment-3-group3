-- Use the assignment database
USE mgmtsys;


------------------------------------------------------------
-- View 1: Updatable customer directory
-- Shows core customer information used by staff
------------------------------------------------------------

-- Drop the view if it already exists (so this script can be re-run safely)
DROP VIEW IF EXISTS CustomerDirectory;

-- Create the CustomerDirectory view
CREATE VIEW CustomerDirectory AS
SELECT 
    customer_id,
    email,
    phone_number,
    f_name,
    l_name,
    birthday,
    gender
FROM Customer;


-- Query 1 on CustomerDirectory:
-- Show the first 10 customers ordered by customer_id
SELECT 
    customer_id, 
    f_name, 
    l_name, 
    email
FROM CustomerDirectory
ORDER BY customer_id
LIMIT 10;


-- Modification attempt on CustomerDirectory:
-- Make sure our test customer_id (6) is free, then insert through the view
DELETE FROM Customer
WHERE customer_id = 6;

INSERT INTO CustomerDirectory
    (customer_id, email, phone_number, f_name, l_name, birthday, gender)
VALUES
    (6, 'noah.green@example.com', '555-9999',
     'Noah', 'Green', '1998-04-12', 'Male');


-- Verify that the new row is visible in the view
SELECT 
    customer_id, 
    f_name, 
    l_name, 
    email
FROM CustomerDirectory
WHERE customer_id = 6;



------------------------------------------------------------
-- View 2: Non-updatable aggregated city sales summary
-- Shows total revenue per city using joins and aggregation
------------------------------------------------------------

-- Drop the view if it already exists
DROP VIEW IF EXISTS CitySalesSummary;

-- Create the CitySalesSummary view
CREATE VIEW CitySalesSummary AS
SELECT 
    st.city,
    SUM(p.pricing) AS total_revenue
FROM Sale sa
JOIN Store st ON sa.store_id = st.store_id
JOIN Product p ON sa.product_id = p.product_id
GROUP BY st.city;


-- Query 1 on CitySalesSummary:
-- Show total revenue per city
SELECT 
    city,
    total_revenue
FROM CitySalesSummary;


-- Modification attempt on CitySalesSummary:
-- This should fail because the view is not updatable
-- (it uses joins, GROUP BY, and the SUM aggregate)
INSERT INTO CitySalesSummary (city, total_revenue)
VALUES ('Test City', 12345.67);
