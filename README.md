# 🍕 Pizza Store Sales Analysis (SQL Project)

> **Note:** This dataset is fictional and used solely for educational and portfolio purposes. It does not represent real customer or business data.

This project analyzes pizza restaurant sales data using SQL (PostgreSQL) to uncover actionable insights for improving business performance. It answers **10 key business questions**, helping understand customer demand patterns, top-selling products, and opportunities for revenue growth.

---

## 📂 Dataset Description

The analysis is based on four main datasets:
- **orders** – Order ID, date, and time of each purchase.
- **order_details** – Items and quantities included in each order.
- **pizzas** – Pizza IDs, sizes, and prices.
- **pizza_types** – Pizza names, categories, and ingredients.

---

## 🛠️ Tools Used

- **PostgreSQL** – Data querying and analysis  
- **DBeaver** – SQL editor for running queries and reviewing results

---

## 🔑 Business Questions Answered

1. Busiest days of the week  
2. Busiest hours of the day  
3. Seating occupation per hour (assuming 10 tables, 4 seats each)  
4. Best and worst-selling pizzas  
5. Most popular pizza categories  
6. Most popular pizza sizes  
7. Average number of pizzas per order  
8. Average order value  
9. Pizzas commonly bought together  
10. Pizza combinations generating the highest revenue  

---

## 📊 Key Findings

### **Q1 – Busiest Days of the Week**

| Day       | Pizzas Sold |
|-----------|-------------|
| Friday    | 8,242       |
| Saturday  | 7,493       |
| Thursday  | 7,478       |
| ...       | ...         |

💡 **Application:** Helps with **staff scheduling**, ensuring peak days have enough workers and ingredients.

---

### **Q2 – Busiest Hours of the Day**

| Hour | Avg. Pizzas Sold |
|------|------------------|
| 12   | 18.98            |
| 13   | 17.91            |
| 18   | 15.17            |
| ...  | ...              |

💡 **Application:** Optimizes **shift planning and delivery availability**.

---

### **Q3 – Seating Occupation Per Hour**

| Hour | Avg Tables Occupied | Table Occupation % | Seat Occupation % |
|------|--------------------|--------------------|--------------------|
| 12   | 7.06               | 70.59              | 70.59              |
| 13   | 6.86               | 68.58              | 68.58              |
| 18   | 6.72               | 67.20              | 67.20              |
| 17   | 6.54               | 65.43              | 65.43              |
| 19   | 5.63               | 56.27              | 56.27              |
| ...  | ...                | ...                | ...                |

💡 **Application:** Detects **high-traffic hours**, ensuring enough seating and faster service during lunch and dinner peaks.

---

### **Q4 – Best and Worst-Selling Pizzas**

| Pizza Name                   | Pizzas Sold |
|------------------------------|-------------|
| The Classic Deluxe Pizza     | 2,453       |
| The Barbecue Chicken Pizza   | 2,432       |
| The Hawaiian Pizza           | 2,422       |
| ...                          | ...         |
| The Brie Carre Pizza         | 490         |

💡 **Application:** Helps **refine the menu**, focusing on high-demand pizzas and rethinking low sellers.

---

### **Q5 – Most Popular Pizza Categories**

| Category | Pizzas Sold |
|----------|-------------|
| Classic  | 14,888      |
| Supreme  | 11,987      |
| Veggie   | 11,649      |
| Chicken  | 11,050      |

💡 **Application:** Improves **ingredient purchasing planning** and category-based marketing campaigns.

---

### **Q6 – Most Popular Pizza Sizes**

| Size | Times Sold |
|------|------------|
| L    | 18,956     |
| M    | 15,635     |
| S    | 14,403     |
| XL   | 552        |
| XXL  | 28         |

💡 **Application:** Supports **upselling strategies** (e.g., "Upgrade to Large for $2") and stock planning for large pizza boxes.

---

### **Q7 – Average Number of Pizzas Per Order**

| Metric                | Value |
|-----------------------|-------|
| Avg. pizzas per order | 2.32  |

💡 **Application:** Helps design **combo deals or family-size offers** to increase the number of pizzas per order.

---

### **Q8 – Average Order Value (USD)**

| Metric                | Value ($) |
|-----------------------|-----------|
| Avg. order value      | 16.82     |

💡 **Application:** Provides a **sales benchmark**, enabling **cross-selling** and **pricing strategy adjustments**.

---

### **Q9 – Pizzas Commonly Bought Together**

| Pizza 1                   | Pizza 2                   | Times Sold Together  |
|---------------------------|---------------------------|----------------------|
| The Hawaiian Pizza        | The Thai Chicken Pizza    | 321                  |
| The Barbecue Chicken Pizza| The Pepperoni Pizza       | 309                  |
| The Hawaiian Pizza        | The Pepperoni Pizza       | 300                  |
| ...                       | ...                       | ...                  |

💡 **Application:** Helps create **combo offers** and **menu recommendations** to boost basket size.

---

### **Q10 – Pizza Combinations Generating the Highest Revenue**

| Pizza 1                      | Pizza 2                      | Total Revenue ($) |
|------------------------------|------------------------------|-------------------|
| The California Chicken Pizza | The Thai Chicken Pizza       | 10,701.50         |
| The Hawaiian Pizza           | The Thai Chicken Pizza       | 10,674.25         |
| The Barbecue Chicken Pizza   | The California Chicken Pizza | 10,593.25         |
| ...                          | ...                          | ...               |

💡 **Application:** Guides **premium bundle creation** and highlights high-revenue combos for targeted promotions.

---

## 🚀 How to Use

1. Import the dataset into a **PostgreSQL database**.
2. Open the `pizza_store_analysis.sql` file in your SQL editor (e.g., DBeaver, pgAdmin).
3. Run queries to reproduce results and generate actionable insights.

---

## 📫 Connect with Me

- **Author:** Gabriel Roca  
- **LinkedIn:** [linkedin.com/in/gabriel-roca-t](https://www.linkedin.com/in/gabriel-roca-t)  
- **GitHub:** [github.com/gabriel-roca-t](https://github.com/gabriel-roca-t)  

---

⭐ *If you found this project useful or interesting, feel free to star the repository or reach out for collaboration opportunities.*
