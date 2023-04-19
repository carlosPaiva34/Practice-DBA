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

Select T.CustomerID, T.CompanyName, T.Region
from
    (Select CustomerID, CompanyName, Region,
            Case when Region is null then 1 else 0 End As SortField
    from Customers) AS T
order by T.SortField, T.Region, T.CustomerID

Select CustomerID, CompanyName, Region,
            Case when Region is null then 1 else 0 End As SortField
    from Customers



select CustomerID,CompanyName,Region,
case when Region  is null then 1 else 0 end  from Customers













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
