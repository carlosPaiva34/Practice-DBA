use Northwind
--20-Showing categories and total products in each category
select c.CategoryName,count(p.ProductID) as totalProducts from Categories c 
inner join Products p on p.CategoryID=c.CategoryID
group by c.CategoryName order by totalProducts desc

--21 Showing customers per country and city
select Country,City,count(*) as totalCustomers from Customers group by Country,City order by totalCustomers desc
--Showing customers per country
select Country,count(*) as totalCustomers from Customers group by Country order by totalCustomers desc

