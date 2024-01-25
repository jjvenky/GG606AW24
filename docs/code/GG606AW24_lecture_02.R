# GG606AW24
# Lecture 02
# Jason Venkiteswaran


# The here package --------------------------------------------------------

install.packages("here")

library(here)

# Use it as: here("folder", "file")


# Example -----------------------------------------------------------------

library(palmerpenguins)
library(tidyverse)
ggplot(penguins, aes(x = species, y = bill_length_mm)) +
  geom_boxplot(outlier.shape = NA, width = 0.2) +
  geom_jitter(width = 0.1) +
  labs(x = "Species", y = "Bill Length (mm)") +
  theme_minimal()
ggsave(here("figures", "beak_size_by_species.pdf"))
ggsave(here("figures", "beak_size_by_species.pdf"), 
       width = 7, height = 5, units = "in")


# Another example with raw data -------------------------------------------

# Load raw penguin data
penguins_raw <- read_csv(here("data", "penguins_raw.csv"))

# Stable isotope plot
ggplot(penguins_raw, aes(`Delta 13 C (o/oo)`, `Delta 15 N (o/oo)`)) +
  geom_point(aes(shape = Island, colour = Species)) +
  stat_ellipse(aes(colour = Species)) +
  scale_colour_viridis_d() +
  labs(title = "Penguin Isotope Ecology",
       x = expression(δ^{13}*"C (‰ vs PDB)"),
       y = expression(δ^{15}*"N (‰ vs air)"),
       caption = "Data soruce: Horst et al. 2020. doi: 10.5281/zenodo.3960218") +
  theme_minimal() +
  theme(legend.position = "bottom",
        legend.box = "vertical", legend.box.just = "left", 
        legend.margin = margin(-5, 0, 0, 0))

ggsave(here("figures", "penguin_isotopes.pdf"), device = cairo_pdf, width = 8, height = 6)



# Reproducible research ---------------------------------------------------

# Nüst D, Granell C, Hofer B, Konkol M, Ostermann FO, Sileryte R, Cerutti V. 2018. Reproducible research and GIScience: an evaluation using AGILE conference papers. PeerJ 6:e5072 https://doi.org/10.7717/peerj.5072



