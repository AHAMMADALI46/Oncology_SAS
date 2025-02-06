/* Generate Kaplan-Meier Survival Curves */
ods graphics on;
ods pdf file="Output/KM_Plots/survival_curves.pdf";

/* Kaplan-Meier Plot with Confidence Intervals and At-Risk Table */
proc lifetest data=cleaned_data plots=survival(atrisk=0 to 60 by 12 cb=hw);
  time survival_time_months * survival_status(0);  /* 0 = Censored */
  strata treatment_arm;                            /* Separate by treatment group */
run;

ods pdf close;
