# Load necessary libraries
library(dplyr)
library(ggplot2)
library(readr)

# Set file paths (update paths if needed)
results_path <- "results.csv"
goalscorers_path <- "goalscorers.csv"
results_summary_path <- "results_summary_classified.csv"
shootouts_path <- "shootouts.csv"

# Load datasets
results <- read_csv(results_path)
goalscorers <- read_csv(goalscorers_path)
results_summary <- read_csv(results_summary_path)
shootouts <- read_csv(shootouts_path)

# Function to calculate missing value percentages
calculate_missing_percentage <- function(df) {
  missing <- sapply(df, function(x) sum(is.na(x)))
  total <- nrow(df)
  percentage <- round((missing / total) * 100, 2)
  data.frame(Variable = names(df), Missing = missing, Percentage = percentage)
}

# 1. Missing value analysis
results_missing <- calculate_missing_percentage(results)
goalscorers_missing <- calculate_missing_percentage(goalscorers)
results_summary_missing <- calculate_missing_percentage(results_summary)
shootouts_missing <- calculate_missing_percentage(shootouts)

# Save missing value analysis to CSV
write_csv(results_missing, "results_missing.csv")
write_csv(goalscorers_missing, "goalscorers_missing.csv")
write_csv(results_summary_missing, "results_summary_missing.csv")
write_csv(shootouts_missing, "shootouts_missing.csv")

# 2. Yearly distribution of matches (from results.csv)
if("date" %in% colnames(results)) {
  results <- results %>% mutate(year = as.numeric(format(as.Date(date, "%Y-%m-%d"), "%Y")))
  yearly_distribution <- results %>% 
    count(year) %>% 
    arrange(year)
  
  # Plot yearly distribution
  ggplot(yearly_distribution, aes(x = year, y = n)) +
    geom_line(color = "blue") +
    geom_point() +
    labs(title = "Yearly Distribution of Matches", x = "Year", y = "Number of Matches") +
    theme_minimal()
  
  # Save plot
  ggsave("yearly_distribution.png")
}

# 3. Coverage visualization for key fields in results.csv
if("home_team" %in% colnames(results) && "away_team" %in% colnames(results) && "score" %in% colnames(results)) {
  coverage_data <- results %>% 
    summarise(
      HomeTeamCoverage = 100 - sum(is.na(home_team)) / n() * 100,
      AwayTeamCoverage = 100 - sum(is.na(away_team)) / n() * 100,
      ScoreCoverage = 100 - sum(is.na(score)) / n() * 100
    ) %>% 
    pivot_longer(everything(), names_to = "Field", values_to = "Coverage")
  
  # Plot coverage
  ggplot(coverage_data, aes(x = Field, y = Coverage)) +
    geom_bar(stat = "identity", fill = "skyblue") +
    labs(title = "Field Coverage in Results Data", x = "Field", y = "Coverage (%)") +
    theme_minimal()
  
  # Save plot
  ggsave("field_coverage.png")
}

# Output message
cat("Accessibility analysis complete. Results saved as CSV and PNG files.")
