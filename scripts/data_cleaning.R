# Load necessary libraries
library(ggplot2)
library(dplyr)

# Set the working directory to the scripts folder (modify if needed)
# setwd("./scripts")

# Define file paths
input_folder <- "../data"
output_folder <- "../outputs"

goalscorers_file <- file.path(input_folder, "goalscorers.csv")
results_file <- file.path(input_folder, "results.csv")
shootouts_file <- file.path(input_folder, "shootouts.csv")

# Read the data files
goalscorers <- read.csv(goalscorers_file)
results <- read.csv(results_file)
shootouts <- read.csv(shootouts_file)

# Data cleaning for goalscorers
if (!is.null(goalscorers) && nrow(goalscorers) > 0) {
  goalscorers_clean <- goalscorers %>%
    filter(!is.na(Player), !is.na(Goals)) %>%
    mutate(Player = trimws(Player),
           Goals = as.numeric(Goals))
  
  # Save the cleaned data
  write.csv(goalscorers_clean, file.path(output_folder, "goalscorers_clean.csv"), row.names = FALSE)
}

# Data cleaning for results
if (!is.null(results) && nrow(results) > 0) {
  results_clean <- results %>%
    filter(!is.na(HomeTeam), !is.na(AwayTeam), !is.na(Result)) %>%
    mutate(HomeTeam = trimws(HomeTeam),
           AwayTeam = trimws(AwayTeam))
  
  # Save the cleaned data
  write.csv(results_clean, file.path(output_folder, "results_clean.csv"), row.names = FALSE)
}


# Data cleaning for shootouts
if (!is.null(shootouts) && nrow(shootouts) > 0) {
  shootouts_clean <- shootouts %>%
    filter(!is.na(Player), !is.na(Goals)) %>%
    mutate(Player = trimws(Player),
           Goals = as.numeric(Goals))
  
  # Save the cleaned data
  write.csv(shootouts_clean, file.path(output_folder, "shootouts_clean.csv"), row.names = FALSE)
}

# Example visualization: Goalscorers bar chart
if (!is.null(goalscorers) && nrow(goalscorers) > 0) {
  ggplot(goalscorers, aes(x = reorder(Player, Goals), y = Goals)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    coord_flip() +
    labs(title = "Top Goalscorers", x = "Player", y = "Goals") +
    theme_minimal()
  
  # Save the plot
  ggsave(file.path(output_folder, "goalscorers_bar_chart.png"), width = 8, height = 6)
}

# Example analysis: Match results summary
if (!is.null(results) && nrow(results) > 0) {
  match_summary <- results %>%
    group_by(Result) %>%
    summarise(Count = n())
  
  # Save the summary
  write.csv(match_summary, file.path(output_folder, "match_summary.csv"), row.names = FALSE)
}

# Additional analysis can be added below

