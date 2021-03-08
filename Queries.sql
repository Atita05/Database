--- Task 3 creating views
-- created one final view only for all joins here only
CREATE VIEW Purchase_item_total AS
Select  
C.Customer_Name ,
PI.price_per_copy,
PI.copies,
(PI.price_per_copy *PI.copies) as item_total,
P.Purchase_Id,
PI.Product_Id,
P.Date_time,
P.Outlet_Name,
P.Customer_Number,
O.Address_City
from Customer C inner join Purchase P On C.Customer_Number=P.Customer_Number  
Inner Join PurchaseItem PI on PI.Purchase_Id = P.Purchase_Id
Inner join Outlet O On O.Outlet_Name = P.Outlet_Name
Inner Join Product_Category PC On PI.Product_Id = PC.Product_Id
Inner Join Category C on PC.Category_Id = C.Category_Id
;

CREATE VIEW purchase_total AS
Select Purchase_Id, Sum(item_total) as item_total
FROM Purchase_item_total
Group by Purchase_Id
;

--- Final queries  task 4
--1
select 
Outlet_Name,
Customer_Name,
Sum(item_total) as Total_Item_Purchased,
Count(Distinct Product_id) as 'Number_of_Product_Purchased',
Date_Time 'Time_When_Purchased'
from Purchase_item_total PT 
Where Outlet_Name='Tesco'
Group by Customer_Name,PT.Purchase_Id,Outlet_Name,Date_Time,Copies,PT.Product_id
Order by Date_Time 
;
--2
select Distinct
C.Customer_Name,
C.Address_Street,
Avg(PI.item_total)Avg_item_Total,
Max(PI.item_total)Max_Copies
from Purchase_item_total PI, Customer C
Where C.customer_Number=PI.customer_Number
and PI.item_total> 100
group by C.Customer_Name,C.Address_Street,C.Address_City
;
---3
Select p.*,
(st.Stock_Product_Count-pi.Sold_product_Count) as total_copies_stock,
pi.Sold_product_Count as Total_Purchased,st.Stock_Product_Count,
p.Product_id from product p,              
(SELECT Product_id,SUM(Copies) Stock_Product_Count FROM Stock GROUP BY Product_id) st,
(SELECT Product_id,SUM(Copies) Sold_product_Count FROM PurchaseItem GROUP BY Product_id) pi
where p.Product_id = st.Product_id
AND p.Product_id =pi.Product_id
order by pi.Sold_product_Count desc;

-----4 created cat 10 and 11 max sell here
Select  Address_City,count(Outlet_Name)OutletCount,Sum(Cat10)Cat10,Sum(Cat11)Cat11 from 
(
SELECT DISTINCT
   item_total ,Address_City,Outlet_Name,Category_Id,
    sum( if( Category_Id = '10', item_total, 0 ) ) AS Cat10,  
    sum( if( Category_Id = '11', item_total, 0 ) ) AS Cat11
FROM 
    Purchase_item_total 
GROUP BY 
  item_total,Address_City,Outlet_Name, Category_Id)A
where Cat10!=0 OR Cat11!=0
Group by Address_City
