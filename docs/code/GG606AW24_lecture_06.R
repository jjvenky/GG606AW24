# GG606AW24
# Lecture 06
# Jason Venkiteswaran


library(tidyverse)
theme_set(theme_minimal())

x1 <- c("Dec", "Apr", "Jan", "Mar")
x2 <- c("Dec", "Apr", "Jam", "Mar")
sort(x1)

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

y1 <- factor(x1, levels = month_levels)
y1

sort(y1)
#> [1] Jan Mar Apr Dec
#> Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec


y2 <- factor(x2, levels = month_levels)
y2
#> [1] Dec  Apr  <NA> Mar 
#> Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec


factor(x1)
#> [1] Dec Apr Jan Mar
#> Levels: Apr Dec Jan Mar


glimpse(gss_cat)
str(gss_cat)


gss_cat %>%
  count(race)

ggplot(gss_cat, aes(race)) +
  geom_bar()

ggplot(gss_cat, aes(race)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)




relig_summary <- gss_cat %>%
  group_by(relig) %>%
  summarise(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )
ggplot(relig_summary, aes(tvhours, relig)) + 
  geom_point()





ggplot(gss_cat, aes(x = rincome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip()

gss_cat %>% 
  filter(rincome != "Not applicable") %>% 
  mutate(rincome = fct_recode(rincome,
                              "Less than $1000" = "Lt $1000")) %>% 
  ggplot(aes(x = rincome)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip() +
  labs(y = "Number of Respondants",
       x = "Respondant's Income", 
       caption = "GSS data")

gss_cat %>% 
  count(relig) %>% 
  arrange(desc(n)) %>% 
  head(1)

gss_cat %>% 
  count(partyid) %>% 
  arrange(desc(n)) %>%
  head(1)




relig_summary <- gss_cat %>%
  group_by(relig) %>%
  summarise(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

ggplot(relig_summary, aes(tvhours, relig)) + 
  geom_point()



ggplot(relig_summary, aes(tvhours, fct_reorder(relig, tvhours))) + 
  geom_point()



ggplot(rincome_summary, aes(tvhours, fct_reorder(relig, age))) + geom_point()


rincome_summary <- gss_cat %>%
  group_by(rincome) %>%
  summarise(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

ggplot(rincome_summary, aes(age, fct_reorder(rincome, age))) + geom_point()




by_age <- gss_cat %>%
  filter(!is.na(age)) %>%
  count(age, marital) %>%
  group_by(age) %>%
  mutate(prop = n / sum(n))

ggplot(by_age, aes(age, prop, colour = marital)) +
  geom_line(na.rm = TRUE)

ggplot(by_age, aes(age, prop, colour = fct_reorder2(marital, age, prop))) +
  geom_line() +
  labs(colour = "marital")




gss_cat %>%
  mutate(marital = marital %>% fct_infreq()) %>%
  ggplot(aes(marital)) +
  geom_bar()

gss_cat %>%
  mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>%
  ggplot(aes(marital)) +
  geom_bar()



gss_cat %>% count(partyid)


gss_cat %>%
  mutate(partyid = fct_recode(partyid,
                              "Republican, strong"    = "Strong republican",
                              "Republican, weak"      = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak"        = "Not str democrat",
                              "Democrat, strong"      = "Strong democrat"
  )) %>%
  count(partyid)



gss_cat %>%
  mutate(partyid = fct_collapse(partyid,
                                other = c("No answer", "Don't know", "Other party"),
                                rep = c("Strong republican", "Not str republican"),
                                ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                                dem = c("Not str democrat", "Strong democrat")
  )) %>%
  count(partyid)



library(lubridate)

ymd(20200708) 
ymd("2020-07-08") 
ymd("2020-Jul-08")
mdy("July 8, 2020") 
dmy("08-July-2020") 
dmy("08-07-2020")



ymd_hms("2020-07-08 20:11:59")
mdy_hm("07/08/2017 08:11 pm")


ymd_hms("2020-07-08 20:11:59") %>% as.POSIXct()
ymd_hms("2020-07-08 20:11:59", tz="EDT") %>% as.POSIXct()


Sys.getlocale("LC_TIME")

Sys.timezone()
OlsonNames()



(x1 <- ymd_hms("2015-06-01 12:00:00", tz = "America/New_York"))
(x2 <- ymd_hms("2015-06-01 18:00:00", tz = "Europe/Copenhagen"))
(x3 <- ymd_hms("2015-06-02 04:00:00", tz = "Pacific/Auckland"))

x1 - x2
x1 - x3

