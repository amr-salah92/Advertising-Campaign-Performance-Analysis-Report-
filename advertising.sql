USE advertising ;

SELECT *
FROM advertising_kpi_database
LIMIT 5;


#| Column Header     | Business-Focused Description |
#|------------------|-------------------------------|
#| **Date**          | The exact timestamp of when the campaign performance data was captured, useful for tracking time-based trends or campaign effectiveness over specific periods. |
#| **Campaign ID**   | A unique code assigned to each campaign for identification, enabling campaign-level performance comparison and historical tracking. |
#| **Channel**       | The marketing platform or source used to deliver the ad (e.g., Social Media, Affiliate), essential for evaluating channel-level ROI and audience targeting. |
#| **Advertiser**    | The format or type of ad placement (e.g., Video, Banner, Text), critical for analyzing which ad formats drive better engagement and conversion. |
#| **CPM** (Cost per Mille) | The cost of 1,000 ad impressions, helping assess the efficiency of media spend in terms of visibility. |
#| **CTR** (Click-Through Rate) | The ratio of clicks to impressions, reflecting how compelling the ad content and placement are to the audience. |
#| **CPC** (Cost Per Click) | The average cost paid for each user click on the ad, used to evaluate cost-efficiency of driving traffic. |
#| **CPA** (Cost Per Acquisition) | The average cost required to acquire a conversion (e.g., purchase, signup), a key metric in understanding customer acquisition efficiency. |
#| **Conversion Rate** | The percentage of users who took a desired action after engaging with the ad, serving as a core measure of campaign effectiveness. |
#| **ROAS** (Return on Ad Spend) | A profitability ratio showing how much revenue is earned for each dollar spent on ads — a critical indicator of campaign success. |
#| **Impression**     | The total number of times the ad was shown to users, used to gauge reach and brand exposure. |
#| **Project Type**   | The industry or sector the campaign targets (e.g., Retail, Telecom), important for industry-specific performance benchmarking. |
#| **Clicks**         | The total number of user interactions (clicks) on the ad, reflecting engagement and interest. |
#| **Lead Generation** | The number of qualified leads captured through the campaign, supporting sales pipeline growth analysis. |
#| **Comments**       | Analyst-generated insights and recommendations for improving or explaining campaign performance. |
#| **Revenue Uplift** | The incremental revenue directly attributed to the campaign's influence, compared to the baseline — vital for measuring campaign impact. |

SELECT DISTINCT Channel 
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE Channel IS NULL;

SELECT DISTINCT `Advertisement Type`
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE `Advertisement Type` IS NULL;

SELECT DISTINCT `Project Type`
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE `Project Type` IS NULL;

SELECT DISTINCT Comments
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE Comments IS NULL;


SELECT DISTINCT CPM
FROM advertising_kpi_database ;

# CPM range 1 - 15 

SELECT *
FROM advertising_kpi_database
WHERE CPM IS NULL;


SELECT DISTINCT CTR
FROM advertising_kpi_database ;

# CTR range 0.005 - 0.05

SELECT *
FROM advertising_kpi_database
WHERE CTR IS NULL;

SELECT DISTINCT CPC
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE CPC IS NULL;

# CPC Range 0.1 - 2 

SELECT DISTINCT CPA
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE CPA IS NULL;

# CPA Range 5 - 50 

SELECT DISTINCT `Conversion Rate`
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE `Conversion Rate` IS NULL;


SELECT DISTINCT `Revenue Uplift`
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE `Revenue Uplift` IS NULL;

SELECT DISTINCT Impressions
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE Impressions IS NULL;


SELECT DISTINCT Clicks
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE Clicks IS NULL;


SELECT DISTINCT `Lead Generation`
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE `Lead Generation` IS NULL;


SELECT DISTINCT ROAS
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE ROAS IS NULL;


SELECT DISTINCT date_part
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE date_part IS NULL;


SELECT DISTINCT time_part
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE time_part IS NULL;

SELECT
  CAST(Date AS DATE) AS date_part,
  CAST(Date AS TIME) AS time_part
FROM advertising_kpi_database;


