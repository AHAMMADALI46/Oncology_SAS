/* Enable ODS PDF Output */
ods pdf file="Output/Reports/summary_report.pdf" style=journal;
ods graphics on;

/* Title for the Report */
title "Oncology Clinical Trial Summary Report";

/* Section 1: Descriptive Statistics */
title2 "Patient Demographics and Baseline Characteristics";
proc means data=cleaned_data n mean std min max median;
  var age survival_time_months;
  class treatment_arm;
run;

proc freq data=cleaned_data;
  tables treatment_arm sex tumor_response / chisq;
run;

/* Section 2: Kaplan-Meier Survival Analysis */
title2 "Kaplan-Meier Survival Curves";
proc lifetest data=cleaned_data plots=survival(atrisk=0 to 60 by 12 cb=hw);
  time survival_time_months * survival_status(0);
  strata treatment_arm / test=logrank;
run;

/* Section 3: Cox Proportional Hazards Model */
title2 "Cox Regression Analysis for Treatment Effect";
proc phreg data=cleaned_data;
  class treatment_arm (ref='Control') sex (ref='Male');
  model survival_time_months * survival_status(0) = treatment_arm age sex;
  hazardratio treatment_arm / cl=both;
run;

/* Close ODS PDF Output */
ods pdf close;
