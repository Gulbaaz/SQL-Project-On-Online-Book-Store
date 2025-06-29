create database OnlineBookStore;
use OnlineBookStore;

-- DROP in correct order (child to parent)
drop table if exists orders;
drop table if exists customers;
drop table if exists books;

-- BOOKS
create table books (
  Book_ID serial primary key,
  Title varchar(100),
  Author varchar(100),
  Genre varchar(100),
  Published_Year int,
  Price numeric(10,2),
  Stock int
);

-- CUSTOMERS
create table customers (
  Customer_ID serial primary key,
  Name varchar(100),
  Email varchar(100),
  Phone varchar(15),
  City varchar(100),
  Country varchar(100)
);

-- ORDERS
create table orders (
  Order_ID serial primary key,
  Customer_ID int references customers(Customer_ID),
  Book_ID int references books(Book_ID),
  Order_Date date,
  Quantity int,
  Total_Amount numeric(10,2)
);

-- Check if tables are empty
select * from books;
select * from customers;
select * from orders;

-- Import CSV into books table : By using the Import Wizard Files as our file is in CSV format

-- Basic Queries

-- (1) Retrieve all the books in "Fiction" Genre
select * from books
where Genre = "Fiction";

-- (2) Find books published after the year 1950
select * from books
where Published_Year > 1950;

-- (3) List all customers from the Canada
select * from customers
where Country = "Canada";

-- (4) Show orders placed in November 2023
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

-- (5) Retrieve the total stock of books available
select SUM(Stock) as Total_Stock
from books;

-- (6) Find the details of the most expensive book
select * from books
order by price desc
limit 1; 

-- (7) Show all customers who ordered more than 1 quantity of a book
select * from orders
where quantity > 1;

-- (8) Retrieve all orders where the total amount exceeds $20
select * from orders
where Total_Amount > 20; 

-- (9) List all genres available in the Books table
select distinct Genre
from books;

-- (10) Find the book with the lowest stock
select * from books
order by Stock asc
limit 1;

-- (11) Calculate the total revenue generated from all orders
select sum(Total_Amount) as Revenue 
from orders;

-- Advance Queries

-- (1) Retrieve the total number of books sold for each genre
select b.Genre, sum(o.Quantity) as Total_Books_Sold
from orders o 
join books b on o.Book_ID = b.Book_ID
group by b.Genre
;

-- (2) Find the average price of books in the "Fantasy" genre
select avg(Price) as Average_Price
from books
where Genre = "Fantasy";

-- (3) List customers who have placed at least 2 orders
select o.Customer_ID, c.Name, count(o.Order_ID) as Order_Count
from orders o
join customers c on c.Customer_ID = o.Customer_ID
group by o.Customer_ID, c.name
having count(o.Order_ID) >=2 
; 

-- (4) Find the most frequently ordered book
select o.Book_ID, b.Title, count(o.Order_ID) as Order_Count
from orders o
join books b on b.Book_ID = o.Book_ID
group by Book_ID
order by Order_Count desc
limit 1
; 

-- (5) Show the top 3 most expensive books of 'Fantasy' Genre
select Title from books
where Genre = 'Fantasy'
order by price desc 
limit 3;

-- (6) Retrieve the total quantity of books sold by each author
select b.Author, sum(o.Quantity) as Total_Books_Sold
from books b
join orders o on b.Book_ID = o.Book_ID
group by b.Author
order by sum(o.Quantity)
;

-- (7) List the cities where customers who spent over $30 are located
select distinct c.City, total_amount 
from orders o
join customers c on o.Customer_ID = c.Customer_ID
where o.Total_Amount > 30
;

-- (8) Find the customer who spent the most on orders
select c.Customer_ID, c.Name, sum(o.Total_Amount) as Total_Spend
from customers c
join orders o on c.Customer_ID = o.Customer_ID
group by c.Customer_ID, c.Name
order by Total_Spend desc
limit 1
;

-- (9) Calculate the stock remaining after fulfilling all orders
select b.Book_Id, b.Title, b.Stock, coalesce(sum(Quantity),0) as Order_quantity, b.stock - coalesce(sum(Quantity),0) as Remaining_Stock
from books b
left join orders o on b.Book_ID = o.Book_ID
group by b.Book_ID
order by b.Book_ID
;

