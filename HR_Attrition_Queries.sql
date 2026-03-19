-- ============================================================
-- HR ATTRITION ANALYSIS - SQL QUERIES
-- Project 2 | Business Analyst Portfolio | ZaidAhmad
-- Dataset: IBM HR Analytics (1,470 employees)
-- Tool: SQLite / DB Browser for SQLite
-- ============================================================

-- TABLE: employees
-- Columns: EmployeeID, Age, Gender, MaritalStatus, Department,
--          JobRole, Education, EducationField, MonthlyIncome,
--          YearsAtCompany, OverTime, WorkLifeBalance,
--          JobSatisfaction, EnvironmentSatisfaction,
--          PerformanceRating, DistanceFromHome, BusinessTravel,
--          NumCompaniesWorked, YearsSinceLastPromotion, Attrition

-- ============================================================
-- QUERY 1: Overall Attrition Rate
-- Business Question: What percentage of employees have left?
-- ============================================================
SELECT
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS TotalAttrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees;

-- ============================================================
-- QUERY 2: Attrition by Department
-- Business Question: Which department is losing the most people?
-- ============================================================
SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees
GROUP BY Department
ORDER BY AttritionRate_Pct DESC;

-- ============================================================
-- QUERY 3: Attrition by Age Group
-- Business Question: Which age group is most at risk of leaving?
-- ============================================================
SELECT
    CASE
        WHEN Age < 25              THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees
GROUP BY AgeGroup
ORDER BY AttritionRate_Pct DESC;

-- ============================================================
-- QUERY 4: Attrition by Overtime
-- Business Question: Does working overtime increase attrition?
-- ============================================================
SELECT
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees
GROUP BY OverTime
ORDER BY AttritionRate_Pct DESC;

-- ============================================================
-- QUERY 5: Attrition by Work-Life Balance
-- Business Question: Does poor work-life balance drive attrition?
-- ============================================================
SELECT
    WorkLifeBalance,
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        ELSE 'Best'
    END AS WLB_Label,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- ============================================================
-- QUERY 6: Attrition by Monthly Income Band
-- Business Question: Are lower-paid employees more likely to leave?
-- ============================================================
SELECT
    CASE
        WHEN MonthlyIncome < 3000  THEN '1. Low (Under $3K)'
        WHEN MonthlyIncome < 6000  THEN '2. Medium ($3K-$6K)'
        WHEN MonthlyIncome < 10000 THEN '3. High ($6K-$10K)'
        ELSE '4. Very High ($10K+)'
    END AS IncomeBand,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees
GROUP BY IncomeBand
ORDER BY IncomeBand;

-- ============================================================
-- QUERY 7: Attrition by Job Role
-- Business Question: Which job roles are highest attrition risk?
-- ============================================================
SELECT
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees
GROUP BY JobRole
ORDER BY AttritionRate_Pct DESC;

-- ============================================================
-- QUERY 8: Attrition by Business Travel
-- Business Question: Does frequent travel increase attrition?
-- ============================================================
SELECT
    BusinessTravel,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 1
    ) AS AttritionRate_Pct
FROM employees
GROUP BY BusinessTravel
ORDER BY AttritionRate_Pct DESC;

-- ============================================================
-- END OF SCRIPT
-- ============================================================
