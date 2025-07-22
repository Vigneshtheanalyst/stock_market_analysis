# 📊 Stock Market Financial Data Analysis Project

This project analyzes 30 years of historical stock price data from six leading companies using *Excel, **MySQL, and **Power BI*. It includes data cleaning, SQL-based transformation, advanced analytics, and interactive dashboarding to uncover long-term stock trends and financial insights.

---

## 🧾 Project Objective

To explore and visualize stock data from multiple companies to derive meaningful insights — such as average closing prices, volume trends, volatility, and top-performing stocks — with a dynamic and interactive Power BI dashboard.

---
## 🗂 Dataset Overview

- *Source*: Yahoo Finance (exported via Python or manually)
- *Duration*: 30 years of daily stock price data  
- *Companies*: Dell, IBM, Verizon (VZ), Intel (INTC), and others  
- *Tables*:
  - stock_price – Daily price data (Date, Open, Close, Volume, etc.)
  - company_info – Company names and metadata (with primary key)

---

## 🛠 Tools & Technologies

- 📗 *Excel* – Data cleaning and initial formatting  
- 🐬 *MySQL* – Data modeling, table creation, joins, and advanced queries  
- 📈 *Power BI* – KPI visualization, DAX measures, slicers, tooltips, and interactivity  

---
## 📅 4-Week Project Plan

| Week | Focus Area                          | Tools Used        |
|------|-------------------------------------|-------------------|
| ⿡   | Data Cleaning + KPI Planning        | Excel / Google Sheets |
| ⿢   | SQL Table Setup + Basic Queries     | MySQL             |
| ⿣   | Advanced SQL Queries + Joins        | MySQL             |
| ⿤   | Power BI Dashboard & Interactivity  | Power BI Desktop  |

---
## 📊 Key Dashboard Insights

- *Year-wise Sum of Closing Prices* (Line Chart)
- *30-Day Moving Average* (Line & Clustered Column Chart)
- *Top 5 Highest Closing Days* (Table)
- *Monthly Close Price Trend by Company* (Tooltip Line Chart)
- *KPI Cards*: Max Close, Avg Close, Total Volume
- *Interactive Filters*: Company Selector, Year Slicer

---

## 🧱 Data Model

- fact_stock_price  
- dim_company  
- (Optional) dim_date for time-based slicing  

*Relationships*:
- stock_price[company_id] → company_info[company_id] (foreign key)

---

## 🧮 DAX Measures Used
- 30-Day Moving Average
- Max Close Price
- Avg Close Price
- % Price Change  
- Gain or Loss Indicator (📈/📉)

---


