# INF4000: Composite Visualisation for International Football Data

## Overview

This repository contains scripts and outputs for creating composite visualisations based on international football match data. The visualisations uncover insights into match outcomes, home advantage trends, scoring patterns, and regional differences.

This project is part of the coursework for the **INF4000** module. It builds upon the analytical techniques developed in the **INF6027** module, which focuses on deeper data analysis methods. For more details on the analytical foundations, refer to the related repository:  
[INF6027-FootballAnalysis](https://github.com/uossheldon/INF6027-FootballAnalysis.git)

----------

## File Structure

```
INF4000-FootballVisualisation/
├── data/                     # Raw datasets
│   ├── results.csv           # Match outcomes data
│   ├── goalscorers.csv       # Goal scorers data
│   ├── shootouts.csv         # Penalty shootout data
│   ├── results_summary_classified.csv # Classified summary results
├── scripts/                  # R scripts for data processing and visualisation
│   ├── data_cleaning.R       # Data cleaning script
│   ├── summary_visualisation.R # Generates summary visualisations
│   ├── accessibility_analysis.R # Data accessibility analysis
│   ├── utilities.R           # Utility functions
├── outputs/                  # Generated visuals and summary tables
│   ├── visuals/              # Visualisation images
│   │   ├── match_outcome_distribution.png
│   │   ├── home_goal_difference_distribution.png
│   │   ├── goal_time_distribution.png
│   │   ├── home_win_rate_trends.png
│   │   ├── penalty_shootouts_distribution.png
│   ├── tables/               # Analysis result tables
└── LICENSE                   # License for the project
```

----------

## Visualisation Highlights

1.  **Match Outcome Distribution** (`match_outcome_distribution.png`):
    
    -   Displays the distribution of match outcomes (Win, Draw, Loss) across various scenarios.
        
2.  **Home Goal Difference Distribution** (`home_goal_difference_distribution.png`):
    
    -   Visualises the difference in goals scored by home and away teams.
        
3.  **Goal Distribution by Time Interval** (`goal_time_distribution.png`):
    
    -   Highlights goal frequencies in different time intervals during matches.
        
4.  **Trends in Home Win Rates** (`home_win_rate_trends.png`):
    
    -   Shows the evolution of home win rates across historical eras.
        
5.  **Penalty Shootouts Outcome Distribution** (`penalty_shootouts_distribution.png`):
    
    -   Analyzes the outcomes of penalty shootouts in various matches.
        

----------

## How to Run

### Prerequisites

-   **R Environment**: Install R 4.0+ and the following packages:
    
    ```
    install.packages(c("ggplot2", "dplyr", "tidyr", "scales"))
    ```
    

### Steps

1.  Clone the repository:
    
    ```
    git clone https://github.com/uossheldon/INF4000-FootballVisualisation.git
    cd INF4000-FootballVisualisation
    ```
    
2.  Run the `summary_visualisation.R` script to generate outputs:
    
    ```
    source("scripts/summary_visualisation.R")
    ```
    
3.  View the outputs in the `outputs/visuals/` directory.
    

----------

## License

This project is licensed under the MIT License - see the LICENSE file for details.
