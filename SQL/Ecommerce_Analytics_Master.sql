-- S.No. 1: Select and Verify Project Database

USE EcommerceAnalyticsDB;
GO

SELECT DB_NAME() AS CurrentDatabase;
-- S.No. 2: Check E-commerce Dataset

SELECT
    (SELECT COUNT(*) FROM dbo.customers) AS TotalCustomers,
    (SELECT COUNT(*) FROM dbo.products) AS TotalProducts,
    (SELECT COUNT(*) FROM dbo.orders) AS TotalOrders,
    (SELECT COUNT(*) FROM dbo.[order items]) AS TotalOrderItems,
    (SELECT COUNT(*) FROM dbo.payments) AS TotalPayments,
    (SELECT COUNT(*) FROM dbo.returns) AS TotalReturns;
GO
-- S.No. 3: Total Sales and Order Analysis

SELECT
    COUNT(DISTINCT order_id) AS TotalOrders,
    SUM(line_total_inr) AS TotalSales
FROM dbo.[order items];
GO
-- S.No. 4: Category-wise Sales Analysis

SELECT
    p.category,
    SUM(oi.line_total_inr) AS TotalSales
FROM dbo.[order items] AS oi
JOIN dbo.products AS p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY TotalSales DESC;
GO
-- S.No. 5: Top 10 Customers by Purchase Value

SELECT TOP 10
    c.customer_id,
    c.customer_name,
    SUM(oi.line_total_inr) AS TotalPurchaseValue
FROM dbo.customers AS c
JOIN dbo.orders AS o
    ON c.customer_id = o.customer_id
JOIN dbo.[order items] AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY TotalPurchaseValue DESC;
GO
-- S.No. 6: Monthly Sales Analysis

SELECT
    YEAR(o.order_date) AS SalesYear,
    MONTH(o.order_date) AS SalesMonth,
    SUM(oi.line_total_inr) AS TotalSales
FROM dbo.orders AS o
JOIN dbo.[order items] AS oi
    ON o.order_id = oi.order_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    SalesYear,
    SalesMonth;
GO
-- S.No. 7: Order Status Analysis

SELECT
    order_status,
    COUNT(*) AS TotalOrders
FROM dbo.orders
GROUP BY order_status
ORDER BY TotalOrders DESC;
GO
-- S.No. 8: Payment Method Analysis

SELECT
    payment_method,
    COUNT(*) AS TotalPayments,
    SUM(payment_amount_inr) AS TotalPaymentAmount
FROM dbo.payments
GROUP BY payment_method
ORDER BY TotalPaymentAmount DESC;
GO
-- S.No. 9: Repeat Customer Analysis

SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS TotalOrders
FROM dbo.orders AS o
GROUP BY o.customer_id
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY TotalOrders DESC;
GO
-- S.No. 10: Product Profitability Analysis

SELECT
    p.product_name,
    SUM(oi.line_total_inr) AS TotalSales,
    SUM(oi.quantity * oi.unit_cost_inr) AS TotalCost,
    SUM(oi.line_total_inr - (oi.quantity * oi.unit_cost_inr)) AS EstimatedProfit
FROM dbo.[order items] AS oi
JOIN dbo.products AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY EstimatedProfit DESC;
GO