SELECT DISTINCT `Campaign ID`
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
WHERE `Campaign ID` IS NULL;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE advertising_kpi_database
DROP COLUMN Date , DROP COLUMN ROAS;

ALTER TABLE advertising_kpi_database
ADD COLUMN date_part DATE,
ADD COLUMN time_part TIME,
ADD COLUMN Revenue DECIMAL(18, 2),
ADD COLUMN ROAS DECIMAL(18, 2),
ADD COLUMN `Ad Spend` DECIMAL(18, 2);



UPDATE advertising_kpi_database
SET 
  date_part = CAST(`Date` AS DATE),
  time_part = CAST(`Date` AS TIME),
  Revenue = ROAS * (Clicks * CPA),
  `Ad Spend`= Clicks * CPC ,
  ROAS = Revenue / `Ad Spend`;


 
# sucessful ads with lowerst CPM , CTR , CPC , CPA  
# Highest Conversion Rate , ROAS , Revenue ,Impressions

SELECT AVG(ROAS) 
FROM advertising_kpi_database ;

SELECT MIN(`Ad Spend`) , MAX(`Ad Spend`)
FROM advertising_kpi_database ;

SELECT SUM(`Ad Spend`) 
FROM advertising_kpi_database ;

SELECT MIN(CPM) , MAX(CPM)
FROM advertising_kpi_database ;

SELECT SUM(Revenue) 
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY CPM ASC
LIMIT 5;

SELECT MIN(CTR) , MAX(CTR)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY CTR ASC
LIMIT 5;

SELECT MIN(CPC) , MAX(CPC)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY CPC ASC
LIMIT 5;

SELECT MIN(CPA) , MAX(CPA)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY CPA ASC
LIMIT 5;

SELECT MIN(`Conversion Rate`) , MAX(`Conversion Rate`)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY `Conversion Rate` ASC
LIMIT 5;


SELECT MIN(`Revenue Uplift`) , MAX(`Revenue Uplift`)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY `Revenue Uplift` ASC
LIMIT 5;

SELECT MIN(Impressions) , MAX(Impressions)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY Impressions ASC
LIMIT 5;


SELECT MIN(Clicks) , MAX(Clicks)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY Clicks ASC
LIMIT 5;

SELECT MIN(`Lead Generation`) , MAX(`Lead Generation`)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY `Lead Generation` ASC
LIMIT 5;

SELECT MIN(ROAS) , MAX(ROAS)
FROM advertising_kpi_database ;

SELECT *
FROM advertising_kpi_database
ORDER BY ROAS ASC
LIMIT 5;

# CPM Range 1 - 15 
# CPC Range 0.1 - 2 
# CTR range 0.005 - 0.05
# CPA Range 5 - 50 
# Conversion Rate range 0.005 - 0.03
# Revenue Uplift range -5  - 20
# Impressions range 1000 - 99997
# Clicks range 6 - 4969 
# Lead Generation range 1 - 2912
# ROAS range -20.69   -  1014.37

SELECT `Campaign ID`, Channel, `Project Type`, ROAS, `Conversion Rate`, `Revenue Uplift`
FROM advertising_kpi_database
WHERE ROAS > 500 AND `Conversion Rate` > 0.02
ORDER BY `Revenue Uplift` DESC
LIMIT 10;


SELECT `Campaign ID`, Channel, `Project Type`, ROAS, `Conversion Rate`, `Revenue Uplift` , Revenue
FROM advertising_kpi_database
ORDER BY Revenue DESC
LIMIT 10;

#Campaign ID
# 22778

SELECT `Campaign ID`, CPA, ROAS, `Revenue Uplift`
FROM advertising_kpi_database
WHERE CPA > 30 AND ROAS > 500
ORDER BY CPA DESC;

SELECT Comments, COUNT(*) AS Frequency
FROM advertising_kpi_database
WHERE Comments IS NOT NULL
GROUP BY Comments
ORDER BY Frequency DESC;


SELECT * 
FROM advertising_kpi_database
WHERE  CPM BETWEEN 1 AND 2.5 
AND  CPC BETWEEN 0.1 AND 0.2
AND CTR BETWEEN 0.005 AND 0.015
AND  CPA BETWEEN 5 AND 8 
AND `Conversion Rate` BETWEEN 0.025 AND 0.03
AND `Revenue Uplift` BETWEEN 14  AND 20;


