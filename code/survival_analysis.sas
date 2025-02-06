/* Kaplan-Meier Survival Analysis */
proc lifetest data=cleaned_data plots=survival(atrisk=0 to 60 by 12);
  time survival_time_months * survival_status(0);  /* 0 = Censored */
  strata treatment_arm / test=logrank;            /* Compare survival between arms */
  ods output SurvivalPlot=KM_Plot;                /* Export survival plot data */
run;

/* Export Kaplan-Meier Plot */
ods graphics on / imagemap=on;
ods pdf file="Output/Reports/survival_analysis.pdf";
  proc sgplot data=KM_Plot;
    step x=time y=survival / group=stratum;
    xaxis label="Time (Months)";
    yaxis label="Survival Probability";
  run;
ods pdf close;

/* Cox Proportional Hazards Model */
proc phreg data=cleaned_data;
  class treatment_arm (ref='Control') sex (ref='Male');
  model survival_time_months * survival_status(0) = treatment_arm age sex;
  hazardratio treatment_arm / cl=both;  /* Compute hazard ratio with 95% CI */
  ods output ParameterEstimates=Cox_Model;
run;

/* Print Cox Model Results */
proc print data=Cox_Model; run;
