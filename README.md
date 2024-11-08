# Capstone-Customer-Data
Data Analysis Journey with Ladies in Tech Africa - Project 2
# LITA-Capstone-Project: CUSTOMER DATA REPORT
This project is one of the data analysis project submitted as one of the requirements for successful completion of a ten week data analytic training programme organized by The Incubator Hub-Ladies in Tech Africa.(https://www.linkedin.com/company/theincubatorng/) 

## **PROJECT OVERVIEW**
---

This project requires an in-depth study of subscription pattern of the customers of a Tech Company. The company seeks to understand the most preferable subscription package among their customers. Thereby gaining an insight into their top performing products and region in terms of subscribers' retention, subscription packages and revenue generation.  It is expected that an interactive power BI dashboard will be produced for the store.

## **OBJECTIVES**
---

The objective of this project is to:
-  determine the regional revenue trend
-  determine the total revenue
-  Determine the Cancellation rate
-  identify the most subscribed package  
-  identify any other useful insight


## **Data Analysis Tools**
---
The data analysis tools used for the project are
1.  Microsoft Excel
    -  For Data Cleaning
    -  For Data Exploration and initial analysis
     
2.  SQL Server:
    -  SQL Queries for Exploratory Analysis.
3.  Microsoft Power Bi
    -  For Visualization and Report
  
## **EXPLORATORY DATA ANALYSIS**
 ![Customer Data Project 2](https://github.com/user-attachments/assets/618505cf-0129-42e6-b728-07645c2027e0)

SQL Server Query
---
```
Select * from[dbo].[LITA_Capstone_Customer_Data]

---1. Retrieve Total Number of Customer from each region for Customer Data----

Select [Region],Count (CustomerID) as Total_No_of_Customers from [dbo].[LITA_Capstone_Customer_Data]
Group by Region


--Q2 Most popular subscription type by the number of customers.

SELECT SubscriptionType,COUNT(CustomerID)AS No_Of_Customers
FROM [dbo].[LITA_Capstone_Customer_Data]
GROUP BY SubscriptionType

--Q3  Find customers who canceled their subscription within 6 months

SELECT CustomerName,Canceled,SubscriptionStart
FROM [dbo].[LITA_Capstone_Customer_Data]
WHERE Canceled =1 AND MONTH(SubscriptionStart) BETWEEN 1 AND 6


-- Q4 Calculate the average subscription duration for all customers
SELECT Count(CustomerID) As All_Customers,AVG(DATEDIFF(DAY,SubscriptionStart,SubscriptionEnd)) AS Average_Subscription_Duration
FROM [dbo].[LITA_Capstone_Customer_Data]
WHERE SubscriptionEnd IS NOT NULL

----Q5  Find customers with subscriptions longer than 12 months.DATEDIFF
SELECT CustomerName,SubscriptionType,SubscriptionStart,SubscriptionEnd
FROM [dbo].[LITA_Capstone_Customer_Data]
WHERE DATEDIFF(MONTH,SubscriptionStart,SubscriptionEnd) >=12

--- Q6  calculate total revenue by subscription type
 SELECT SubscriptionType,SUM(Revenue) AS Total_Revenue
 FROM[dbo].[LITA_Capstone_Customer_Data]
 GROUP BY SubscriptionType

```


  ![CUSTOMER DATA CAPSTONE](https://github.com/user-attachments/assets/cc739109-ec58-4b36-9964-5f3419499e14)

  ## INSIGHTS
  Most subscribers prefer the basic subcription pattern, there may be a need for the company to carry out a survey among its customer to identify the reason for their choices.
  The Management of the company is advised to award incentives to staffers in the East Region as there was no subscription cancellation from this region. The  Company may also need to understudy the Region to     gain insights on the retention of subscribers vis-a-vis implementing any notable positive trend in the other regions.
  Moreover, considering the rate of cancellation at 44.91% , there is an urgent need for the company to implement customer friendly packages to improve Customer retention.