SELECT * 
FROM advertising_kpi_database
WHERE Impressions BETWEEN 51658 AND 99997
AND Clicks BETWEEN 600 AND 4969 
AND `Lead Generation` BETWEEN 327 AND 2912
AND ROAS BETWEEN 500   AND  1014 ;



SELECT * 
FROM advertising_kpi_database
Order by  Impressions DESC , Clicks DESC , `Lead Generation` DESC , `Conversion Rate` DESC
LIMIT 5;



SELECT * 
FROM advertising_kpi_database
Order by `Revenue Uplift` DESC , `ROAS` DESC
LIMIT 5;


SELECT Channel , ROUND(AVG(`Conversion Rate`),5) AS CONVERSION_RATE , ROUND(AVG(`Revenue Uplift`),3) AS REVENUE_UPLIFT , SUM(Impressions) AS TOTAL_IMPRESSIONS, SUM(Clicks) AS TOTAL_CLICKS , SUM(`Lead Generation`) AS TOTAL_LEAD_GENERATIONS , ROUND(AVG(ROAS),3) AS ROAS
FROM advertising_kpi_database
group by Channel;


SELECT Channel , ROUND(AVG(CPM),3) AS CPM , ROUND(AVG(CTR),5) AS CTR , ROUND(AVG(CPC),5) AS CPC  , ROUND(AVG(CPA),5) AS CPA 
FROM advertising_kpi_database
group by Channel;


SELECT Channel  , SUM(Revenue) AS TOTAL_Revenue, SUM(`Ad Spend`) AS TOTAL_Ad_Spend 
FROM advertising_kpi_database
group by Channel;

# Affilate has Best CPM  , ROAS
# Social Media has best CPC & CPA
# Social media has highest avg conversion rate , revenue uplift , CTR , second best total impressions , total clicks & total lead generations after search engine .
# Search engine has highest revenue but highest ad_spend

SELECT `Advertisement Type` , ROUND(AVG(`Conversion Rate`),5) AS CONVERSION_RATE , ROUND(AVG(`Revenue Uplift`),3) AS REVENUE_UPLIFT , SUM(Impressions) AS TOTAL_IMPRESSIONS, SUM(Clicks) AS TOTAL_CLICKS , SUM(`Lead Generation`) AS TOTAL_LEAD_GENERATIONS , ROUND(AVG(ROAS),3) AS ROAS
FROM advertising_kpi_database
group by `Advertisement Type`;

SELECT `Advertisement Type` , ROUND(AVG(CPM),3) AS CPM , ROUND(AVG(CTR),5) AS CTR , ROUND(AVG(CPC),5) AS CPC  , ROUND(AVG(CPA),5) AS CPA 
FROM advertising_kpi_database
group by `Advertisement Type`;

SELECT `Advertisement Type` , sum(Revenue) AS total_Revenue
FROM advertising_kpi_database
group by `Advertisement Type`
order by total_Revenue DESC;

SELECT `Advertisement Type`  , SUM(Revenue) AS TOTAL_Revenue, SUM(`Ad Spend`) AS TOTAL_Ad_Spend 
FROM advertising_kpi_database
group by `Advertisement Type`;

# text has highest avg conversion rate  , CPA
# banner has highest  ROAS and best CPC
# video has highest total impressions , revenue , total clicks , total lead generations and best CPM & generate highest revenue but highest ad _spend 

SELECT `Project Type` , ROUND(AVG(`Conversion Rate`),5) AS CONVERSION_RATE , ROUND(AVG(`Revenue Uplift`),3) AS REVENUE_UPLIFT , SUM(Impressions) AS TOTAL_IMPRESSIONS, SUM(Clicks) AS TOTAL_CLICKS , SUM(`Lead Generation`) AS TOTAL_LEAD_GENERATIONS , ROUND(AVG(ROAS),3) AS ROAS
FROM advertising_kpi_database
group by `Project Type`;

