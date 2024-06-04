# Installation Process
01. Install XAMPP

02. Open XAMPP Control panal and start [apache] and [mysql]

03. Download project from github 
    
04. extract files in (htdocs) folder and keep the folder name huster-store (After installing the XAMPP, open the (XAMPP) folder. then you will get (htdocs) folder)

05. open link http://localhost/phpmyadmin

06. click on new at side navbar

07. give a database name as (huster-store) hit on create button

08. after creating database name click on import

09. browse the file in directory [Xampp\htdocs\huster-store\database\huster-store.sql]

10. after importing successfully

11. open any browser and type http://localhost/huster-store

12. first register and then login

13. admin login details  Email= admin@huster.com or username= admin and Password= 123456789


- Problems so far:
+ Fix landing page (home)
+ Displaying checkout.php(fix css)
+ check_out process.php
+ Fix body.php(top_selling, others)
+ Fix css of the whole file(header, footer, body)
+ Fix store.php (clicking converse before clicking others)
+ Fix title of the shoes
+ Fix price so it goes according to the USD
+ What action.php does ?
+ Unable to encrypt password into database
+ Filter according to price
+ Fix brands_id
+ In payments_success, where is profile.php
+ Convert to sql server
+ Fix store.php to do some work
+ Use search options to find
+ Fix the slider
+ Fix description of the shoes


- admin: 
+ product_list: url not achievable
+ Fix css files of admin login
+ Fix css files in admin dashboard
+ Activity.php



- Files need to review
+ homeaction.php
+ action.php
+ product.php
+ body.php


- Files do not touch: 
+ login_form.php
+ index.php
+ registers form.php
+ newsletter.php
+ offersmail.php (read eamil info)
+ logout.php					
+ errors.php
+ db.php 
+ addproducts.php

SQL: 
+ ORDER BY FILTER
+ CREATE INDEX to filter faster, use full text search 
+Transaction