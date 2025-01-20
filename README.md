# Football Visualization Analysis

This repository contains scripts and outputs for creating composite visualisations based on international football match data. The visualisations uncover insights into match outcomes, home advantage trends, scoring patterns, and regional differences.

This project is part of the coursework for the **INF4000** module. It builds upon the analytical techniques developed in the **INF6027** module, which focuses on deeper data analysis methods. For more details on the analytical foundations, refer to the related repository:
 [INF6027-FootballAnalysis](https://github.com/uossheldon/INF6027-FootballAnalysis.git)

## Project Structure

```
INF4000-FootballVisualisation/
├── LICENSE
├── README.md
├── requirements.txt
├── data/
│   ├── goalscorers.csv
│   ├── results.csv
│   ├── results_summary_classified.csv
│   └── shootouts.csv
├── outputs/
│   ├── tables/
│   └── visuals/
│       ├── first_goal_impact.png
│       ├── home_win_trend.png
│       ├── score_difference_distribution.png
│       └── win_rate_comparison.png
└── scripts/
    └── football_analysis_and_visualisation.R
```

## Installation

To run the analysis, follow these steps:

1. **Install R**: Download and install [R](https://cran.r-project.org/).

2. **Install Required Packages**: Run the following R command to install the required packages:

   ```r
   install.packages(c("readr", "dplyr", "ggplot2", "RColorBrewer"))
   ```

3. **Clone the Repository**: Clone the project using Git:

   ```bash
   git clone https://github.com/uossheldon/INF4000-FootballVisualisation.git
   ```

4. **Set Working Directory**: Set your working directory to the `scripts` folder where the R script is located:

   ```r
   setwd("path/to/INF4000-FootballVisualisation/scripts")
   ```

## Data Files

The `data/` folder contains the following CSV files:

- `goalscorers.csv`: Contains data on football match goalscorers.
- `results.csv`: Contains the results of football matches (home and away scores).
- `results_summary_classified.csv`: A classified summary of match results.
- `shootouts.csv`: Contains data about penalty shootouts.

## Outputs

The analysis generates the following visualizations, which will be saved in the `outputs/visuals` folder:

- **win_rate_comparison.png**: A bar chart comparing home, away, and neutral win rates.
- **home_win_trend.png**: A line chart showing the historical trend of home win rates over time.
- **score_difference_distribution.png**: A histogram of score differences in matches.
- **first_goal_impact.png**: A pie chart showing the impact of the first goal on match outcomes.

## Running the Analysis

1. Open the R script located in `scripts/football_analysis_and_visualisation.R`.
2. The script will automatically load the necessary data files from the `data/` folder, process them, and generate visualizations.
3. The resulting images will be saved in the `outputs/visuals` folder.

### Script Overview

- **Data Loading**: Loads match results, goalscorers, and shootouts data from the `data/` folder.
- **Data Processing**: Computes win rates, historical trends, score differences, and the impact of the first goal.
- **Visualizations**: Generates various visualizations using `ggplot2` to display insights from the data.
- **Output**: Saves the generated visualizations as PNG files in the `outputs/visuals` folder.

## License

This project is licensed under the MIT License. See the [LICENSE](https://chatgpt.com/g/g-2DQzU5UZl-code-copilot/c/LICENSE) file for more details.
