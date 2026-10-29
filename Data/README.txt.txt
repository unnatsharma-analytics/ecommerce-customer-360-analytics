INDIAN E-COMMERCE ANALYTICS PROJECT

ABOUT THE DATA
This is a sample project dataset made for practising SQL Server and Power BI.
The data is synthetic, which means the customers, orders, prices, dates, payments, and returns are simulated. It is not real Flipkart data or data from a real company.

FILES INCLUDED
- customers.csv: Customer details. It contains 500 sample customers.
- products.csv: Product names, categories, prices, and costs. It contains 30 sample products.
- orders.csv: Order details. It contains 1,200 sample orders.
- order_items.csv: Products included in each order, including quantity, price, and cost.
- payments.csv: Payment method and payment amount for each order.
- returns.csv: Return records for orders marked as returned.
- data_dictionary.csv: A guide that explains the columns in the files.

HOW THE FILES ARE CONNECTED
- customer_id connects customers with their orders.
- order_id connects orders with order items, payments, and returns.
- product_id connects products with order items.

WHAT THIS PROJECT LOOKS AT
- Monthly sales and order trends.
- Sales by product category.
- Average order value for delivered orders.
- Customers who place more than one order.
- Estimated profit by product or category.
- Common return reasons.
- Differences between payment amounts and item totals.

IMPORTANT NOTES
- Sales totals depend on which order statuses and filters are included.
- Estimated item profit = item sales - (quantity × unit cost).
- Estimated profit is only a practice calculation. It does not include all business expenses, such as shipping, taxes, or operating costs.
- Payment amounts may differ slightly from item totals in this sample dataset.
- Do not present results from this dataset as real market facts.

PROJECT PURPOSE
The purpose of this dataset is to practise SQL analysis and build a Power BI dashboard that explains sales, customers, products, payments, and returns in a simple visual way.
