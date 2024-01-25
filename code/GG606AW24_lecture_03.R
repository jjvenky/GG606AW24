# GG606AW23
# Lecture 03
# Jason Venkiteswaran

library(tidyverse)
library(here)
theme_set(theme_minimal())

data.frame(a=1:3, b=4:6)
tibble(a=1:3, b=4:6)

x <- tibble(a=1:3, b=4:6)
y <- as.data.frame(x)
y

read_csv(here("data", "penguins_raw.csv"))

# Parsing data ------------------------------------------------------------

# Tibbles https://r4ds.had.co.nz/tibbles.html

# Data import https://r4ds.had.co.nz/data-import.html

str(parse_logical(c("TRUE", "FALSE", "NA")))
#>  logi [1:3] TRUE FALSE NA
str(parse_integer(c("1", "2", "3")))
#>  int [1:3] 1 2 3
str(parse_date(c("2010-01-01", "1979-10-14")))
#>  Date[1:2], format: "2010-01-01" "1979-10-14"

parse_double("1.23")
#> [1] 1.23
parse_double("1,23", locale = locale(decimal_mark = ","))
#> [1] 1.23

parse_date("2010-10-01")
#> [1] "2010-10-01"

parse_date("01/02/15", "%m/%d/%y")
#> [1] "2015-01-02"
parse_date("01/02/15", "%d/%m/%y")
#> [1] "2015-02-01"
parse_date("01/02/15", "%y/%m/%d")
#> [1] "2001-02-15"

parse_date("1 janvier 2015", "%d %B %Y", locale = locale("fr"))
#> [1] "2015-01-01"


parse_number("$100")

parse_number("123.456.789", locale = locale(grouping_mark = "."))

parse_datetime("2021-01-01T0001")

parse_datetime("2021-01-01")

parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/15", "%y/%m/%d")

parse_date("1 janvier 2015", "%d %B %Y", locale = locale("fr"))

parse_date('21 Enero 2021', '%d %B %Y', locale = locale('es'))

parse_date('21 一月 2021', '%d %B %Y', locale = locale('zh'))

parse_date("1 gennaio 2015", "%d %B %Y", locale = locale("it"))

parse_date("1 stycznia 2024", "%d %B %Y", locale = locale("pl"))

https://cran.r-project.org/web/packages/readr/vignettes/locales.html

