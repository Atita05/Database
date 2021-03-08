-- 2nd task:- 
insert into Outlet values('Natwest','Egham','London');
insert into Outlet values('Grilled Chicken','Stains','London');
insert into Outlet values('KFC','Banglore','India');
insert into Outlet values('Dominos','Pune','India');
insert into Outlet values('Tesco','EghamStreet','England');
———————————————
insert into Customer values(101,'Rajkunwar Sawant','Pune','India');
insert into Customer values(102,'Chaitali Joshi','Banglore','India');
insert into Customer values(103,'John P','Bread street','England');
insert into Customer values(104,'Smith Johnson','Bacon st','London');
insert into Customer values(105,'David Johnson','Kings Road','EghamStreet');

—————————————

insert into Product values(101,'Reebok','shoe company',30000);
insert into Product values(1341,'Johnson Baby','Children health product company',400000);
insert into Product values(191,'Navneet','Notebook company',798797);
insert into Product values(111,'FoodNFood','Food products',898977);
insert into Product values(121,'Nike','shoe company',70000);
—————————

insert into Category values(10,'Footware');
insert into Category values(11,'Food');
insert into Category values(12,'Books');
insert into Category values(13,'BeautyProducts');
insert into Category values(14,'ChildHealth');

————————————cant insert other data due to constraint here------
insert into Product_Category values(101,10);
insert into Product_Category values(111,11);
insert into Product_Category values(121,12);
insert into Product_Category values(191,13);
insert into Product_Category values(1341,14);
————————————

insert into Purchase values(1000001,'2020-12-31','Natwest',101);
insert into Purchase values(1000002,'2019-08-31','Grilled Chicken',102);
insert into Purchase values(1000003,'2020-09-30','KFC',103);
insert into Purchase values(1000004,'2020-10-31','Dominos',104);
insert into Purchase values(1000005,'2020-11-30','Tesco',105);

—————————————
insert into PurchaseItem values(1000001,101,1000,878);
insert into PurchaseItem values(1000001,101,1000,20);
insert into PurchaseItem values(1000002,1341,500,87);
insert into PurchaseItem values(1000002,101,500,87);
insert into PurchaseItem values(1000003,191,8,600);
insert into PurchaseItem values(1000003,191,8,7);
insert into PurchaseItem values(1000004,111,90,30);
insert into PurchaseItem values(1000004,191,90,39);
insert into PurchaseItem values(1000005,121,10,6);
insert into PurchaseItem values(1000005,121,10,4); 
insert into PurchaseItem values(1000005,191,10,8); 
————————————————
insert into Stock values('Natwest',101,400000);
insert into Stock values('Grilled Chicken',1341,4000000);
insert into Stock values('KFC',191,5000000);
insert into Stock values('Dominos',111,800000);
insert into Stock values('FishNChips',121,50000);