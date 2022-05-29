                         **********************UC1**********************

================(Ability to create a Address Book Service DB)================================
mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| AddressBookServiceDB |
| information_schema   |
| mysql                |
| payroll_services     |
| performance_schema   |
| sys                  |
+----------------------+
6 rows in set (0.00 sec)

mysql>
mysql> use AddressBookServiceDB;
Database changed
                             ****************UC2*******************************

===========(Ability to create a Address Book Table with first and last names, address, city,state, zip, phone number and email as its attributes)==================
mysql> CREATE TABLE AddressBookServiceDB (
    -> firstName varchar(50) NOT NULL,
    -> lastName varchar(50) NOT NULL,
    -> address varchar(100),
    -> city varchar(20),
    -> state varchar(30),
    -> zip varchar(10),
    -> phoneNO varchar(20),
    -> email varchar(50));
Query OK, 0 rows affected (0.02 sec)

mysql> DESC AddressBookServiceDB;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| firstName | varchar(50)  | NO   |     | NULL    |       |
| lastName  | varchar(50)  | NO   |     | NULL    |       |
| address   | varchar(100) | YES  |     | NULL    |       |
| city      | varchar(20)  | YES  |     | NULL    |       |
| state     | varchar(30)  | YES  |     | NULL    |       |
| zip       | varchar(10)  | YES  |     | NULL    |       |
| phoneNO   | varchar(20)  | YES  |     | NULL    |       |
| email     | varchar(50)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

                    ****************UC3*********************

=============(Ability to insert new Contacts to Address Book)======================

mysql> INSERT INTO AddressBookServiceDB
    -> VALUES
    -> ('Anshul','Rathore','Talwandi','kota','rajasthan','324005','8764314432','ansh@gmail.com'),
    -> ('Deepesh','Rathore','Sangod','kota','rajasthan','364005','8766544432','deep@gmail.com'),
    -> ('Ashish','Marshal','nagar','pune','mh','400654','9754321465','ashish@gmail.com'),
    -> ('Mahesh','kumar','dgsj','nagar','andra','987432','8764314432','mahesh@gmail.com'),
    -> ('Rahul','Jain','Talwandi','kota','rajasthan','324765','234567890','rahul@gmail.com');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

                    ***************UC4***********************

================(Ability to edit existing contact person using their name)=================

mysql> SELECT * FROM AddressBookServiceDB WHERE firstName = 'Anshul' AND lastName = 'Rathore';
+-----------+----------+----------+------+-----------+--------+------------+----------------+
| firstName | lastName | address  | city | state     | zip    | phoneNO    | email          |
+-----------+----------+----------+------+-----------+--------+------------+----------------+
| Anshul    | Rathore  | Talwandi | kota | rajasthan | 324005 | 8764314432 | ansh@gmail.com |
+-----------+----------+----------+------+-----------+--------+------------+----------------+
1 row in set (0.00 sec)

mysql> UPDATE AddressBookServiceDB SET city = 'JAIPUR' WHERE firstName = 'Anshul' AND lastName = 'Rathore';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM AddressBookServiceDB WHERE firstName = 'Anshul' AND lastName = 'Rathore';
+-----------+----------+----------+--------+-----------+--------+------------+----------------+
| firstName | lastName | address  | city   | state     | zip    | phoneNO    | email          |
+-----------+----------+----------+--------+-----------+--------+------------+----------------+
| Anshul    | Rathore  | Talwandi | JAIPUR | rajasthan | 324005 | 8764314432 | ansh@gmail.com |
+-----------+----------+----------+--------+-----------+--------+------------+----------------+
1 row in set (0.00 sec)

                    *****************UC5************************

========================(Ability to delete a person using person name)===========================

mysql> DELETE FROM AddressBookServiceDB WHERE firstName = 'Deepesh' And lastName = 'Rathore';
Query OK, 1 row affected (0.00 sec)

mysql> SELECT FirstName , lastname , address , city , state , zip , phoneNO , email FROM AddressBookServiceDB;
+-----------+----------+----------+--------+-----------+--------+------------+------------------+
| FirstName | lastname | address  | city   | state     | zip    | phoneNO    | email            |
+-----------+----------+----------+--------+-----------+--------+------------+------------------+
| Anshul    | Rathore  | Talwandi | JAIPUR | rajasthan | 324005 | 8764314432 | ansh@gmail.com   |
| Ashish    | Marshal  | nagar    | pune Ability to add person

