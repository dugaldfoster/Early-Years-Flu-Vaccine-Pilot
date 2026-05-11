install.packages(c("readxl", "dplyr", "stringr", "likert"))
library(readxl)
library(dplyr)
library(stringr)
library(likert)

# 1) Read your uploaded Excel file (Posit Cloud: same folder as your .R file)
df <- read_excel("Updated_EYCFluVaccine_ParentLikert.xlsx", sheet = "Sheet1")

# Convert to a data frame
df <- as.data.frame(df)

# Create the likert levels
likert_levels <- c(
  "Strongly disagree",
  "Disagree",
  "Neither agree nor disagree",
  "Agree",
  "Strongly agree"
)


df <- df %>%
  mutate(across(everything(),
                \(x) factor(str_squish(as.character(x)),
                            levels = likert_levels, ordered = TRUE)))

# Create a likert plot
plot(likert(df)) +
  theme(
    axis.text.y = element_text(size = 14)
  )
