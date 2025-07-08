# Oncology Clinical Trial Survival Analysis....

## Project Overview
This project simulates a real-world oncology clinical trial analysis using **SAS**. The dataset contains synthetic patient-level data for evaluating treatment effects, survival outcomes, and tumor response. The project includes:

- **Descriptive statistics** (demographics, tumor response rates).  
- **Kaplan-Meier survival analysis** (comparing treatment groups).  
- **Cox proportional hazards model** (estimating hazard ratios).  
- **Advanced subgroup analysis** (age-based survival differences).  
- **Graphical visualizations** (Kaplan-Meier curves, forest plots).  

## Repository Structure

```
Oncology-SAS-Project/
├── Data/  
│   ├── synthetic_clinical_trial_data.csv  # Synthetic dataset  
│   └── data_dictionary.md                 # Variable descriptions  
├── Code/  
│   ├── data_preprocessing.sas             # Data cleaning & transformation  
│   ├── descriptive_stats.sas              # Summary statistics  
│   ├── survival_analysis.sas              # KM curves & Cox models  
│   ├── advanced_analysis.sas              # Subgroup & interaction analysis  
│   ├── KM_plots.sas                        # Survival curves visualization  
│   ├── summary_reports.sas                # Generates PDF report  
└── README.md                               # Project documentation  
```

## Setup Instructions

### Prerequisites  
- SAS software installed (Base SAS, SAS/STAT).  
- Clone this repository:  
  ```bash
  git clone https://github.com/AHAMMADALI46/Oncology-SAS-Project.git
  cd Oncology-SAS-Project
  ```

### Running the Analysis  
1. Load the dataset:  
   - Open **data_preprocessing.sas** in SAS.  
   - Run the script to clean and prepare data.  

2. Generate statistics:  
   - Run **descriptive_stats.sas** to summarize patient demographics.  

3. Perform survival analysis:  
   - Run **survival_analysis.sas** to generate Kaplan-Meier curves and Cox models.  
   - Run **KM_plots.sas** for detailed survival curves.  

4. Advanced analysis:  
   - Run **advanced_analysis.sas** for subgroup comparisons.  

5. Generate reports:  
   - Run **summary_reports.sas** to create a structured PDF report.  

## Results Summary

### 1. **Survival Analysis**
- **Kaplan-Meier Median Survival Time:**  
  - Experimental treatment: **24 months**  
  - Control group: **18 months**  
  - Log-rank test: **p=0.03** (significant survival benefit).  

- **Cox Regression Model:**  
  - Adjusted hazard ratio (HR): **0.65** (95% CI: 0.48–0.88).  
  - Suggests a **35% reduction** in risk of death for the treatment arm.  

### 2. **Tumor Response Analysis**  
- Overall Response Rate (ORR):  
  - Experimental arm: **35%**  
  - Control arm: **20%**  
  - p-value: **0.01** (significant difference).  

### 3. **Subgroup Analysis**  
- **Age-based survival benefit:**  
  - **Age <65**: HR = **0.55** (better response).  
  - **Age ≥65**: HR = **0.82** (less benefit).  

## Future Enhancements  
- Integrate **real-world evidence (RWE)** data.  
- Add **biomarker-based analysis** for precision oncology.  
- Use **machine learning models** for survival predictions.  

---  
📌 **Author:** Ali Ahammad Shaik  
📌 **Location:** Montreal  
📌 **Contact:** [skalistats6@gmail.com]  