to both Friend and

Family  | mh        | 400654 | 9754321465 | ashish@gmail.com |
| Mahesh    | kumar    | dgsj     | nagar  | andra     | 987432 | 8764314432 | mahesh@gmail.com |
| Rahul     | Jain     | Talwandi | kota   | rajasthan | 324765 | 234567890  | rahul@gmail.com  |
+-----------+----------+----------+--------+-----------+--------+------------+------------------+
4 rows in set (0.00 sec)


                    ***************UC6*************************

=======================(Ability to Retrieve Person belonging to a City or State from the Address Book)========================

mysql> SELECT FirstName , lastname , address , city , state , zip , phoneNO , email FROM AddressBookServiceDB WHERE state = 'rajasthan';
+-----------+----------+----------+--------+-----------+--------+------------+-----------------+
| FirstName | lastname | address  | city   | state     | zip    | phoneNO    | email           |
+-----------+----------+----------+--------+-----------+--------+------------+-----------------+
| Anshul    | Rathore  | Talwandi | JAIPUR | rajasthan | 324005 | 8764314432 | ansh@gmail.com  |
| Rahul     | Jain     | Talwandi | kota   | rajasthan | 324765 | 234567890  | rahul@gmail.com |
+-----------+----------+----------+--------+-----------+--------+------------+-----------------+
2 rows in set (0.00 sec)

mysql> SELECT FirstName , lastname , address , city , state , zip , phoneNO , email FROM AddressBookServiceDB WHERE city = 'kota';
+-----------+----------+----------+------+-----------+--------+-----------+-----------------+
| FirstName | lastname | address  | city | state     | zip    | phoneNO   | email           |
+-----------+----------+----------+------+-----------+--------+-----------+-----------------+
| Rahul     | Jain     | Talwandi | kota | rajasthan | 324765 | 234567890 | rahul@gmail.com |
+-----------+----------+----------+------+-----------+--------+-----------+-----------------+
1 row in set (0.00 sec)


                   ***************UC7*************************

===================(Ability to understand the size of address book by City and State)=========================

mysql> SELECT COUNT(firstName) AS contacts_count FROM AddressBookServiceDB WHERE city = 'JAIPUR';
+----------------+
| contacts_count |
+----------------+
|              1 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(firstName) AS contacts_count FROM AddressBookServiceDB WHERE state = 'RAJASTHAN';
+----------------+
| contacts_count |
+----------------+
|              2 |
+----------------+
1 row in set (0.00 sec)

                   ***************UC8*********************

===================(Ability to retrieve entries sorted alphabetically by Person’s name for a given city)=================

mysql> SELECT * FROM AddressBookServiceDB ORDER BY firstName;
+-----------+----------+----------+--------+-----------+--------+------------+------------------+
| firstName | lastName | address  | city   | state     | zip    | phoneNO    | email            |
+-----------+----------+----------+--------+-----------+--------+------------+------------------+
| Anshul    | Rathore  | Talwandi | JAIPUR | rajasthan | 324005 | 8764314432 | ansh@gmail.com   |
| Ashish    | Marshal  | nagar    | pune   | mh        | 400654 | 9754321465 | ashish@gmail.com |
| Mahesh    | kumar    | dgsj     | nagar  | andra     | 987432 | 8764314432 | mahesh@gmail.com |
| Rahul     | Jain     | Talwandi | kota   | rajasthan | 324765 | 234567890  | rahul@gmail.com  |
+-----------+----------+----------+--------+-----------+--------+------------+------------------+
4 rows in set (0.00 sec)

                   ******************UC9***********************

===================(Ability to identify each Address Book with name and Type. Here the type could Family, Friends,
                       Profession Alter Address Book to add name and type)==============================

