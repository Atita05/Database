--- Task 3 creating views

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