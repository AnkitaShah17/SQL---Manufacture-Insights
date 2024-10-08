create database manufacture;
SELECT 
    *
FROM
    prod_data;
desc prod_data;
truncate table prod_data;

-- Total Manufaturing Qty --

SELECT 
    SUM(IFNULL(`Manufactured Qty`, 0)) AS 'Total Manufacture Qty'
FROM
    prod_data;

SELECT 
    `Manufactured Qty`
FROM
    prod_data
WHERE
    NOT `Manufactured Qty` REGEXP '^[0-9]+$';

SELECT 
    SUM(CAST(`Manufactured Qty` AS UNSIGNED)) AS `Total Manufacture Qty`
FROM
    prod_data;

-- Total Rejected Qty --

SELECT 
    SUM(IFNULL(`Rejected Qty`, 0)) AS 'Total Rejected Qty'
FROM
    prod_data;

SELECT 
    `Rejected Qty`
FROM
    prod_data;

SELECT 
    `Rejected Qty`
FROM
    prod_data
WHERE
    NOT `Rejected Qty` REGEXP '^[0-9]+$';

SELECT 
    SUM(CAST(`Rejected Qty` AS UNSIGNED)) AS `Total Rejected Qty`
FROM
    prod_data;

-- Buyer with Highest Manufatured Quantity --

SELECT 
    Buyer, `Manufactured Qty`
FROM
    prod_data
WHERE
    `Manufactured Qty` IS NOT NULL
ORDER BY Buyer;

SELECT 
    Buyer,
    MAX(CAST(`Manufactured Qty` AS UNSIGNED)) AS 'Highest Manufacture Qty'
FROM
    prod_data
WHERE
    `Manufactured Qty` IS NOT NULL
GROUP BY Buyer
ORDER BY 'Highest Manufacture Qty' DESC;
 
SELECT 
    *
FROM
    prod_data;

-- Customer with Highest Manufatured Quantity --


SELECT 
    `Cust Name`,
    MAX(CAST(`Manufactured Qty` AS UNSIGNED)) AS 'Highest Manufacture Qty'
FROM
    prod_data
WHERE
    `Manufactured Qty` IS NOT NULL
GROUP BY `Cust Name`
ORDER BY 'Highest Manufacture Qty' DESC;

-- Department with Highest Manufatured Quantity --

SELECT 
    `Department Name`,
    MAX(CAST(`Manufactured Qty` AS UNSIGNED)) AS 'Highest Manufacture Qty'
FROM
    prod_data
WHERE
    `Manufactured Qty` IS NOT NULL
GROUP BY `Department Name`
ORDER BY 'Highest Manufacture Qty' DESC;

-- Customer with Highest Rejected Qty --

SELECT 
    `Cust Name`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Cust Name`
ORDER BY 'Highest Rejected Qty' DESC;

-- Department with Highest Rejected Qty --

SELECT 
    `Department Name`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Department Name`
ORDER BY 'Highest Rejected Qty' DESC;

-- Buyer with Highest Rejected Qty --

SELECT 
    Buyer,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY Buyer
ORDER BY 'Highest Rejected Qty' DESC;

-- Emp Name with Highest Rejected Qty --

SELECT 
    `Emp Name`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Emp Name`
ORDER BY 'Highest Rejected Qty' DESC;

-- Emp Name with Highest Manufatured Quantity --

SELECT 
    `Emp Name`,
    MAX(CAST(`Manufactured Qty` AS UNSIGNED)) AS 'Highest Manufacture Qty'
FROM
    prod_data
WHERE
    `Manufactured Qty` IS NOT NULL
GROUP BY `Emp Name`
ORDER BY 'Highest Manufacture Qty' DESC;

-- Effect of delivery time on Rejection -- 

SELECT 
    `Delivery Period`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Delivery Period`
ORDER BY 'Highest Rejected Qty' DESC;

-- Form Type wise Rejection -- 

SELECT 
    `Form Type`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Form Type`
ORDER BY 'Highest Rejected Qty' DESC;

-- Machine Code wise Rejection -- 

SELECT 
    `Machine Code`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Machine Code`
ORDER BY 'Highest Rejected Qty' DESC;

-- Operation Name wise Rejection -- 

SELECT 
    `Operation Name`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Operation Name`
ORDER BY 'Highest Rejected Qty' DESC;

-- User Name wise Rejection -- 

SELECT 
    `User Name`,
    MAX(CAST(`Rejected Qty` AS UNSIGNED)) AS 'Highest Rejected Qty'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `User Name`
ORDER BY 'Highest Rejected Qty' DESC;

-- Total Value by each form type --

SELECT 
    `Form Type`,
    MAX(CAST(TotalValue AS UNSIGNED)) AS 'Highest Total Value'
FROM
    prod_data
WHERE
    TotalValue IS NOT NULL
GROUP BY `Form Type`
ORDER BY 'Highest Total Value' DESC;

-- Machine Code wise Total Value -- 

SELECT 
    `Machine Code`,
    MAX(CAST(TotalValue AS UNSIGNED)) AS 'Highest Total Value'
FROM
    prod_data
WHERE
    TotalValue IS NOT NULL
GROUP BY `Machine Code`
ORDER BY 'Highest Total Value' DESC;

-- Operation Name wise Total Value -- 

SELECT 
    `Operation Name`,
    MAX(CAST(TotalValue AS UNSIGNED)) AS 'Highest Total Value'
FROM
    prod_data
WHERE
    `Rejected Qty` IS NOT NULL
GROUP BY `Operation Name`
ORDER BY 'Highest Total Value' DESC;

-- User Name wise TotalValue -- 

SELECT 
    `User Name`,
    MAX(CAST(TotalValue AS UNSIGNED)) AS 'Highest Total Value'
FROM
    prod_data
WHERE
    TotalValue IS NOT NULL
GROUP BY `User Name`
ORDER BY 'Highest Total Value' DESC;

SELECT 
    *
FROM
    prod_data;

describe prod_data;

-- Processing Time As per machine code --

SHOW COLUMNS FROM prod_data;
    
SELECT 
    `Machine Code`,
    `Start Time`,
    `End Time`,
    TIMESTAMPDIFF(HOUR,
        STR_TO_DATE(`Start Time`, '%d-%m-%Y %H:%i'),
        STR_TO_DATE(`End Time`, '%d-%m-%Y %H:%i')) AS `Processing Time`
FROM
    prod_data
HAVING `Processing Time` IS NOT NULL
LIMIT 0 , 1000;

