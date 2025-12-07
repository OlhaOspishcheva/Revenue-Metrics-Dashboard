# Revenue Metrics Dashboard 📊

An interactive Tableau dashboard for tracking and analyzing key revenue metrics to drive data-driven business decisions.

## 🎯 Overview
The Revenue Metrics Dashboard is an interactive Tableau report designed to help product managers track and analyze key revenue indicators over time. The project focuses on identifying factors that drive revenue growth, user retention, and churn, providing actionable insights for data-driven decision-making.
## 🎪 Objectives

Monitor Revenue Dynamics: Track monthly recurring revenue (MRR) and paid user trends over time
Analyze Revenue Drivers: Identify factors contributing to revenue changes including Expansion MRR, Contraction MRR, New Paid Users, and Churned Users
Evaluate Performance Metrics: Assess key indicators such as ARPPU (Average Revenue Per Paying User), Churn Rate, Customer Lifetime (LT), and Customer Lifetime Value (LTV)
User Segmentation: Provide detailed analysis by age, language, game name, device model, and time period

## ✨ Key Features

Interactive Filtering: Dynamic filters for time periods, user segments, and product categories
Real-time Metrics: Up-to-date tracking of MRR, user counts, and revenue components
Cohort Analysis: User behavior and retention patterns across different cohorts
Trend Visualization: Clear visual representation of revenue dynamics and growth drivers
User Segmentation: Detailed breakdowns by demographics and user characteristics

## 🛠 Tools & Technologies

SQL (PostgreSQL): Data extraction and metric calculation using aggregation and window functions  
Tableau Public: Interactive dashboard creation, visual storytelling, and filtering by key dimensions

## 📈 Key Metrics

### Revenue Metrics

MRR (Monthly Recurring Revenue): Total recurring revenue generated each month  
Expansion MRR: Additional revenue from existing customers upgrading or expanding usage  
Contraction MRR: Revenue lost from existing customers downgrading  
New MRR: Revenue from newly acquired paying customers  
Churned MRR: Revenue lost from customers who stopped paying  

### User Metrics

New Paid Users: Count of new customers acquired in each period  
Churned Users: Count of customers who stopped being active paying users  
Active Paid Users: Total count of active paying customers  

### Performance Metrics

ARPPU: Average Revenue Per Paying User  
Churn Rate: Percentage of users who stopped paying  
LT (Lifetime): Average customer lifetime in months  
LTV (Lifetime Value): Total revenue expected from a customer over their lifetime  

## 🔍 Key Insights

Revenue Growth Pattern: MRR showed steady growth until autumn, followed by a stabilization period  
Primary Growth Driver: Expansion MRR was identified as the main contributor to revenue growth  
Target Audience: The most active paying audience belongs to the 18–24 age group  
Revenue Composition: Clear identification of which factors contribute most to revenue changes  

## 🎨 Dashboard Structure
The dashboard is organized into several key sections:

Overview Panel: High-level MRR trends and key metrics summary  
Revenue Waterfall: Visualization of MRR components (New, Expansion, Contraction, Churn)  
User Metrics: New vs. churned users tracking  
Segmentation Analysis: Breakdown by age, language, device, and game  
Performance Indicators: ARPPU, Churn Rate, LT, and LTV trends  

## 💻 Data Analysis
SQL Implementation
The project uses PostgreSQL for:

Data Extraction: Querying user transaction and subscription data
Metric Calculation: Using window functions to calculate MRR components
Aggregation: Grouping data by time periods and user segments
Cohort Analysis: Tracking user behavior across different time cohorts

## Key SQL Techniques Used

Window functions (LAG, LEAD, SUM OVER)
Date aggregation and period calculations
User segmentation and filtering
Metric derivation and transformation

## 🚀 How to Use

Access the Dashboard: Link to Tableau Public Dashboard: 
https://public.tableau.com/views/RevenueAnalysis_17620269283190/RevenueAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link  
Select Time Period: Use the date filter to focus on specific time ranges
Apply Segments: Filter by age group, language, device, or game name
Analyze Trends: Review MRR components and identify growth drivers
Export Insights: Download data or share visualizations with stakeholders

## 📊 Outcome
This dashboard enables quick identification of critical periods, trends, and user segments influencing revenue performance. It demonstrates proficiency in:

SQL data analysis and metric design
Tableau visualization aligned with business objectives
Revenue analytics and cohort analysis
Data-driven storytelling and insight generation

The project provides actionable insights for product managers to make informed decisions about user acquisition, retention strategies, and revenue optimization.

## 📁 Project Structure
Revenue-Metrics-Dashboard/  
├── screenshots/          # Dashboard screenshots  
├── sql/                  # SQL queries for data extraction  
├── data/                 # Sample data files (if applicable)  
└── README.md            # Project documentation  
## 📫 Contact
For questions or collaboration opportunities, please reach out via 

www.linkedin.com/in/olha-ospishcheva  
ospishevafarm86@gmail.com
