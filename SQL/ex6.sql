USE mgmtsys;
-- Creating knew shipment order for products that are popular within the last three months --
SELECT * FROM sale WHERE sale_date >= DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH);
INSERT INTO Shipment (shipment_id, store_id, supplier_id, order_date, arrival_date, num_pallet, cost)
SELECT 
    126734986,  -- new shipment ID --
    s.store_id,
    p.supplier_id,
    CURRENT_DATE,
    NULL,
    COUNT(DISTINCT p.product_id) AS num_pallet,
    SUM(p.pricing * 0.5) AS cost
FROM Sale s
JOIN Product p ON s.product_id = p.product_id
WHERE s.sale_date >= DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH)
GROUP BY s.store_id, p.supplier_id
HAVING COUNT(s.product_id) >= 3;

-- Giving top 3 (or more if theres a tie) performing sales associates for the year a raise in commision rate --
UPDATE salesassociate
SET commission_rate = commission_rate + 0.05 
WHERE employee_id IN (
    SELECT employee_id 
    FROM sale
    WHERE YEAR (sale_date) = 2025
    GROUP BY employee_id
    HAVING COUNT(*) >= ( SELECT COUNT(*) 
        FROM (
            SELECT COUNT(*) AS sale_count
            FROM sale
            WHERE YEAR(sale_date) = 2025
            GROUP BY employee_id
            ORDER BY sale_count DESC
            LIMIT 1 OFFSET 2
        ) AS third_highest_salesNum
    )
) AND employee_id >0;

-- Deleting advertisments that did not lead to a sale this year. --
DELETE FROM advertisement a
WHERE NOT EXISTS (
    SELECT *
    FROM ad_product ap, sale s
    WHERE ap.ad_id = a.ad_id
      AND ap.product_id = s.product_id
      AND YEAR(s.sale_date) = 2025
) AND a.ad_id > 0;