SELECT `Project Type` , ROUND(AVG(CPM),3) AS CPM , ROUND(AVG(CTR),5) AS CTR , ROUND(AVG(CPC),5) AS CPC  , ROUND(AVG(CPA),5) AS CPA 
FROM advertising_kpi_database
group by `Project Type`;


SELECT `Project Type` , sum(Revenue) AS total_Revenue
FROM advertising_kpi_database
group by `Project Type`
order by total_Revenue DESC;

SELECT `Project Type`  , SUM(Revenue) AS TOTAL_Revenue, SUM(`Ad Spend`) AS TOTAL_Ad_Spend 
FROM advertising_kpi_database
group by `Project Type`;

#Telecom project has highest Conversion rate , revenue uplift , total impressions , total clicks , lead generations ,ROAS & generate the best revenue but  highest ad_spend
#Telecom has best CPM ,CPA 
#Retail has best CTR , CPC 

SELECT YEAR(date_part) , ROUND(AVG(`Conversion Rate`),5) AS CONVERSION_RATE , ROUND(AVG(`Revenue Uplift`),3) AS REVENUE_UPLIFT , SUM(Impressions) AS TOTAL_IMPRESSIONS, SUM(Clicks) AS TOTAL_CLICKS , SUM(`Lead Generation`) AS TOTAL_LEAD_GENERATIONS , ROUND(AVG(ROAS),3) AS ROAS
FROM advertising_kpi_database
group by YEAR(date_part);

SELECT YEAR(date_part) , ROUND(AVG(CPM),3) AS CPM , ROUND(AVG(CTR),5) AS CTR , ROUND(AVG(CPC),5) AS CPC  , ROUND(AVG(CPA),5) AS CPA 
FROM advertising_kpi_database
group by YEAR(date_part);

SELECT YEAR(date_part) , sum(Revenue) AS total_Revenue
FROM advertising_kpi_database
group by YEAR(date_part)
order by total_Revenue DESC;

# 2023 has best conversion rate & revenue uplift
# 2024 has best total impressions , total clicks ,total lead generation & ROAS & generate the best revenue 

SELECT 
    DATE_FORMAT(date_part, '%Y-%m') AS Month,
    ROUND(AVG(`Conversion Rate`), 5) AS CONVERSION_RATE,
    ROUND(AVG(`Revenue Uplift`), 3) AS REVENUE_UPLIFT,
    SUM(Impressions) AS TOTAL_IMPRESSIONS,
    SUM(Clicks) AS TOTAL_CLICKS,
    SUM(`Lead Generation`) AS TOTAL_LEAD_GENERATIONS,
    ROUND(AVG(ROAS), 3) AS ROAS
FROM advertising_kpi_database
GROUP BY DATE_FORMAT(date_part, '%Y-%m')
ORDER BY Month;


SELECT DATE_FORMAT(date_part, '%Y-%m') AS Month , ROUND(AVG(CPM),3) AS CPM , ROUND(AVG(CTR),5) AS CTR , ROUND(AVG(CPC),5) AS CPC  , ROUND(AVG(CPA),5) AS CPA 
FROM advertising_kpi_database
group by DATE_FORMAT(date_part, '%Y-%m') ;


SELECT DATE_FORMAT(date_part, '%Y-%m') AS Month , sum(Revenue) AS total_Revenue
FROM advertising_kpi_database
group by DATE_FORMAT(date_part, '%Y-%m') 
order by total_Revenue DESC;


# 2023 - 01  has highest Conversion rate 
# 2023 - 03  has highest total impressions  
# 2023 - 04 has Best CTR
# 2023 - 05 has Best CPC , highest ROAS 
# 2024 - 02 has Best CPM
# 2024 - 03  has highest total clicks  & total lead generations & fourth best total impressions & generate highest revenue 
# 2024 - 05 has Best CPA
# 2024 - 10  has highest revenue uplift 

SELECT 
    HOUR(time_part) AS Hour,
    ROUND(AVG(`Conversion Rate`), 5) AS CONVERSION_RATE,
    ROUND(AVG(`Revenue Uplift`), 3) AS REVENUE_UPLIFT,
    SUM(Impressions) AS TOTAL_IMPRESSIONS,
    SUM(Clicks) AS TOTAL_CLICKS,
    SUM(`Lead Generation`) AS TOTAL_LEAD_GENERATIONS,
    ROUND(AVG(ROAS), 3) AS ROAS
