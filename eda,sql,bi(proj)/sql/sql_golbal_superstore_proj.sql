# create DataBase 
CREATE DATABASE sales_project;
USE sales_project;

create table superstore (
     order_date date,
     region varchar(50),
     category varchar(50),
     sub_category varchar(50),
     product_name varchar(255),
     segment varchar(50),
     sales float,
     profit float
);

INSERT INTO superstore VALUES
('2014-01-10','West','Technology','Phones','iPhone','Consumer',1200,300),
('2014-02-15','East','Furniture','Tables','Wood Table','Corporate',800,-50),
('2014-03-20','Central','Office Supplies','Binders','Binder Set','Consumer',200,40),
('2014-04-25','South','Technology','Accessories','Mouse','Home Office',150,30),
('2014-05-10','West','Furniture','Bookcases','Bookcase','Consumer',600,-80),
('2014-06-18','East','Technology','Phones','Samsung Phone','Corporate',900,200),
('2014-07-22','Central','Office Supplies','Paper','A4 Paper','Consumer',100,20),
('2014-08-30','South','Furniture','Chairs','Office Chair','Home Office',700,150),
('2014-09-12','West','Technology','Laptops','Dell Laptop','Consumer',1500,400),
('2014-10-05','East','Office Supplies','Storage','Storage Box','Corporate',300,60),
('2014-11-11','Central','Technology','Phones','OnePlus','Consumer',1100,250),
('2014-12-20','South','Furniture','Tables','Dining Table','Home Office',950,-100),
('2015-01-15','West','Office Supplies','Binders','Binder Pack','Consumer',250,50),
('2015-02-18','East','Technology','Accessories','Keyboard','Corporate',180,40),
('2015-03-22','Central','Furniture','Bookcases','Wood Shelf','Consumer',650,-60),
('2015-04-10','South','Office Supplies','Paper','Notebook','Home Office',120,25),
('2015-05-12','West','Technology','Phones','iPhone','Consumer',1300,350),
('2015-06-15','East','Furniture','Chairs','Gaming Chair','Corporate',850,180),
('2015-07-20','Central','Technology','Laptops','HP Laptop','Consumer',1400,300),
('2015-08-25','South','Office Supplies','Storage','File Box','Home Office',280,55);

# Revenue trend 
select date_format(order_date, '%Y-%m') as month, sum(sales)
from superstore
group by month; 
# Insight:
-- Sales show a consistent upward trend over time, indicating business growth
-- Peak sales are observed in later months, suggesting seasonal demand patterns
-- The business experiences higher revenue during year-end periods

# 2. Region performance
select region, sum(sales), sum(profit)
from superstore
group by region; 
 ### Insight:
-- The West region is the top-performing region in terms of both sales and profit
-- The Central region shows relatively lower performance, indicating potential improvement areas
-- Profit contribution varies across regions, highlighting regional efficiency differences

# Top 10 products
select
     product_name,
     sum(sales) as revenue
from superstore
group by product_name
order by revenue desc
limit 10;
### Insight:
-- A small number of products contribute significantly to total revenue
-- Indicates high dependency on top-performing products
-- These products can be prioritized for marketing and inventory planning

# category analysis
select 
    category,
    sum(sales) as total_sales,
    sum(profit) as total_profit
from superstore
group by category;
# Insight:
-- The Technology category generates the highest sales and profit, making it the most valuable segment
-- The Furniture category has relatively lower profit margins, despite decent sales
-- Suggests the need for cost optimization in Furniture category

# Loss Analysis
select sub_category, sum(profit)
from superstore
group by sub_category
order by sum(profit) asc; -- tables,bookcases are giving the losses
# Insight:
-- Sub-categories such as Tables and Bookcases are consistently loss-making
-- These losses negatively impact overall profitability
-- Indicates a need for pricing strategy revision or cost control