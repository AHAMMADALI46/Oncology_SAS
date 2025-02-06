/* Generate descriptive statistics for age */
proc means data=cleaned_data n mean std min max median;
  var age survival_time_months;
  class treatment_arm;
  output out=age_summary mean= std= min= max= median= / autoname;
run;

/* Frequency distributions for categorical variables */
proc freq data=cleaned_data;
  tables treatment_arm sex survival_status tumor_response / chisq;
  ods output OneWayFreqs=freq_tables;
run;

/* Print results for verification */
proc print data=age_summary; run;
proc print data=freq_tables; run;