FROM advertising_kpi_database
GROUP BY HOUR(time_part)
ORDER BY Hour;



SELECT HOUR(time_part) AS Hour , ROUND(AVG(CPM),3) AS CPM , ROUND(AVG(CTR),5) AS CTR , ROUND(AVG(CPC),5) AS CPC  , ROUND(AVG(CPA),5) AS CPA 
FROM advertising_kpi_database
group by HOUR(time_part) ;


SELECT HOUR(time_part) AS Hour , sum(Revenue) AS total_Revenue
FROM advertising_kpi_database
group by HOUR(time_part) 
order by total_Revenue DESC;

# 4 am has highest conversion rate 
# 10 am has highest impressions & clicks & lead generations & lowesst CPC & second highest revenue uplift & generate the highest revenue 
# 12 am has highest ROACS
# 2 pm has highest revenue uplift & lowesst CTR & secand conversion rate , total impressions & ROAS
# 3 pm has lowest CPM & second best revenue generation
# 6 pm has lowest ROAs

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(`date_part`, '%Y-%m-01') AS month,
        Channel,
        SUM(Revenue) AS monthly_revenue
    FROM advertising_kpi_database
    GROUP BY DATE_FORMAT(`date_part`, '%Y-%m-01'), Channel
),

with_lag AS (
    SELECT
        mr.*,
        LAG(mr.monthly_revenue) OVER (
            PARTITION BY mr.Channel
            ORDER BY mr.month
        ) AS prev_month_revenue
    FROM monthly_revenue mr
)

SELECT
    Channel,
    month,
    monthly_revenue,
    prev_month_revenue,
    ROUND(
        (monthly_revenue - prev_month_revenue) * 100 / NULLIF(prev_month_revenue, 0),
        2
    ) AS mom_revenue_percent
FROM with_lag
ORDER BY Channel, month;

# Affliate channel best MOM % Revenue Change 15.11 % in 2023-03-01 & worst -16.05 % in 2024-08-01 (- 0.3645 % changes between the first & last month)
# Search Engine channel best MOM % Revenue Change 20.14 % in 2023-10-01 & worst -19.91 % in 2023-09-01 (- 1.4797 % changes between the first & last month )
# Social Media channel best MOM % Revenue Change 8.10 % in 2024-07-01 & worst -17.01 % in 2023-02-01 (- 14.434 % changes between the first & last month )

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(`date_part`, '%Y-%m-01') AS month,
        `Advertisement Type`,
        SUM(Revenue) AS monthly_revenue
    FROM advertising_kpi_database
    GROUP BY DATE_FORMAT(`date_part`, '%Y-%m-01'), `Advertisement Type`
),

with_lag AS (
    SELECT
        mr.*,
        LAG(mr.monthly_revenue) OVER (
            PARTITION BY mr.`Advertisement Type`
            ORDER BY mr.month
        ) AS prev_month_revenue
    FROM monthly_revenue mr
)

SELECT
    `Advertisement Type`,
    month,
    monthly_revenue,
    prev_month_revenue,
    ROUND(
        (monthly_revenue - prev_month_revenue) * 100 / NULLIF(prev_month_revenue, 0),
        2
    ) AS mom_revenue_percent
FROM with_lag
ORDER BY `Advertisement Type`, month;

# Video best MOM % Revenue Change 21.93 % in 2023-03-01 & worst -21.32 % in 2023-02-01 (- 14.489 % changes between the first & last month)
# Text best MOM % Revenue Change 16.02 % in 2023-05-01 & worst -11.78 % in 2023-04-01 (- 2.0445 % changes between the first & last month)
# Banner best MOM % Revenue Change 14.88 % in 2024-07-01 & worst -11.15 % in 2024-08-01 ( 0.7365 % changes between the first & last month)

WITH monthly_clicks AS (
    SELECT
        DATE_FORMAT(`date_part`, '%Y-%m-01') AS month,
        `Project Type`,
        SUM(Revenue) AS monthly_Revenue
    FROM advertising_kpi_database
    GROUP BY DATE_FORMAT(`date_part`, '%Y-%m-01'), `Project Type`
),

