# SQL_Fraud-Detection-Of-Credit-Card-By-Gargi-Dharak
# Credit Card Fraud Detection using SQL

## Project Objective
This project analyzes credit card transactions to identify fraudulent activity using SQL. The goal is to extract insights from a large dataset and highlight patterns that can help detect fraud.

## Dataset
- Source: Kaggle Credit Card Fraud Detection dataset
- Number of transactions: 284,807
- Columns: Time, V1–V28 (PCA components), Amount, Class
- Target variable (`Class`): 
  - 0 = Non-fraud
  - 1 = Fraud

## Steps & Queries
1. Count total transactions
2. Count fraud vs non-fraud transactions
3. Analyze transaction amount (min, max, average)
4. Fraud-specific analysis (total fraud, average fraud vs non-fraud)
5. Patterns & insights:
   - High-value transaction analysis
   - Fraud distribution by hour
6. Additional analysis (fraud percentage by amount range)

## Key Insights
- Fraud is rare (~0.17%) but costly
- Fraudulent transactions have slightly higher average amounts
- Some high-value transactions are fraudulent
- Fraud occurrence varies by time of day
- SQL techniques used: COUNT, SUM, AVG, CASE, GROUP BY, ORDER BY

## Files
- `CreditCard_Fraud.sql` – Complete SQL script with all queries and comments
- Screenshots / PDF summary of outputs (optional)

## Skills Demonstrated
- SQL querying and data aggregation
- Conditional logic using CASE statements
- Data exploration and reporting
- Pattern identification in transactional data
