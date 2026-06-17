USE [mull]
SELECT c.first_name, b.branch_name, s.sale_date
FROM [customers] c
JOIN sales s ON c.customer_id = s.customer_id
JOIN branches b ON s.branch_id = b.branch_id

select c.first_name,p.payment_method,p.amount_paid
from [customers] c
join sales s ON c.customer_id = s.customer_id
join payments p on s.sale_id =p.sale_id

select top 5
  c.first_name,
  SUM(p.amount_paid) AS total_paid
from  [customers] c
join sales s ON c.customer_id = s.customer_id
join payments p on s.sale_id =p.sale_id
group by c.first_name
order by total_paid DESC

SELECT gender, COUNT(customer_id) AS total_customers
FROM [customers]
GROUP BY gender
ORDER BY total_customers DESC

SELECT c.gender, SUM(p.amount_paid) AS total_revenue
FROM [customers] c
JOIN sales s on c.customer_id = s.customer_id
JOIN payments p on s.sale_id = p.sale_id
GROUP BY c.gender
ORDER BY total_revenue DESC

select b.branch_name,b.manager_name ,sum(p.amount_paid) AS total_revenue
from  branches b 
join sales s on b.branch_id = s.branch_id
join payments p on s.sale_id = p.sale_id
group by b.branch_name ,b.manager_name
order by total_revenue DESC

select b.branch_name, 
       count(DISTINCT s.sale_id) as total_sales,
       sum(p.amount_paid) as total_revenue,
       avg(p.amount_paid) as avg_invoice
from branches b
JOIN sales s on b.branch_id = s.branch_id
JOIN payments p on s.sale_id = p.sale_id
group by b.branch_name
order by avg_invoice DESC

SELECT 
    p.brand,
    SUM(si.total_amount) AS total_revenue,
    SUM(si.quantity) AS total_quantity_sold
FROM products p
JOIN [sales_items] si ON p.product_id = si.product_id
GROUP BY p.brand
ORDER BY total_revenue DESC

SELECT 
    p.category,
    SUM(si.total_amount) AS total_revenue,
    SUM(si.quantity) AS total_quantity_sold
FROM products p
JOIN [sales_items] si ON p.product_id = si.product_id
GROUP BY p.category
ORDER BY total_revenue DESC

SELECT TOP 3
    p.product_name,
    SUM(si.quantity) AS total_quantity_sold,
    p.stock_quantity
FROM products p
JOIN [sales_items] si ON p.product_id = si.product_id
GROUP BY p.product_name, p.stock_quantity
ORDER BY total_quantity_sold DESC

SELECT 
    p.product_name,
    p.category,
    p.brand,
    pr.promo_name,
    pr.discount_percentage
FROM products p
JOIN [promotion_product] pp ON p.product_id = pp.product_id
JOIN promotions pr ON pp.promo_id = pr.promo_id
ORDER BY pr.discount_percentage DESC

 SELECT 
    DATENAME(WEEKDAY, s.sale_date) AS day_name,
    COUNT(s.sale_id) AS total_sales,
    SUM(p.amount_paid) AS total_revenue
FROM sales s
JOIN payments p ON s.sale_id = p.sale_id
GROUP BY DATENAME(WEEKDAY, s.sale_date)
ORDER BY total_sales DESC
 
 SELECT 
    DATENAME(MONTH, s.sale_date) AS month_name,
    YEAR(s.sale_date) AS sale_year,
    COUNT(s.sale_id) AS total_sales,
    SUM(p.amount_paid) AS total_revenue
FROM sales s
JOIN payments p ON s.sale_id = p.sale_id
GROUP BY DATENAME(MONTH, s.sale_date), YEAR(s.sale_date)
ORDER BY total_revenue DESC
