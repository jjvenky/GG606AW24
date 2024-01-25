# GG606AW24
# Lecture 01
# Jason Venkiteswaran

# Setting up an RStudio Project -------------------------------------------

# Click the “File” menu button, then “New Project”.
# Click “New Directory”.
# Click “Empty Project”.
#
# Type in the name of the directory to store your project, e.g. “my_project”.
# If available, select the checkbox for “Create a git repository.”
# Click the “Create Project” button.



# Code from the slides ----------------------------------------------------


library(tidyverse)

mpg

ggplot(mpg) + geom_point(aes(x = displ, y = hwy))

ggplot(mpg) + geom_point(aes(x = displ, y = hwy, colour = manufacturer, shape = drv))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(colour = class)) +
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_point(colour = "white", size = 4) +
  geom_point()


ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()


# Splitting plot by a variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(colour = class)) +
  geom_smooth()


# Stats
ggplot(diamonds) +
  geom_bar(aes(cut))

?geom_bar

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


# Position
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
# 234 rows in mpg, where are they?

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(position = "jitter")

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_jitter()


# Coords
ggplot(mpg, aes(class, hwy)) +
  geom_boxplot() +
  coord_flip()


bar <- ggplot(diamonds) +
  geom_bar(aes(x = cut, fill = cut),
           show.legend = FALSE,
           width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()



# Homework ----------------------------------------------------------------

install.packages("palmerpenguins")
# Make some interesting plots with new geom_ and theme_
# ggplot2.tidyverse.org
# Try out ggsave
# pangaea.de & www.frdr-dfdr.ca
# allisonhorst.github.io/palmerpenguins/


