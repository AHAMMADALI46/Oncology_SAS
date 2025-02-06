/* Define age groups for subgroup analysis */
data cleaned_data;
length age_group $15;
  set cleaned_data;
  if age < 65 then age_group = "Under 65";
  else age_group = "65 and Above";
run;

/* Subgroup Analysis - Kaplan-Meier by Age Group */
proc lifetest data=cleaned_data plots=survival(atrisk=0 to 60 by 12);
  time survival_time_months * survival_status(0);
  strata age_group / test=logrank;
run;

/* Cox Regression with Treatment & Age Interaction */
proc phreg data=cleaned_data;
  class treatment_arm (ref='Control') sex (ref='Male') age_group (ref='Under 65');
  model survival_time_months * survival_status(0) = treatment_arm age sex treatment_arm*age_group;
  hazardratio treatment_arm / cl=both;
  hazardratio age_group / cl=both;
  ods output ParameterEstimates=Subgroup_Cox_Model;
run;

/* Forest Plot for Subgroup Analysis */
ods graphics on;
ods pdf file="Output/Reports/forest_plot.pdf";
  proc sgplot data=Subgroup_Cox_Model;
    scatter x=HazardRatio y=Effect / xerrorlower=LowerCL xerrorupper=UpperCL;
    refline 1 / axis=x lineattrs=(pattern=dash);
    xaxis label="Hazard Ratio (95% CI)";
    yaxis label="Subgroups";
  run;
ods pdf close;

/* Print Subgroup Cox Model Results */
proc print data=Subgroup_Cox_Model; run;
