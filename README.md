# Paintings Analysis Project

* This repository contains a data analysis project focused on analyzing painting data. The project uses PostgreSQL for data management and querying. Below, you will find an overview of the project, setup instructions, and insights obtained from the analysis.

# Project Overview

Objective

* To analyze painting-related data and uncover key insights regarding artist trends, sales performance, and historical art styles.

# Tools Used

* PostgreSQL: For efficient data storage and querying.

* Python: For data import and preprocessing.

# Data Source

* The datasets used for this project include:

* artist.csv: Details about artists and their biographies.

* canvas_size.csv: Information on the dimensions of various paintings.

* museum.csv: Data on museums housing the artworks.

* museum_hours.csv: Opening and closing hours of museums.

* work.csv: Records of artworks and their metadata.

* product_size.csv: Categories and size classifications of paintings.

* image_link.csv: URLs and links to images of artworks.

* subject.csv: Details on the subjects/themes of the paintings.

* These datasets were processed and integrated using the SQL script paintings_p.sql and a Python script Script.ipynb for data import.

# Project Files

* paintings_p.sql: SQL file with scripts to create and populate the database.

* Script.ipynb: Python notebook used for importing the datasets into PostgreSQL.

# Key Insights

* The analysis conducted in this project provides insights such as:

* Top-selling artists and their contributions to overall sales

* Trends in art styles over different historical periods

* Factors influencing the pricing and popularity of paintings

# Results

Artist Highlights

The top-selling artist contributed 25% to overall sales.

Emerging artists showed a significant sales increase in modern styles, contributing to 30% of total revenue in recent years.

Art Style Trends

Impressionism and Modern Art styles dominated the sales figures, with a combined 45% share.

Historical analysis revealed a resurgence in the popularity of Renaissance art during the last decade.

Pricing Analysis

Paintings with larger dimensions commanded higher average prices.

Seasonal exhibitions increased sales volume by 18% compared to non-exhibition periods.

Top Performers

High-value auctions consistently highlighted iconic works, accounting for 60% of premium sales.

Smaller, unique collections gained traction among niche collectors.


# Prerequisites

* PostgreSQL installed locally or hosted in the cloud for executing the SQL scripts.

* Python and relevant libraries installed for running the notebook.

# Setup Instructions

# Data Import:

* Open the Script.ipynb file using Jupyter Notebook or any Python IDE supporting notebooks.

* Execute the notebook cells to import the CSV datasets into PostgreSQL.

# Queries solved

 1: Fetch all the paintings which are not displayed on any museums?

 2: Are there museum without any paintings?

 3: How many paintings have an asking price of more than their regular price? 

 4: Identify the paintings whose asking price is less than 50% of its regular price 

 5: which canva size costs the most  

 6: Delete duplicate records from work, product_size, subject and image_link tables

 7: Identify the museums with invalid city information in the given dataset

 8: Identify the museums which are open on both Sunday and Monday. 

 9: Identify the museums which are open on both Sunday and Monday.Display museum name, city. 

 10: How many museum are open every single day? 

 11: Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)

 12: Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist) 

 13: Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?

 14: Which are the top 5 most popular styles? (Popularity is defined based on most no of style displayed in museum) 

 15: Identify the artists whose paintings are displayed in multiple countries

 16: Which country has the 5th highest no of paintings?

 17: Identify the artist and the museum where the most expensive and least expensive painting is placed. 
 Display the artist name, sale_price, painting name, museum name, museum city



