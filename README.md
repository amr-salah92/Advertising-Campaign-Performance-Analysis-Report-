# Advertising-Campaign-Performance-Analysis-Report

## Table of Contents  
1. [Project Name](#1-project-name)  
2. [Project Background](#2-project-background)  
3. [Project Goals](#3-project-goals)  
4. [Data Collection and Sources](#4-data-collection-and-sources)  
5. [Formal Data Governance](#5-formal-data-governance)  
6. [Regulatory Reporting](#6-regulatory-reporting)  
7. [Methodology](#7-methodology)  
8. [Data Structure & Initial Checks](#8-data-structure--initial-checks)  
9. [Documenting Issues](#9-documenting-issues)  
10. [Executive Summary](#10-executive-summary)  
11. [Insights Deep Dive](#11-insights-deep-dive)  
12. [Recommendations](#12-recommendations)  
13. [Future Work](#13-future-work)  
14. [Technical Details](#14-technical-details)  
15. [Assumptions and Caveats](#15-assumptions-and-caveats)  

---

### 1. Project Name  
**Optimize Media Investments: Analyzing Campaign Performance for AdTech Solutions Inc.**  

---

### 2. Project Background  
AdTech Solutions Inc. operates in the digital advertising sector (2023–2024), managing campaigns across Retail and Telecom industries. The business model focuses on maximizing ROI through multichannel ad placements (Social Media, Search Engine, Affiliate). Key metrics include:  
- Average ROAS: 46.386098
- CPA range: $5–$50  
- Revenue Uplift range: -$5 to $20  
- Database covers Jan 2023–Dec 2024 (24 months)  
- 50,000 records tracking $ 1,978,572,338 BN in Revenue
- Max Ads Spend : 9478.84 $
- Total Ads Spend : 73 M $
- CPM Range 1 - 15 
- CPC Range 0.1 - 2 
- CTR range 0.005 - 0.05
- CPA Range 5 - 50 
- Conversion Rate range 0.005 - 0.03
- Revenue Uplift range -5  - 20
- Impressions range 1000 - 99997
- Clicks range 6 - 4969 
- Lead Generation range 1 - 2912
- ROAS range -20.69   -  1014.37
  
---

### 3. Project Goals  
**Primary Objective:** Improve ROAS by 15% and reduce CPA by 10% in 2025.  
**Key Analytical Questions:**  
1. Identify channels/ad formats with highest Revenue Uplift  
2. Analyze temporal (hourly/monthly) impact on conversion rates  
3. Establish cost-efficiency benchmarks per industry  
4. Quantify YoY performance changes across dimensions  

---

### 4. Data Collection and Sources  
| Source Type | Details |  
|-------------|---------|  
| **Primary Database** | MySQL: `advertising_kpi_database` |  
| **Data Granularity** | Daily campaign metrics (Jan 2023 - Dec 2024) |  
| **External Sources** | None (100% first-party data) |  
| **Key Tables** | Single-table structure with 18 performance metrics |  

---

### 5. Formal Data Governance  
**Standardization:**  
- Revenue validation: `ROAS * (Clicks * CPA)`
- `Ad Spend`= Clicks * CPC
-  `Effeciency score`  = Revenue / `Ad Spend`
- Range-bound controls for metrics (e.g., CPM capped at $15)  

**Improvements Needed:**  
-

---

### 6. Regulatory Reporting  
**Compliance Measures:**  
- CPA/ROAS aligned with IAB Transparency Standards  
- Audit trail for revenue calculations  
- Anomaly detection for negative ROAS values  

**Data Remediation:**  
- 

---

### 7. Methodology  
**Analytical Techniques:**  
1. Cohort analysis by Channel/Ad Type/Industry  
2. MoM/YoY growth calculations (LAG window functions)  
3. Time-partitioned performance trends (hourly/monthly)  
4. Statistical normalization for metric ranges  

**Machine Learning:**  
- Not utilized (descriptive analytics focus)  

---

### 8. Data Structure & Initial Checks  
**Table:** `advertising_kpi_database` (50,000 rows, 19 columns)  

| Column              | Type          | Description                                                 | Validation              |
| ------------------- | ------------- | ----------------------------------------------------------- | ----------------------- |
| **Campaign ID**     | INT           | Unique identifier for each campaign                         | 0 nulls                 |
| **Date**            | DATETIME      | Date and time of the campaign                               | 0 nulls                 |
| **Channel**         | VARCHAR       | Marketing platform (Social Media, Search Engine, Affiliate) | 0 nulls                 |
| **Advertiser**      | VARCHAR       | Name of the advertiser                                      | 0 nulls                 |
| **CPM**             | DECIMAL(10,2) | Cost Per Thousand Impressions                               | 0 nulls                 |
| **CTR**             | DECIMAL(10,5) | Click-Through Rate                                          | 0 nulls                 |
| **CPC**             | DECIMAL(10,2) | Cost Per Click                                              | 0 nulls                 |
| **CPA**             | DECIMAL(10,2) | Cost Per Acquisition (\$5–\$50)                             | 0 nulls                 |
| **Conversion Rate** | DECIMAL(10,5) | Rate of conversions                                         | 0 nulls                 |
| **ROAS**            | DECIMAL(10,2) | Return on Ad Spend (-0.71–16.65)                            | 0 nulls                 |
| **Impression**      | INT           | Number of impressions                                       | 0 nulls                 |
| **Project Type**    | VARCHAR       | Type of project                                             | 0 nulls                 |
| **Clicks**          | INT           | Number of clicks                                            | 0 nulls                 |
| **Lead Generation** | INT           | Number of leads generated                                   | 0 nulls                 |
| **Comments**        | TEXT          | Additional comments                                         | 0 nulls                 |
| **Revenue Uplift**  | DECIMAL(10,2) | Incremental revenue vs baseline                             | 0 nulls                 |
| **Revenue**         | DECIMAL(18,2) | Total revenue generated                                     | 0 nulls                 |
| **Ad Spend**        | DECIMAL(18,2) | Amount spent on advertisements                              | 0 nulls                 |
| **date\_part**      | DATE          | Date component (2023-01-01 to 2024-10-31)                   | Derived from timestamp  |

![Screenshot_16-6-2025_211920_dbdiagram io](https://github.com/user-attachments/assets/21b82e74-7d1e-4036-a700-5f01e25bd078)

**Initial Checks:**  
- No Nulls 
- 100% valid `Campaign ID` (no duplicates)  
- Time range consistency verified  

---

### 9. Documenting Issues  
| Table | Column | Issue | Magnitude | Solvable | Resolution |  
|-------|--------|-------|-----------|----------|------------|  
| advertising_kpi_database | ROAS | misclassification | HIGH | Yes | Drop the old column & recalculate the new column |  


---

### 10. Executive Summary  
**Stakeholder:** Chief Marketing Officer  
**Top Insights:**  
1. ⚡️ **affilate drives higher AVG ROAS (46.444)** than Search Engine (46.431)  
2. 📈 **Telecom campaigns generate more revenue** ($7.511 avg uplift) vs Retail ($7.494)  
3. 🕙 **10 AM delivers highest Revenue (86165487.32 $)** with lowest CPC ($ 1.03803)
  
![Screenshot_17-6-2025_11334_chat deepseek com](https://github.com/user-attachments/assets/307a4132-45c5-4dea-8b05-72e81eb78e57)

---

### 11. Insights Deep Dive  
#### Category 1: Channel Efficiency  
- **Insight 1.1:** affilate has highest ROAS (46.444) , has Best CPM (7.971) & least ad spend with second highest Revenue
- **Insight 1.2:** Social Media has highest Revenue Uplift ($7.558) , best CPA ($27.37057)  , best CTR (0.02773) , lowest CPC ($1.04805)
- **Insight 1.3:** Search engine has highest Revenue ($671,468,706.22) , best CPA ($27.37057)  , best CTR (0.02773) , lowest CPC ($1.04805)

![Screenshot_17-6-2025_11543_chat deepseek com](https://github.com/user-attachments/assets/546242a2-301f-4c1e-92f6-9e81ea7ce658) 

#### Category 2: Creative Optimization  
- **Insight 2.1:** Video ads dominate highest total impressions (851626104) , total clicks (23394863) , total lead generations (9382504) and best CPM (7.941) & generate highest revenue (667744891.15) but highest ad _spend (24568867.08)
- **Insight 2.2:** Text ads has highest avg conversion rate (0.01755) and best CPA (27.44572)
  

![Screenshot_17-6-2025_12336_chat deepseek com](https://github.com/user-attachments/assets/2e0a166b-db59-4246-9aa2-29f12d77428e)

#### Category 3: Temporal Patterns  
- **Insight 3.1:** 10 AM generates Highest of daily leads (1236063 leads/hour )  
- **Insight 3.2:** march 2024 peaked with $86708303.41 revenue
- **Insight 3.3:** 2 pm has highest revenue uplift & lowesst CTR & Secand highest conversion rate , total impressions & ROAS



#### Category 4: Industry Benchmarks  
- **Insight 4.1:** Telecom achieves highest Conversion rate , revenue uplift , total impressions , total clicks , lead generations ,ROAS ,  best CPM ,CPA & generate the best revenue but  highest ad_spend




---

### 12. Recommendations

Based on the analysis of channel performance, ad format effectiveness, temporal trends, and industry benchmarks, the following strategic recommendations are proposed to **AdTech Solutions Inc.** to achieve the 2025 goals of increasing **ROAS by 15%** and reducing **CPA by 10%**:

#### 📢 Channel Strategy

- **Prioritize Affiliate Channels**  
  Affiliate campaigns deliver the highest average ROAS (**46.444**) and the lowest cost exposure relative to revenue. Allocate additional budget toward affiliate campaigns for performance-focused growth.


- **Reallocate from Underperforming Search Ads**  
  While Search Engine ads generate the highest total revenue, they lag in ROAS and consume higher ad spend. Shift a portion of this budget to affiliate and social media channels where return efficiency is stronger.


#### 🎯 Creative Optimization

- **Invest in Video for Reach, Text for Conversion**  
  Use **Video ads** for awareness (highest impressions, clicks, leads), but complement with **Text ads** in remarketing flows due to their **highest conversion rate (0.01755)** and **lowest CPA (27.45)**.

- **Monitor High-Spend Creatives**  
  Video formats lead in revenue but account for **$24.5M+ in ad spend**. Implement spending thresholds or ROI-based creative gating to prevent inefficient budget drains.

#### 🕙 Time-Based Campaign Scheduling

- **Double Down on 10 AM Slots**  
  Ads at **10 AM** produced the highest revenue (**$86.1M**) and lowest CPC (**$1.038**). Use automated bid boosts and priority delivery settings during this hour.

- **Avoid 2 PM Without Creative Adjustment**  
  Despite high revenue uplift at **2 PM**, CTR is the lowest. Recommend A/B testing new creatives or frequency-capping during this hour.

#### 🏭 Industry-Specific Targeting

- **Favor Telecom Sector**  
  Telecom campaigns outperformed Retail across all KPIs: ROAS, revenue, lead generation, CTR, and CPA. Recommend expanding Telecom-targeted investments in Q1–Q2 2025.

- **Refine Retail Bidding Strategy**  
  Retail shows competitive CTR and CPC but lower lead gen and ROAS. Apply more granular segmentation and test lower bid ceilings to boost return efficiency.

#### 📊 Operational Efficiency

- **Ad Spend Auditing**  
  Automatically flag and pause campaigns with **CPA > $40** or **ROAS < 1.0** for review. Introduce exception monitoring logic into campaign workflows.

- **Introduce Efficiency Scoring**  
  Implement a real-time **Efficiency Score** (`Revenue ÷ Ad Spend`) in internal dashboards to track and optimize performance continuously.

---

### 13. Future Work  
1. **Predictive Modeling**  
   - ROAS forecasting using CTR/CPA regression (Q3 2025)  
2. **Cross-Channel Attribution**  
   - Integrate Google Analytics pathing data (Q4 2024)  
3. **Creative Fatigue Analysis**  
   - Track CTR decay by ad version and refresh cycles  
4. **LTV Integration**  
   - Augment CPA with 90-day customer lifetime value  

---

### 14. Technical Details  
**Toolstack:**  
| Tool | Usage |  
|------|-------|  
| MySQL 8.0 | Data extraction, transformation, and MoM/YoY calculations |  
| Tableau 2024.1 | Interactive dashboards for performance tracking |  
| Python Pandas | Data quality checks and outlier detection |  

**Repositories:**  
- [Data Cleaning SQL Scripts](https://github.com/adtech/repo/data_cleaning)  
- [Business Analysis Queries](https://github.com/adtech/repo/business_queries)  
- [Tableau Performance Dashboard](https://tableau.adtech.com/dashboards/campaign_performance)  

---

### 15. Assumptions and Caveats  
1. **Revenue Calculation**  
   - Assumes CPA includes all acquisition costs (excludes churn)  
2. **Time Zone Handling**  
   - All timestamps in UTC without localization  
3. **ROAS Baseline**  
   - "Baseline revenue" not formally defined; used campaign averages  
4. **Seasonality Impact**  
   - Q4 holiday effects not isolated in YoY comparisons  
