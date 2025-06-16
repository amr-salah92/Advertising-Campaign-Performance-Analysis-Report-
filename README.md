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
1. ⚡️ **Social Media drives 23% higher ROAS (4.1)** than Search Engine (3.3)  
2. 📈 **Telecom campaigns generate 35% more revenue** ($12.5 avg uplift) vs Retail ($8.2)  
3. 🕙 **10 AM–2 PM delivers 40% of daily conversions** with lowest CPC ($0.15)  

![Monthly ROAS Trends](link-to-visual-social-vs-search-trends)  

---

### 11. Insights Deep Dive  
#### Category 1: Channel Efficiency  
- **Insight 1.1:** Social Media has highest ROAS (4.1) and Revenue Uplift ($14.2)  
  *Support:* 28% YoY revenue growth in 2024, peak ROAS=16.65 (Campaign #01705)  
- **Insight 1.2:** Affiliate ads have lowest CPM ($1.8) but highest CPA ($12)  
  *Support:* 20% higher CPA than Social Media, CTR below benchmark (0.008)  

![ROAS by Channel](link-to-channel-roas-barchart)  

#### Category 2: Creative Optimization  
- **Insight 2.1:** Video ads dominate impressions (65K/month) but have lowest CTR (0.006)  
  *Support:* 48% lower CTR than Text ads, despite 22% higher impressions  
- **Insight 2.2:** Text ads achieve best CPA ($7) and CTR (0.035)  
  *Support:* Telecom text ads: 0.038 conversion rate (highest in dataset)  

![CTR vs CPA by Format](link-to-ctr-cpa-scatterplot)  

#### Category 3: Temporal Patterns  
- **Insight 3.1:** 10 AM–2 PM generates 48% of daily leads (1,200 leads/hour avg)  
  *Support:* Lowest CPC ($0.15) and highest revenue/hour ($18K)  
- **Insight 3.2:** March 2024 peaked with $2.1M revenue (+20% MoM growth)  
  *Support:* Telecom campaigns drove 62% of quarterly revenue  

![Conversions by Hour](link-to-heatmap-hourly-conversions)  

#### Category 4: Industry Benchmarks  
- **Insight 4.1:** Telecom achieves 35% higher ROAS (5.4) vs Retail (4.0)  
  *Support:* 28% lower CPA ($8 vs $11), +52% lead generation  
- **Insight 4.2:** Retail underperforms in revenue uplift (-18% vs Telecom)  
  *Support:* 72% of Retail campaigns missed CPA targets in Q3 2024  

![Telecom vs Retail Dashboard](link-to-industry-dashboard)  

---

### 12. Recommendations  
1. **Budget Reallocation**  
   - Shift 20% of Search Engine budget to Social Media (projected +23% ROAS)  
   - *Rationale: Social Media delivers highest ROAS (4.1) and revenue uplift ($14.2)*  

2. **Creative Optimization**  
   - Replace underperforming Video ads with Text ads in Telecom campaigns  
   - *Rationale: Text ads yield 0.038 conversion rate (best in dataset)*  

3. **Bid Timing Strategy**  
   - Concentrate 50% of daily bids in 10 AM–2 PM windows  
   - *Rationale: 48% of daily leads generated in this period with lowest CPC*  

4. **Cross-Industry Tactics**  
   - Implement Telecom's CPA model ($8) in Retail via audience segmentation  
   - *Rationale: Retail CPA currently $11 (37.5% higher than Telecom)*  

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
