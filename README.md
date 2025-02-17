📌 Project Overview
I recently completed an SQL assignment where I worked with hospital data to extract key insights using SQL queries. This project involved analyzing medical expenses, patient admissions, and hospital efficiency.

🔍 Key Insights Extracted
✅ Total Number of Patients across all hospitals
✅ Top 3 Departments with the highest patient count
✅ Hospital with Maximum Medical Expenses
✅ Daily Average Medical Expenses per hospital
✅ Longest Patient Stay in a hospital
✅ Total Patients Treated Per City
✅ Department with the Lowest Number of Patients
✅ Monthly Medical Expenses Report


-- Find the hospital with the highest medical expenses
SELECT TOP 1 Hospital_Name, Medical_Expenses 
FROM [Hospital data] 
ORDER BY Medical_Expenses DESC;

-- Calculate average medical expenses per day for each hospital
SELECT Hospital_Name,  
ROUND(AVG(Medical_Expenses / DATEDIFF(DAY, Admission_Date, Discharge_Date)), 2) AS "Avg Expenses Per Day"
FROM [Hospital data] 
GROUP BY Hospital_Name;
(More queries are available in the PDF!)

🛠️ Technologies Used
SQL Server
Data Aggregation & Analysis
Query Optimization
📢 Let’s Connect!
If you're passionate about SQL & Data Analytics, feel free to connect and discuss more! 😊

🔗 GitHub Repository:
📩 LinkedIn

#SQL #DataAnalytics #Database #SQLQueries #DataScience