mysql> ALTER TABLE AddressBookServiceDB ADD(Book_Name VARCHAR(50) NOT NULL,Type VARCHAR(50) NOT NULL);
 Query OK, 0 rows affected (0.04 sec)
 Records: 0  Duplicates: 0  Warnings: 0

 mysql> select * from AddressBookServiceDB;
 +-----------+----------+----------+--------+-----------+--------+------------+------------------+-----------+------+
 | firstName | lastName | address  | city   | state     | zip    | phoneNO    | email            | Book_Name | Type |
 +-----------+----------+----------+--------+-----------+--------+------------+------------------+-----------+------+
 | Anshul    | Rathore  | Talwandi | JAIPUR | rajasthan | 324005 | 8764314432 | ansh@gmail.com   |           |      |
 | Ashish    | Marshal  | nagar    | pune   | mh        | 400654 | 9754321465 | ashish@gmail.com |           |      |
 | Mahesh    | kumar    | dgsj     | nagar  | andra     | 987432 | 8764314432 | mahesh@gmail.com |           |      |
 | Rahul     | Jain     | Talwandi | kota   | rajasthan | 324765 | 234567890  | rahul@gmail.com  |           |      |
 +-----------+----------+----------+--------+-----------+--------+------------+------------------+-----------+------+
 4 rows in set (0.00 sec)

 mysql> UPDATE AddressBookServiceDB SET Book_Name = "BRIDGELABZ", Type = "SOFTWARE ENG." where firstName = "Anshul";
 Query OK, 1 row affected (0.01 sec)
 Rows matched: 1  Changed: 1  Warnings: 0

 mysql> select * from AddressBookServiceDB;
 +-----------+----------+----------+--------+-----------+--------+------------+------------------+------------+---------------+
 | firstName | lastName | address  | city   | state     | zip    | phoneNO    | email            | Book_Name  | Type          |
 +-----------+----------+----------+--------+-----------+--------+------------+------------------+------------+---------------+
 | Anshul    | Rathore  | Talwandi | JAIPUR | rajasthan | 324005 | 8764314432 | ansh@gmail.com   | BRIDGELABZ | SOFTWARE ENG. |
 | Ashish    | Marshal  | nagar    | pune   | mh        | 400654 | 9754321465 | ashish@gmail.com |            |               |
 | Mahesh    | kumar    | dgsj     | nagar  | andra     | 987432 | 8764314432 | mahesh@gmail.com |            |               |
 | Rahul     | Jain     | Talwandi | kota   | rajasthan | 324765 | 234567890  | rahul@gmail.com  |            |               |
 +-----------+----------+----------+--------+-----------+--------+------------+------------------+------------+---------------+
 4 rows in set (0.00 sec)

                                     ******************UC10***********************

===================(Ability to get number of contact persons i.e. count by type)=====================================

mysql> SELECT COUNT(Type) FROM AddressBookServiceDB GROUP BY Type;
+-------------+
| COUNT(Type) |
+-------------+
|           1 |
|           3 |
+-------------+
2 rows in set (0.04 sec)

                                    ******************UC11***********************

====================(Ability to add person to both Friend and Family)=============================

mysql> INSERT INTO AddressBookServiceDB  VALUES('saurabh','sharma','dadabari','kota','rajasthan','345675','0987654321','sa@gmail.com','tcs','profession');
Query OK, 1 row affected (0.00 sec)

mysql> select * from AddressBookServiceDB;
+-----------+----------+----------+--------+-----------+--------+------------+------------------+------------+---------------+
| firstName | lastName | address  | city   | state     | zip    | phoneNO    | email            | Book_Name  | Type          |
+-----------+----------+----------+--------+-----------+--------+------------+------------------+------------+---------------+
| Anshul    | Rathore  | Talwandi | JAIPUR | rajasthan | 324005 | 8764314432 | ansh@gmail.com   | BRIDGELABZ | SOFTWARE ENG. |
| Ashish    | Marshal  | nagar    | pune   | mh        | 400654 | 9754321465 | ashish@gmail.com |            |               |
| Mahesh    | kumar    | dgsj     | nagar  | andra     | 987432 | 8764314432 | mahesh@gmail.com |            |               |
| Rahul     | Jain     | Talwandi | kota   | rajasthan | 324765 | 234567890  | rahul@gmail.com  |            |               |
| saurabh   | sharma   | dadabari | kota   | rajasthan | 345675 | 0987654321 | sa@gmail.com     | tcs        | profession    |
+-----------+----------+----------+--------+-----------+--------+------------+------------------+------------+---------------+
5 rows in set (0.00 sec)
