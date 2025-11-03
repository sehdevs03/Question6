#1: open file
spending <- read.csv("historical_spending.csv")

#2: read in libraries
library(tidyverse)
library(ggplot2)
library(plotly)

#3 plot
spending1 <- spending %>%
  pivot_longer(
    cols = Candy:GiftCards,
    names_to = "Category",
    values_to = "Amount"
  )
  
trends <- ggplot(spending1, aes(x = Year, y = Amount, color = Category)) +
  geom_line() +
  labs(title = "Historical Spending Trends by Category")

#4: Interactive plot
ggplotly(trends)

#5 Save plot as image
ggsave("trends.png")