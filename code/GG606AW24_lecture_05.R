# GG606AW24
# Lecture 05
# Jason Venkiteswaran


library(tidyverse)
library(nycflights13)
theme_set(theme_minimal())

airlines
airports
planes
weather

planes %>% 
  count(tailnum) %>% 
  filter(n > 1)

flights %>% 
  count(tailnum) %>% 
  filter(n > 1)



flights %>% 
  count(year, month, day, flight) %>% 
  filter(n > 1)

flights %>% 
  count(year, month, day, tailnum) %>% 
  filter(n > 1)



flights %>%
  arrange(year, month, day, sched_dep_time, carrier, flight) %>%
  mutate(flight_id = row_number()) %>%
  glimpse()



flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2

flights2 %>%
  select(-origin, -dest) %>% 
  left_join(airlines, by = "carrier")



flights2 %>% 
  left_join(weather)

flights2 %>% 
  left_join(planes, by = "tailnum")



?`filter-joins`


top_dest <- flights %>%
  count(dest, sort = TRUE) %>%
  head(10)

flights %>% 
  filter(dest %in% top_dest$dest)

flights %>% 
  semi_join(top_dest)



?Quotes



string1 <- "This is a string"

string2 <- 'If I want to include a "quote" inside a string, I use single quotes'


str_c("x", "y", "z")
c("x", "y", "z")


x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
str_sub(x, -3, -1)


str_to_lower(x)
str_to_sentence(x)
str_to_title(x)
str_to_upper(x)


str_to_upper(c("i", "ı"))
str_to_upper(c("i", "ı"), locale = "tr")


y <- c("apple", "eggplant", "banana")

str_sort(y, locale = "en")
str_sort(y, locale = "haw")