with_lag AS (
    SELECT
        mc.*,
        LAG(mc.monthly_Revenue) OVER (
            PARTITION BY mc.`Project Type` 
            ORDER BY mc.month
        ) AS prev_month_Revenue
    FROM monthly_clicks mc
)

SELECT
    `Project Type`,
    month,
    monthly_Revenue,
    prev_month_Revenue,
    ROUND(
        (monthly_Revenue - prev_month_Revenue) * 100 / NULLIF(prev_month_Revenue, 0),
        2
    ) AS mom_Revenue_percent
FROM with_lag
ORDER BY `Project Type`, month;

# Retail best MOM % Revenue Change 18.27 % in 2023-03-01 & worst -18.10 % in 2023-09-01 (- 5.324 % changes between the first & last month)
# Telecom best MOM % Revenue Change 15.05 % in 2024-06-01 & worst -11.08 % in 2023-02-01 (- 5.829 % changes between the first & last month)


WITH yearly_revenue AS (
    SELECT
        DATE_FORMAT(`date_part`, '%Y-01-01') AS year,
        Channel,
        SUM(Revenue) AS yearly_revenue
    FROM advertising_kpi_database
    GROUP BY DATE_FORMAT(`date_part`, '%Y-01-01'), Channel
),

with_lag AS (
    SELECT
        yr.*,
        LAG(yr.yearly_revenue) OVER (
            PARTITION BY yr.Channel
            ORDER BY yr.year
        ) AS prev_year_revenue
    FROM yearly_revenue yr
)

SELECT
    Channel,
    year,
    yearly_revenue,
    prev_year_revenue,
    ROUND(
        (yearly_revenue - prev_year_revenue) * 100 / NULLIF(prev_year_revenue, 0),
        2
    ) AS yoy_revenue_percent
FROM with_lag
ORDER BY Channel, year;

# Affilate YOY% Growth 1.47
# Search engine YOY% Growth 1.60 
# Social media YOY% Growth -0.02


WITH yearly_revenue AS (
    SELECT
        DATE_FORMAT(`date_part`, '%Y-01-01') AS year,
        `Advertisement Type`,
        SUM(Revenue) AS yearly_revenue
    FROM advertising_kpi_database
    GROUP BY DATE_FORMAT(`date_part`, '%Y-01-01'), `Advertisement Type`
),

with_lag AS (
    SELECT
        yr.*,
        LAG(yr.yearly_revenue) OVER (
            PARTITION BY yr.`Advertisement Type`
            ORDER BY yr.year
        ) AS prev_year_revenue
    FROM yearly_revenue yr
)

SELECT
    `Advertisement Type`,
    year,
    yearly_revenue,
    prev_year_revenue,
    ROUND(
        (yearly_revenue - prev_year_revenue) * 100 / NULLIF(prev_year_revenue, 0),
        2
    ) AS yoy_revenue_percent
FROM with_lag
ORDER BY `Advertisement Type`, year;

# Banner YOY% Growth 1.87
# text YOY% Growth 0.33 
# video YOY% Growth 0.84


WITH yearly_revenue AS (
    SELECT
        DATE_FORMAT(`date_part`, '%Y-01-01') AS year,
        `Project Type`,
        SUM(Revenue) AS yearly_revenue
    FROM advertising_kpi_database
    GROUP BY DATE_FORMAT(`date_part`, '%Y-01-01'), `Project Type`
),

with_lag AS (
    SELECT
        yr.*,
        LAG(yr.yearly_revenue) OVER (
            PARTITION BY yr.`Project Type`
            ORDER BY yr.year
        ) AS prev_year_revenue
    FROM yearly_revenue yr
)

SELECT
    `Project Type`,
    year,
    yearly_revenue,
    prev_year_revenue,
    ROUND(
        (yearly_revenue - prev_year_revenue) * 100 / NULLIF(prev_year_revenue, 0),
        2
    ) AS yoy_revenue_percent
FROM with_lag
ORDER BY `Project Type`, year;

# Retail YOY% Growth 2.14 
# telecom YOY% Growth -0.07