install.packages(c("readxl", "dplyr", "stringr", "likert"))
library(readxl)
library(dplyr)
library(stringr)
library(likert)

# 1) Read your uploaded Excel file (Posit Cloud: same folder as your .R file)
df2 <- read_excel("EYCFluVaccine_StaffLikert.xlsx")

# Convert to a data frame
df2 <- as.data.frame(df2)

# Create the likert levels
likert_levels <- c(
  "Strongly disagree",
  "Disagree",
  "Neither agree nor disagree",
  "Agree",
  "Strongly agree"
)


df2 <- df2 %>%
  mutate(across(everything(),
                \(x) factor(str_squish(as.character(x)),
                            levels = likert_levels, ordered = TRUE)))

# Create a likert plot
plot(likert(df2)) +
  theme(
    axis.text.y = element_text(size = 14)
  )
