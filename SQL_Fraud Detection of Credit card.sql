LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/creditcard.csv'
INTO TABLE creditcard
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Time, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10,
 V11, V12, V13, V14, V15, V16, V17, V18, V19, V20,
 V21, V22, V23, V24, V25, V26, V27, V28, Amount, Class);
 

 #Step 1 = Check Total Transactions
 SELECT COUNT(*) AS total_transactions FROM creditcard; # Result : 284807
 
 
 #STEP 2 = Fraud vs Non-Fraud counts
 SELECT Class, COUNT(*) AS count
FROM creditcard
GROUP BY Class; # Result : Class 0 = 284315 And Class 1 = 492


#Step 3: Transaction Amount Summary
SELECT 
    MIN(Amount) AS min_amount, # Result : 0
    MAX(Amount) AS max_amount, # Result : 25691.16
    AVG(Amount) AS avg_amount  # Result : 88.34961925087359
FROM creditcard;


#Step 4: Fraud-Specific Analysis
SELECT COUNT(*) AS fraud_count
FROM creditcard
WHERE Class = 1; # Result : 492
#This tells us how many transactions are fraud

SELECT SUM(Amount) AS total_fraud_amount
FROM creditcard
WHERE Class = 1; # Result : 60127.96999999997
#Shows the total money lost due to fraud

SELECT Class, AVG(Amount) AS avg_amount
FROM creditcard
GROUP BY Class; # Result : Class 0 = 88.29 and Class 1 = 122.21
#Compares average transaction amounts for fraud vs non-fraud.Helps see if fraud tends to happen in bigger transactions.
#Insights from Step 4 = 492 transactions out of 284,807 → confirms fraud is very rare (~0.17%).
#$60,128 total lost due to fraud.Shows that even a small number of fraudulent transactions can involve significant money.
#avg amt Class 0 = 88.29 and class 1 = 122.21.


#Step 5: Patterns & Insights
# Are high-value transactions more likely to be fraud?
SELECT Class, COUNT(*) AS count
FROM creditcard
WHERE Amount > 2000
GROUP BY Class;
# Answer :Class 0=675 and Class 1 = 1(For the given condition). Most large transactions are legitimate, but fraud occurs in high-value transactions too

# Does fraud happen more at certain times of day?
SELECT FLOOR(Time/3600) AS hour, COUNT(*) AS fraud_count
FROM creditcard
WHERE Class = 1
GROUP BY hour
ORDER BY hour;
# Answer : It's Clear that Fraud is more common during certain hours


# Step 6 = Advanced Queries 
SELECT 
    ROUND(100.0 * SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END)/COUNT(*), 4) AS fraud_percentage
FROM creditcard; # Fraud Percentage = 0.1727

SELECT * 
# Top N Largest Fraud Transactions
FROM creditcard
WHERE Class = 1
ORDER BY Amount DESC
LIMIT 10; # Finds the highest-value frauds.

# Fraud percentage by transaction amount range

SELECT 
    CASE 
        WHEN Amount < 50 THEN '0-50'
        WHEN Amount BETWEEN 50 AND 500 THEN '50-500'
        WHEN Amount BETWEEN 500 AND 2000 THEN '500-2000'
        ELSE '2000+' 
    END AS amount_range,
    ROUND(100.0 * SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END)/COUNT(*), 4) AS fraud_percentage
FROM creditcard
GROUP BY amount_range
ORDER BY amount_range;
#Shows whether fraud is more common in small, medium, or large transactions.























