# Summary Visualisation Script
# This script generates and saves individual key visualisations for the coursework.

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Define input and output directories
input_dir <- "data/"
output_dir <- "outputs/visuals/"

# Load datasets
results <- read.csv(paste0(input_dir, "results.csv"))
goalscorers <- read.csv(paste0(input_dir, "goalscorers.csv"))
results_summary <- read.csv(paste0(input_dir, "results_summary_classified.csv"))
shootouts <- read.csv(paste0(input_dir, "shootouts.csv"))

# Ensure output directory exists
dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

# Plot 1: Match Outcome Distribution
match_outcome_plot <- ggplot(results_summary, aes(x = Outcome, fill = Outcome)) +
  geom_bar() +
  ggtitle("Match Outcome Distribution") +
  theme_minimal()
ggsave(paste0(output_dir, "match_outcome_distribution.png"), match_outcome_plot)

# Plot 2: Home Goal Difference Distribution
home_goal_difference_plot <- ggplot(results, aes(x = HomeGoals - AwayGoals)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "black") +
  ggtitle("Home Goal Difference Distribution") +
  xlab("Goal Difference (Home - Away)") +
  theme_minimal()
ggsave(paste0(output_dir, "home_goal_difference_distribution.png"), home_goal_difference_plot)

# Plot 3: Goal Distribution by Time Interval
goal_time_plot <- ggplot(goalscorers, aes(x = MinuteGroup)) +
  geom_bar(aes(fill = as.factor(HomeTeam)), position = "dodge") +
  ggtitle("Goal Distribution by Time Interval") +
  xlab("Minute Group") +
  theme_minimal()
ggsave(paste0(output_dir, "goal_time_distribution.png"), goal_time_plot)

# Plot 4: Trends in Home Win Rates Across Historical Eras
home_win_rate_plot <- ggplot(results_summary, aes(x = Year, y = HomeWinRate)) +
  geom_line(color = "blue") +
  ggtitle("Trends in Home Win Rates Across Historical Eras") +
  theme_minimal()
ggsave(paste0(output_dir, "home_win_rate_trends.png"), home_win_rate_plot)

# Plot 5: Penalty Shootouts Analysis
penalty_shootouts_plot <- ggplot(shootouts, aes(x = PenaltyOutcome, fill = PenaltyOutcome)) +
  geom_bar() +
  ggtitle("Penalty Shootouts Outcome Distribution") +
  theme_minimal()
ggsave(paste0(output_dir, "penalty_shootouts_distribution.png"), penalty_shootouts_plot)

# End of script
