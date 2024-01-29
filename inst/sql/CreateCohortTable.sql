{DEFAULT @create_cohort_table = TRUE}

{@create_cohort_table}?{
  IF OBJECT_ID('@target_database_schema.@cohort_table', 'U') IS NOT NULL
  	DROP TABLE @target_database_schema.@cohort_table;

  CREATE TABLE @target_database_schema.@cohort_table (
  	cohort_definition_id BIGINT,
  	subject_id BIGINT,
  	cohort_start_date DATE,
  	cohort_end_date DATE
  );
}:{}