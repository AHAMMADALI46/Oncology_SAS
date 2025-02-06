/* Import synthetic clinical trial data */
proc import datafile="synthetic_clinical_trial_data.csv" 
  out=clinical_data dbms=csv replace;
  getnames=yes;
run;

/* Data Cleaning & Transformation */
data cleaned_data;
  set clinical_data;

  /* Convert dates to SAS date format */
  rand_date = input(rand_date, yymmdd10.);
  survival_date = input(survival_date, yymmdd10.);

  /* Calculate survival time in months */
  survival_time_months = (survival_date - rand_date) / 30.44;  

  /* Keep only necessary variables */
  keep patient_id treatment_arm age sex survival_time_months survival_status tumor_response;

  /* Format labels */
  label survival_time_months = "Survival Time (Months)";
run;

/* Print first few observations for verification */
proc print data=cleaned_data (obs=10); run;
