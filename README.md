**DATABASE CAPSTONE PROJECT**

In this project, I was required to create a data model for Little Lemon Restaurant and deploy it in the MySQL database. This includes a set of tables to store relevant information. I have populated the tables with some records of data for testing purposes. In addition, I have analyzed data using the Little Lemon Excel Data File.  I have completed the data analysis in Tableau .I also create database client using python and jupyter notebook IDE.

I have learned  following tools and software:

•Git,

•MySQL Workbench,

•Tableau,

•Python,

•Jupyter Notebook


In this project, I have proven my ability to:

•Set up a database project

•creating Reports

•Changes in the database

•Doing data analysis and visualization

•Create a database client.


Following Tasks were completed in this Project :

**Task 1 :**

Little Lemon needs to build a robust relational database system in MySQL in which they can store large amounts of data. use MySQL Workbench to create ER diagram and normalized it(1NF,2NF and 3NF).Then created the following tables. 


**Bookings:** To store information about booked tables in the restaurant including booking ID, date, and table number.

**Orders:** To store information about each order such as order date, quantity, and total cost.

**Order delivery status:** To store information about the delivery status of each order such as delivery date and status.

**Menu:** To store information about cuisines, starters, courses, drinks, and desserts.

**Customer details:** To store information about the customer's names and contact details.

**Staff information:** Including role and salary.


To commit the work in the github , I have create a new branch in the git  and commit the changes to Git and push and pull the changes to the GitHub repository.
file: 
**databasecreation.sql**

**Task 2 :**

Little Lemon’s data model must include a Bookings table so that they can store data for table bookings. I have  stored procedure that

▶︎checks available bookings based on user input and a MySQL transaction that can be used to inform whether booking available or not

▶︎add  booking to make a booking based on user input and a MySQL transaction that can be used to inform whether booking made or rejected

▶︎update booking to update a booking based on user input and a MySQL transaction that can be used to inform the updation

▶︎delete booking to delete a booking based on user input and a MySQL transaction that can be used to inform the deletion

All these works are using the **MySQL Workbench Tool**

I have commit the changes to **Git** and push and pull the changes to the **GitHub repository**.

 stored procedure files :

 **addbooking.sql**
 
 **addvalidbooking.sql**
 
 **checkavailability.sql**
 
 **deletebooking.sql**
 
 **updatebooking.sql**


 output files  :
 
  **addbooking.png**

  **bookavailability.png** 
 
  **deletebook.png**
 
  **updatebook.png**
 
  **rejectbook.png**
 
  **newbooking.png**



**Task 3 :**
 
Little Lemon has an Excel sheet file with thousands of records of data on orders made between 2019 and 2023. They want to analyze the sales data to examine how they can increase their profits by filter the data, analyze it, and create visual charts in the form of an interactive dashboard to help them understand their business performance.
 I have done the following:

 ✼ connect to Little Lemon data stored in the Excel Sheet.
 
 ✼ Then filter data in the data source page and select the "United States" as the country.
 
 ✼ Create a new data field that stores the profits for each sale by creating a calculated field profit by subtracting total cost from sales.

the following charts are prepared to visulaize the analysis.

 **✼ customer sales chart:** Create a bar chart that shows customers' sales and filter data based on sales with at least $70. If you roll over a bar, the customer names and sale figures will be displayed.
 
**✼ Profit Line chart:** Create a line chart to show the sales trend from 2019 to 2022.chart will show the trend of sales from 2019 to 2022  as different colors for different years.
  
**✼Sales  Bubble chart:** Create a Bubble chart of sales for all customers. The chart will show the names of all customers. Once  roll over a bubble, the chart will  show the name, profit, and sale.
 
**✼ Cuisine Sales and Profits Bar chart:** To compare the sales of the three different cuisines sold at Little Lemon.Create a Bar chart that shows the sales of the Turkish, Italian, and Greek cuisines. The chart is used to display sales data for 2020, 2021, and 2022 only. Each bar should display the profit of each cuisine. 

**✼ Sales Dash board:** Create an interactive dashboard that combines the Bar chart called Customer sales and the Sales Bubble Chart. Once you click a bar, and roll over the related bubble, the name, sales, and profit figures should be displayed in the Bubble chart.

All these works are using the **TABLEAU Tool**

I have commit the changes to **Git** and push and pull the changes to the **GitHub repository**.

output files:
**Barchart.png**

**linechartprofit.png**

**saleprofit.png**

**salesbubblechart.png**

**singlecustomer-dashboard.png**

**dashboard-sales.png**

**Task 4 :**

Little Lemon needs you to help them build a functional Booking System from which they can manage their customer data. An integral part of a well-functioning system is the ability to query data. Little Lemon needs you to help them add the search functionality required to query their data. A database Client Python is used for this work.

I have done the following works to do the above work.

  ⌘ Establish a connection between Python and your database using the following steps:

  ⌘ Have an up-to-date version of Python installed on the  machine and then install Jupyter.

  ⌘ Once Jupyter is installed,  open a notebook.

  ⌘ Ensure that mysql-connector is installed.

  ⌘ Import the connector under the alias connector.

  ⌘ Verify that a connection can be made with your database by calling the connection method from the connector class.

  ⌘ Cursor is used to do all the creation ,insertion,updation etc.

All these works are using the **jupyter notebook Tool and python**

I have commit the changes to **Git** and push and pull the changes to the **GitHub repository**.

file: **capstone.ipynb**
