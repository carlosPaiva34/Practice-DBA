use Northwind
--20-Showing categories and total products in each category
select c.CategoryName,count(p.ProductID) as totalProducts from Categories c 
inner join Products p on p.CategoryID=c.CategoryID
group by c.CategoryName order by totalProducts desc

--21 Showing customers per country and city
select Country,City,count(*) as totalCustomers from Customers group by Country,City order by totalCustomers desc
--Showing customers per country
select Country,count(*) as totalCustomers from Customers group by Country order by totalCustomers desc

--22-Showing Products that need reodering

select ProductName,UnitsInStock, ReorderLevel from Products where UnitsInStock <ReorderLevel order by ProductID

--23 Showing products that need reodering, continued
--Units in stock plus units on order are less than or equal to reoderlevel 
select ProductName,UnitsInStock,UnitsOnOrder, ReorderLevel,Discontinued from Products where (UnitsInStock+UnitsOnOrder)<=ReorderLevel
--The Discotinued flg is false 
select ProductName,UnitsInStock,UnitsOnOrder, ReorderLevel,Discontinued from Products where (UnitsInStock+UnitsOnOrder)<=ReorderLevel and Discontinued=0
--24 Showing customers list by region 

select t.CustomerID,t.CompanyName,t.Region from 
(select CustomerID,CompanyName,Region,
	case when region is null then 1 else 0 end as sortRegion 
from Customers ) as t order by  t.sortRegion,t.Region

select  ProductName, categorie= 
case CategoryID
	WHEN 1 THEN 'Beverages'
	WHEN 2 THEN 'Condiments'
	WHEN 3 THEN 'Confectionss'
	WHEN 4 THEN 'Dairy Productss'
	WHEN 5 THEN 'Grains/Cereals'
	WHEN 6 THEN 'Meat/Poultry'
	WHEN 7 THEN 'Produce'
	WHEN 8 THEN 'Seafood'
	else 'Não tem'
	end
from Products

select envio=case ShipVia
when 1 then 'Speedy Express'
when 2 then 'United Package'
when 3 then 'Federal Shipping'
else 'Não possui'
end,count(*) as total
FROM Orders group by ShipVia order by total desc

--25 Showing the three ship countries with the highest average freight 

select top 3 avg(Freight) as md,ShipCountry from Orders group by ShipCountry order by md desc














