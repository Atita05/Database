
# Database
Instructions
Below is given an example design for a supermarket chain database design. For reference, both an ER-diagram and relational model description are included. Your task is to write SQL instructions to (1) create a database implementing such a design, (2) populating the database with data, and (3) creating SQL statements according to a list of queries.

The relational model is as follows. Primary key attributes are written surrounded by _underscores_ emulating an underline.

Outlet(_outlet_name_, address_street, address_city).

Customer(_customer_nr_, customer_name, address_street, address_city).

Product(_product_id_, product_name, description, standard_price).

Category(_category_id_, description).

Product_Category(_product\_id_, _category_id_). The attribute product_id references the PK of Product. The attribute category_id references the PK of Category. (Note: This relation represents a many-to-many relationship, i.e., a product can belong to several categories.)

Purchase(_purchase_id_, date_time, outlet_name, customer_nr). The attribute outlet_name references the PK of Outlet. The attribute customer_nr references the PK of Customer.

PurchaseItem(_purchase_id_, _product_id_, copies, price_per_copy). The attribute purchase_id references the PK of Purchase. The attribute product_id references the PK of Product. (Note: This relation represents a many-to-many relationship, i.e., each purchase could contain many different products.)

Stock(_outlet_name_, _product_id_, copies). The attribute outlet_name references the PK of Outlet. The attribute product_id references the PK of Product. (Note: This relation represents a many-to-many relationship, since each product is sold in many outlets and each outlet sells many products.)

For reference, here is an ER-diagram for the same design.

ER-diagram
ER-diagram
Tasks
Your tasks are the following.

1. Create tables
Create a file createdb.sql containing SQL instructions for creating tables corresponding to the relations given above.

2. Populate tables
Create a file inserts.sql containing a sequence of SQL INSERT statements to populate your tables. Every table should have at least 5 rows, since this is the minimum number of rows expected for testing purposes. 

Advice: Take care not to accidentally make your data too simple in format! For example, if you create a database where every purchase contains only one purchaseitem, and every product is a part of only one purchase, then there is a large risk that your SQL queries in task 3 contain bugs that your data did not reveal.

3. Write queries
Define queries, in SQL, to obtain the following information over the database you created. Note that these should work with any data that can be present in the model, not just for the test data you used. The queries must be included as part of your submission in a file named queries.sql.

To begin with, create two useful views to simplify further processing:

Create a view named purchase_item_total that adds the derived attribute item_total to purchase_item, where item_total contains the total price paid by the customer for the purchase_item line. That is, purchase_item_total contains attributes (purchase_id, product_id, copies, price_per_copy, item_total)whereitem_totalis the product ofcopiesandprice_per_copy`. 


Using purchase_item_total, create a second view called purchase_total with two attributes (purchase_id, total_paid) where total_paid is the sum of the item_total across all purchase item lines in the purchase. 

In both of these views, you are allowed to add extra attributes if you find it appropriate to do so.

With the views created, define SQL queriy instructions for the following requests. Your queries may of course use the views you just created.

A list of all purchases made at a particular outlet (for example, ‘Egham Main Street’), ordered by time, giving for each the time, the number of different product types purchased, and the total price paid by the customer.

A list of all customers who have made a purchase to a total value of more than 100 pounds at the same occasion, giving for each the name, address, the average purchase value, and the maximum purchase value. 

A list of all products, giving for each the name, the total number of copies in stock across all outlets, and the total number of copies sold. Order the list by number of copies sold in decreasing order.

A list of all cities where the total sales of products from category 10 are larger than from category 11, as measured by the total price paid for them. Give for each the city name, the number of outlets in the city, the total sales value for products from category 10, and the total sales value for products from category 11. The list should not contain any repeated cities. 
