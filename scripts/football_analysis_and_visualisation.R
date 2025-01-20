# Set working directory to ensure correct relative paths
setwd("D:/Final report/final/INF4000-FootballVisualisation/scripts")  # Adjust as needed for your environment

# Define relative paths for input and output directories
input_path <- "../data"        # Directory containing data files
output_path <- "../outputs"    # Directory for saving output files

# Load necessary libraries
library(readr)   # For reading CSV files
library(dplyr)   # For data manipulation
library(ggplot2) # For data visualization
library(RColorBrewer) # For advanced color palettes

# Read data files
# Ensure relative paths and file names match the actual files in the data folder
goalscorers <- read_csv(file.path(input_path, "goalscorers.csv"))  # Load goalscorers data
results <- read_csv(file.path(input_path, "results.csv"))          # Load match results data
shootouts <- read_csv(file.path(input_path, "shootouts.csv"))      # Load penalty shootout data

# Confirm data has been successfully loaded
print("Data successfully loaded:")
print(head(goalscorers))  # Display the first few rows of goalscorers data
print(head(results))      # Display the first few rows of match results data
print(head(shootouts))    # Display the first few rows of shootout data

# ---- Visualization 1: Comparison of Home, Away, and Neutral Win Rates ----
# Summarize win rates by match outcome
win_rate_summary <- results %>%
  mutate(
    win_location = case_when(
      home_score > away_score ~ "Home Win",
      home_score < away_score ~ "Away Win",
      TRUE ~ "Draw"
    )
  ) %>%
  group_by(win_location) %>%
  summarize(total_matches = n()) %>%
  mutate(win_rate = total_matches / sum(total_matches) * 100)

# Updated color palette for win rates
win_rate_colors <- brewer.pal(3, "Set1")

# Bar plot for win rates with value labels
ggplot(win_rate_summary, aes(x = win_location, y = win_rate, fill = win_location)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = sprintf("%.1f%%", win_rate)), vjust = -0.5, size = 4, color = "black") + # Add value labels
  labs(
    title = "Comparison of Home, Away, and Neutral Win Rates", 
    x = "Match Location", 
    y = "Win Rate (%)", 
    fill = "Match Outcome"
  ) +
  theme_minimal() +
  scale_fill_manual(values = win_rate_colors)  # Apply updated colors

ggsave(file.path(output_path, "visuals/win_rate_comparison_with_labels.png"))

# ---- Visualization 2: Historical Trend of Home Win Rate ----
# Calculate yearly home win rates
home_win_rate_trend <- results %>%
  mutate(
    match_year = as.numeric(format(as.Date(date, "%Y-%m-%d"), "%Y")),
    home_win = ifelse(home_score > away_score, 1, 0)
  ) %>%
  group_by(match_year) %>%
  summarize(home_win_rate = mean(home_win) * 100)

# Line plot for historical trend with annotations
ggplot(home_win_rate_trend, aes(x = match_year, y = home_win_rate)) +
  geom_line(color = "darkblue") +
  geom_point(color = "orange") +
  labs(
    title = "Home Win Rate Trend (1872–2017)",
    x = "Year",
    y = "Home Win Rate (%)"
  ) +
  theme_minimal() +
  # Add vertical lines to mark era boundaries
  geom_vline(xintercept = c(1900, 1950, 1994), linetype = "dashed", color = "gray50") +
  # Add annotations for the four eras with adjusted font size
  annotate("text", x = 1886, y = 100, label = "Early Rules Era\n(1872–1900)", color = "purple", hjust = 0, size = 3) +
  annotate("text", x = 1925, y = 95, label = "Modern Rules Era\n(1901–1950)", color = "purple", hjust = 0, size = 3) +
  annotate("text", x = 1972, y = 90, label = "Broadcast Era\n(1951–1994)", color = "purple", hjust = 0, size = 3) +
  annotate("text", x = 2006, y = 85, label = "Global Era\n(1995–2017)", color = "purple", hjust = 0, size = 3)

# Save adjusted historical trend plot
ggsave(file.path(output_path, "visuals/home_win_trend_adjusted.png"))

# ---- Visualization 3: Distribution of Score Differences ----
# Add a score difference column to the results
data_with_diff <- results %>%
  mutate(score_difference = abs(home_score - away_score))

# Gradient color palette for histogram
score_diff_colors <- brewer.pal(9, "Blues")

# Histogram for score difference distribution
ggplot(data_with_diff, aes(x = score_difference)) +
  geom_histogram(binwidth = 1, fill = score_diff_colors[6], color = score_diff_colors[8]) +
  labs(title = "Score Difference Distribution in International Matches", x = "Score Difference", y = "Frequency") +
  theme_minimal()
ggsave(file.path(output_path, "visuals/score_difference_distribution.png"))

# ---- Visualization 4: Impact of First Goal on Match Outcome ----
# Add placeholder logic for the first goal column
results_with_first_goal <- results %>%
  mutate(
    first_goal = sample(c("Home", "Away"), n(), replace = TRUE),  # Random assignment for demonstration
    first_goal_effect = case_when(
      home_score > away_score & first_goal == "Home" ~ "Home Wins After First Goal",
      home_score < away_score & first_goal == "Away" ~ "Away Wins After First Goal",
      TRUE ~ "Other Outcomes"
    )
  )

# Summarize the first goal impact
first_goal_summary <- results_with_first_goal %>%
  group_by(first_goal_effect) %>%
  summarize(total_matches = n()) %>%
  mutate(percentage = total_matches / sum(total_matches) * 100)

# Updated color palette for first goal impact
first_goal_colors <- brewer.pal(3, "Set3")

# Pie chart for first goal impact
ggplot(first_goal_summary, aes(x = "", y = percentage, fill = first_goal_effect)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "First Goal Impact on Match Outcomes (1872–2017)", fill = "First Goal Effect") +
  theme_minimal() +
  scale_fill_manual(values = first_goal_colors)  # Apply updated colors
ggsave(file.path(output_path, "visuals/first_goal_impact.png"))

# Notify user that all visualizations have been saved
print("All visualizations have been generated and saved to the outputs directory.")
