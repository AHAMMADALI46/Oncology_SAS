/* Kaplan-Meier Survival Curves with At-Risk Table */
ods graphics on;
ods pdf file="Output/KM_Plots/survival_curves.pdf";

/* Generate Kaplan-Meier plot with at-risk table */
proc lifetest data=cleaned_data plots=survival(atrisk=0 to 60 by 12);
  time survival_time_months * survival_status(0);  /* 0 = Censored */
  strata treatment_arm;                            /* Separate by treatment arm */
run;

ods pdf close;
