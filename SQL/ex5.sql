-- Basic Select 
SELECT f_name, l_name, email, birthday
FROM Customer
WHERE birthday >= '2000-01-01'
ORDER BY birthday ASC
LIMIT 10;

-- Inner join
SELECT p.product_name, p.brand, p.pricing, s.supplier_name
FROM Product p, Supplier s
WHERE p.supplier_id = s.supplier_id
LIMIT 10;

-- Aggregation with GROUP BY and HAVING
SELECT category, COUNT(*) AS product_count
FROM Product
GROUP BY category
HAVING product_count > 20
ORDER BY product_count DESC;

-- Subquery
SELECT f_name, l_name, email
FROM Employee
WHERE employee_id IN (SELECT employee_id FROM Manager)
LIMIT 10;

-- Three table join
SELECT st.city, SUM(p.pricing) as total_revenue
FROM Sale sa, Store st, Product p
WHERE sa.store_id = st.store_id AND sa.product_id = p.product_id
GROUP BY st.city
ORDER BY total_revenue DESC;

-- NOT EXIST
SELECT product_name, brand
FROM Product p
WHERE NOT EXISTS (
    SELECT 1
    FROM Ad_Product ap
    WHERE ap.product_id = p.product_id
)
LIMIT 10;

-- UNION
(SELECT birthday
FROM employee
WHERE birthday IS NOT NULL)
UNION
(SELECT birthday
FROM customer
WHERE birthday IS NOT NULL)
LIMIT 10;