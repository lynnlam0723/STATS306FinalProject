# README

## Project Abstract

This project analyzed and visualized the data from the IMDB. We initially tidied the data by registering "\N" as an NA value in the datasets.
We then began basic exploratory analysis on the 4 tables - title_basics, title_principals, title_ratings, and name_basics. Basic data manipulation functions, such as "mutate" and "group_by," as well as the "ggplot" library were utilized for this section.
We analyzed the title_basics table more in-depth in terms of its "genres" column. The column was expanded using the "pivot_longer" and "separate_rows" functions in order to visualize how genre proportions of titles varied over time. Common genre pairings within the table were also found, showing the relationships between them.
The tables were merged in various groupings to analyze correlations. title_basics and title_ratings were joined to determine the average ratings of each genre and plot their trends. name_basics, title_ratings, and title_principals were then all joined. This allowed us to understand the trends of ratings over time for popular people and the popularity of genres within titles in the dataset.
We continued to experiment with optimizing previous code using parallel processing and profiling. We profiled a function utilizing "group_by" and "summarize." We then used parallelization to improve the performance of finding the minimum value in a table column. Finally, we utilized benchmarking to determine the performance of 2 different functions intended to count words in a string. These optimization processes allowed us to compare ways to run code more efficiently.
Shiny applications for users to interact with the IMDB data were then created. The first utilized widgets to allow users to explore the IMDB data with plots and sliders. The second allowed users to choose category data from the title_principals table and explored other column data from the same table based on the category.
Lastly, a Shiny application was created to allow users to play "Six Degrees of Kevin Bacon." This was completed using reactive events, reactive buttons, and the "nconst" column in the tables.

## Team

Lynn Lam is a senior in the School of Information minoring in Statistics. I will be graduating after 5 years of university after next winter. I enjoy being a coffee snob, playing video games (Baldur's Gate 3 right now!), and watching horror movies.

Shuxian Chen is a senior who majoring in Statistics & Data Science. I enjoy reading novels and playing video games.

Katherine Zhao is a junior studying Pharmaceutical Sciences with a minor in Statistics. I enjoy dancing, playing the violin, and matching odd patterns together to create cohesively-uncohesive outfits.

Tilmont "Tilly" Williams is a sophomore majoring in Statistics and minoring in German Studies. I enjoy running, knitting, and rock climbing. 
