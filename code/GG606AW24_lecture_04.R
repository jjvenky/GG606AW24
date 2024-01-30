# GG606AW24
# Lecture 04
# Jason Venkiteswaran


library(tidyverse)
library(nycflights13)
theme_set(theme_minimal())

flights

filter(flights, month == 1, day == 1)

filter(flights, month = 1)

filter(starwars, species == "Human")

filter(flights, month == 11 | month == 12)

filter(flights, !(arr_delay > 120 | dep_delay > 120))

filter(flights, arr_delay <= 120, dep_delay <= 120)

filter(flights, dest %in% c("IAH", "HOU"))
filter(flights, dest == "IAH" | dest == "HOU")

filter(flights, dest %in% c("IAH", "HOU"), carrier %in% c("UA", "AM", "DL"))
filter(flights, month == 12, day == 25, origin == "JFK", dest == "LAX")

arrange(flights, desc(dep_delay))

select(flights, year, month, day)

select(flights, year:day)

select(flights, 1:3)

select(flights, -(month:minute))



flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)
transmute(flights_sml,
          gain = dep_delay - arr_delay,
          speed = distance / air_time * 60
)



summarise(flights, delay = mean(dep_delay, na.rm = TRUE))



by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

flights %>% 
  group_by(year, month, day) %>% 
  summarise(delay = mean(dep_delay, na.rm = TRUE))


flights %>% 
  group_by(year, month, day) %>% 
  summarise(delay = mean(dep_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = month, y = delay)) + 
  geom_boxplot(aes(group = month), outlier.size = 0) + 
  geom_jitter(width = 0.1, height = 0) + 
  scale_x_continuous(breaks = 0:12) + 
  labs(x = "Month as number", 
       y = "Mean daily delay (minutes)", 
       title = "Departure delays in nycflights13::flights")



delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")


ggplot(delays, aes(x = dist, y = delay)) +
  geom_point(aes(colour = count)) + 
  labs(x = "Distance (miles)", 
       y = "Mean arrival delay (minutes)", 
       title = "Arrival delays as a function of distance in nycflights13::flights")

table1
table2
table3
table4a
table4b

ggplot(table1, aes(year, cases/population*100000, colour = country)) + 
  geom_line(aes(group = country)) + 
  geom_point() +
  scale_x_continuous(breaks = c(1999, 2000)) +
  labs(x = "Year", y = "TB Rate per 100,000",
       colour = "Country",
       caption = "Data: WHO via tidyr package.")


table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")


table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")

tidy4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
tidy4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
left_join(tidy4a, tidy4b)


table2 %>%
  pivot_wider(names_from = type, values_from = count)

table3 %>% 
  separate(rate, into = c("cases", "population"))

table5 %>% 
  unite(new, century, year)

table5 %>% 
  unite(new, century, year, sep = "")


