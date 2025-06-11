-- 🔧 Use the desired database
USE Banking_Project;
GO

-- 📋 View the entire Churn_Modelling$ table
SELECT * 
FROM Churn_Modelling$;

-- 📊 Count the number of employees by Gender
SELECT Gender, COUNT(Geography) AS Number_Of_Employee 
FROM Churn_Modelling$
GROUP BY Gender;

-- 📋 Re-check full data (likely to view after Group By)
SELECT * 
FROM Churn_Modelling$;

-- 📈 Calculate the average Balance of customers
SELECT AVG(Balance) AS Avg_Balance 
FROM Churn_Modelling$;

-- ❌ Remove the unnecessary RowNumber column
ALTER TABLE Churn_Modelling$
DROP COLUMN RowNumber;

-- 📋 View table after dropping column
SELECT * 
FROM Churn_Modelling$;

-- 👀 Temporarily add Status column using CASE for display only (not permanent)
SELECT *,
    CASE 
        WHEN Exited = 1 THEN 'Yes' 
        ELSE 'No' 
    END AS Status
FROM Churn_Modelling$;

-- 🏗️ Add a new column 'Status' to store customer exit status
ALTER TABLE Churn_Modelling$
ADD Status VARCHAR(10);

-- 🛠️ Update Status column based on Exited values
UPDATE Churn_Modelling$
SET Status = CASE 
                WHEN Exited = 1 THEN 'Yes' 
                ELSE 'No' 
            END;

-- ❌ Drop the original 'Exited' column as it's now replaced by 'Status'
ALTER TABLE Churn_Modelling$
DROP COLUMN Exited;

-- 🔢 Remove decimals from Balance values
UPDATE Churn_Modelling$
SET Balance = FLOOR(Balance);

-- 🔍 Check unique credit scores
SELECT DISTINCT CreditScore 
FROM Churn_Modelling$;

-- ➕ Add a new column to categorize credit scores
ALTER TABLE Churn_Modelling$
ADD ScoreLevel NVARCHAR(20);

-- 🛠️ Populate ScoreLevel based on CreditScore
UPDATE Churn_Modelling$
SET ScoreLevel = 
    CASE
        WHEN CreditScore >= 700 THEN 'High'
        WHEN CreditScore >= 650 THEN 'Above Average'
        ELSE 'Below Average'
    END;

-- 🔢 Remove decimals from EstimatedSalary
UPDATE Churn_Modelling$
SET EstimatedSalary = FLOOR(EstimatedSalary);

-- 📋 Final view of the modified table
SELECT * 
FROM Churn_Modelling$;
