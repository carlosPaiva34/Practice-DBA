use Northwind
--3 Sales representatives
select FirstName,LastName,HireDate from Employees where Title='Sales Representative'
--4 Sales representatives and United States
select FirstName,LastName,HireDate from Employees where Title='Sales Representative' and Country='USA'
--5 Orders Placed Id=5
select * from Orders where EmployeeID=5
--6 Suppliers 
select SupplierID,ContactName,ContactTitle from Suppliers where  not ContactTitle='Marketing Manager'
--7 Products with 'queso'

select ProductID,ProductName from Products where ProductName like '%Queso%'
--8 Orders shipping to France or Belgium
select OrderID,CustomerID,ShipCountry from Orders where ShipCountry='France' or ShipCountry='Belgium'
select OrderID,CustomerID,ShipCountry from Orders where ShipCountry in('France','Belgium')
--9 Orders shipping to any country Latin America

select OrderID,CustomerID,ShipCountry from Orders where ShipCountry in('Brazil','Mexico','Argentina','Venezuela')

--10 Employer in Order of age
select FirstName,LastName,Title,BirthDate from Employees order by BirthDate
-- 11 Showing only  the date 

select FirstName,LastName,Title, cast(BirthDate as date) as data from Employees order by BirthDate
select FirstName,LastName,Title, convert(date,BirthDate)  as data from Employees

12--Showing fullnames Employers

select FirstName,LastName,FirstName+' '+LastName as fullName from Employees
13--Showing OrderDetails amount per line item

select OrderID, ProductID, UnitPrice, Quantity ,(UnitPrice*Quantity)as TotalPreice from OrderDetails order by OrderID,ProductID

14--How many custoners 

select COUNT(*) as totalcustomers from Customers
15--Showing date first order 

select min(OrderDate) as FirstOrder from Orders
16--Showing list customers where there are count Nortewinds'customers
select Country,count(*) as totalCustomers from Customers group by Country order by totalCustomers desc 
17--Showing contact title for customers

select ContactTitle, count(*) as totalContact from Customers group by ContactTitle order by totalContact desc

18--Showing product with name of supplier

select p.ProductID,p.ProductName,s.CompanyName as nameSupplier  from Products p 
inner join Suppliers s on p.SupplierID=s.SupplierID order by ProductID

19-- Showing order and shipper

select  o.OrderID,o.OrderDate,s.CompanyName as shipperName  from Orders o inner join Shippers s on o.ShipVia=s.ShipperID where OrderID <10300  order by OrderID


select o.ShipVia,s.CompanyName, count(*) as totalshipvia from Orders o join Shippers s on o.ShipVia=s.ShipperID 

group by o.ShipVia,s.CompanyName order by totalshipvia desc
