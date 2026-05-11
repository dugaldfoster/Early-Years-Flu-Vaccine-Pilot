install.packages(c("readxl", "dplyr", "stringr", "likert"))
library(readxl)
library(dplyr)
library(stringr)
library(likert)

# 1) Read your uploaded Excel file (Posit Cloud: same folder as your .R file)
df3 <- read_excel("EYCFluVaccine_SiteRepLikert.xlsx")

# Convert to a data frame
df3 <- as.data.frame(df3)

# Create the likert levels
likert_levels <- c(
  "Strongly disagree",
  "Disagree",
  "Neither agree nor disagree",
  "Agree",
  "Strongly agree"
)


df3 <- df3 %>%
  mutate(across(everything(),
                \(x) factor(str_squish(as.character(x)),
                            levels = likert_levels, ordered = TRUE)))

# Create a likert plot
plot(likert(df3)) +
  theme(
    axis.text.y = element_text(size = 14)
  )
