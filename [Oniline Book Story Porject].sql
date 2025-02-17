CREATE DATABASE PROJECT
USE PROJECT

SELECT * FROM BOOKS
select * from Customers
select * from [Orders (1)]
--Some basic queries

 --1) Retrieve all books in the "Fiction" genre
 select Title as All_Books from Books where Genre='Fiction'

 --2) Find books published after the year 1950
 select Title as Books from books where Published_Year>1950

 --3) List all customers from the Canada
 select Name as customers_Name from Customers where country='Canada'

 --4) Show orders placed in November 2023
 select * from [Orders (1)] where Order_Date between '2023-11-01' and '2023-11-30'

 --5) Retrieve the total stock of books available
 select sum(stock) as Total_stoch from books

 --6) Find the details of the most expensive book
select top(10) * from books order by price desc

 --7) Show all customers who ordered more than 1 quantity of a book
 with cte as(
				select *  from [Orders (1)] where Quantity>1
 )
 select c.Customer_ID,Customers.Name,c.Quantity,c.Total_Amount from cte c
				inner join Customers  on Customers.Customer_ID=c.Customer_ID

 --8) Retrieve all orders where the total amount exceeds $20
 select * from [Orders (1)] where Total_Amount>20

 --9) List all genres available in the Books table
 select distinct(genre) as List_of_genres from books 

 --10) Find the book with the lowest stock
 select * from books order by stock asc

 --11) Calculate the total revenue generated from all orders
 select sum(total_Amount) as Revenue from [Orders (1)]

-- Advance Queries 

-- 1) Retrieve the total number of books sold for each genre
select B.genre, sum(quantity)[Total sold books]
from [Orders (1)] O inner join books B on O.Book_ID=B.Book_ID 
group by B.Genre

-- 2) Find the average price of books in the "Fantasy" genre
select genre,AVG(price) from books group by genre having genre='Fantasy'

-- 3) List customers who have placed at least 2 orders
select C.Customer_ID, C.Name,count(O.Book_ID) Order_Placed
from Customers C inner join [Orders (1)] O on C.Customer_ID=O.Customer_ID 
group by C.Customer_ID, C.Name having count(O.Book_ID)>1
order by Order_Placed desc

-- 4) Find the most frequently ordered book
select O.Book_ID,B.Title,count(order_ID) Ordered_book 
from [Orders (1)] O inner join books B on O.Book_ID=B.Book_ID
group by O.Book_ID,B.Title 
order by Ordered_book desc

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 
select top(3) Title,Price 
from books where genre='Fantasy'
order by price desc

-- 6) Retrieve the total quantity of books sold by each author
select B.Author, sum(O.Quantity)sold_by_author 
from [Orders (1)] O inner join Books B on B.Book_ID=O.Book_ID 
group by B.Author

-- 7) List the cities where customers who spent over $30 are located
select C.city,round(sum(O.Total_Amount),2) spent_$30 
from Customers C inner join [Orders (1)] O on C.Customer_ID=O.Customer_ID
group by c.City having sum(O.Total_Amount)>30

-- 8) Find the customer who spent the most on orders
select top(3) c.customer_ID,c.name,sum(o.Total_Amount) as Total_spent 
from Customers c inner join [Orders (1)] o on c.Customer_ID=o.Customer_ID
group by c.Customer_ID,c.Name order by Total_spent desc

-- 9) Calculate the stock remaining after fulfilling all order
select B.Book_ID,B.Title,B.Stock,coalesce(sum(O.Quantity),0) as Order_Quanty
,B.Stock-coalesce(sum(O.Quantity),0) as Remaining_stock
from books B left join [Orders (1)] O on B.Book_ID=O.Book_ID
group by B.Book_ID,B.Title,B.Stock
-- 10)find out the  order details of customer whose customer ID is "84".   using query and subquery
select * from [Orders (1)] 
		where Customer_ID=
			(select Customer_ID from Customers where Customer_ID =84)