# Adobe Analytics Clickstream & dbt on BigQuery
Basic introduction on building models based on Adobe clickstream data. 

## Requirements
- Load Adobe Analytis Data to BigQuery. This is needed in order to query the data. Also the default naming convention by Adobe is required. For more information on how to load data, check my article https://analyticsmayhem.com/adobe-analytics/data-feeds-google-bigquery/.
- Access to BigQuery and permissions needed to run Jobs:
  - BigQuery Data Editor
  - BigQuery Job User
  - BigQuery User
- Install dbt from https://docs.getdbt.com/docs/installation. In this guide, the pip installation method is followed.
```
pip install dbt
```
- Clone the repository, modify the profile-demo.yml so that it reflects your GCP project and BigQuery dataset details. Then copy the file to ~/.dbt/. This will ensure your configuration settings required by dbt are in the correct place.
```
cp profile-demo.yml ~/.dbt/profiles.yml
```

## Compiling and running models
dbt has a wide range of features. First, in order to confirm that dbt is installed and your SQL models are compiled you can run the below within the project directory.
```
dbt compile
```
This will just generate valid SQL under the *target/compiled/core/* path.

In order to execute the models on BigQuery (or any other associated database):
```
dbt run
```

## Running incremental models
Running incremental models is not just about adding new data, but also managing how you can re-run your models for historical data. Defining your date range is important during run-tine. Variables configured at dbt_project.yml can be overwritting during "dbt run" executions as per below:
```
 dbt run –models clickstream+ –var ‘{“start_date”:”<period start>”,”end_date”:”<period end>”}’
```
The variables above affect the values at the incremental_filter macro under the macros directory.

## Reading
For a general introduction on dbt and backfilling clickstream data, check 
- Introduction to dbt and a niche example of backfilling Adobe Analytics data: https://analyticsmayhem.com/adobe-analytics/model-data-bigquery-dbt/
- General setup in BigQuery to run models on Adobe Clickstream data: https://analyticsmayhem.com/adobe-analytics/clickstream/bigquery-data-models-dbt-sql/
- Incremental models: https://analyticsmayhem.com/dbt/incremental-dbt-models-using-adobe-analytics-clickstream/

