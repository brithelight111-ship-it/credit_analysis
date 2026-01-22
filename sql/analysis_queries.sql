-- =========================
-- Loan Credit Risk Analysis
-- =========================

-- 1. Data Validation
SELECT
  COUNT(*) AS total_rows
FROM `loan-risk-analysis.loan_analysis.loan_applications`;


-- 2. Approval Rate by Credit Band
SELECT
  `Credit Band`, 
  COUNT(*) AS total_applicants,
  SUM(`Approval Flag`) AS approved,
  ROUND(SUM(`Approval Flag`) / COUNT(*), 2) AS approval_rate
FROM `loan-risk-analysis.loan_analysis.loan_applications`
GROUP BY `Credit Band`
ORDER BY approval_rate DESC;

-- 3. Approval Rate by Employment Band
SELECT
  `Employment Band`,
  COUNT(*) AS total_applicants,
  SUM(`Approval Flag`) AS approved,
  ROUND(SUM(`Approval Flag`) / COUNT(*), 2) AS approval_rate
FROM `loan-risk-analysis.loan_analysis.loan_applications`
GROUP BY `Employment Band`
ORDER BY approval_rate DESC;



-- 4. Average Loan Amount by Approval Status
SELECT
  `Loan Approved`,
  ROUND(AVG(`Loan Amount`), 2) AS avg_loan_amount
FROM `loan-risk-analysis.loan_analysis.loan_applications`
GROUP BY `Loan Approved`;


-- 5. Denials by City
SELECT
  city,
  COUNT(*) AS denial_count
FROM `loan-risk-analysis.loan_analysis.loan_applications`
WHERE `Loan Approved`
GROUP BY city
ORDER BY denial_count DESC;


-- 6. Risk Level vs Approval Outcome
SELECT
 `Risk Indicator `,
 `Loan Approved`,
  COUNT(*) AS total
FROM `loan-risk-analysis.loan_analysis.loan_applications`
GROUP BY `Risk Indicator `, `Loan Approved`
ORDER BY `Risk Indicator `;
