------------------Capstone Customer Data--------------------------------------
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



Alter table [dbo].[LITA_Capstone_Customer_Data] 
add Non_Active_Subscriber int

Alter table [dbo].[LITA_Capstone_Customer_Data] 
add Active_Subscriber int

Update [dbo].[LITA_Capstone_Customer_Data] 
set Non_Active_Subscriber = case when Canceled =1 
then 1 else 0 
end

Update [dbo].[LITA_Capstone_Customer_Data] 
set Active_Subscriber = case when Canceled =0 
then 1 else 0 
end
 
 ---Q7 Find the top 3 regions by subscription cancellations.---

 SELECT  Top 3  Region, Count(Non_Active_Subscriber) as Canceled_Sub 
FROM[dbo].[LITA_Capstone_Customer_Data]
where Non_Active_Subscriber = 1
Group by Region

------OR---------

SELECT top 3 Region, Count(Canceled) as Canceled_Sub 
FROM[dbo].[LITA_Capstone_Customer_Data]
where Canceled =1
Group by Region

 ------ Q8 No of Active and Canceled Subscribers---

Select Canceled, sum(Active_Subscriber) as No_of_Active_Subscribers,sum(Non_Active_SubScriber) as No_of_Non_Actives
FROM [dbo].[LITA_Capstone_Customer_Data]
Group by Canceled

SELECT*
FROM [dbo].[LITA_Capstone_Customer_Data]
