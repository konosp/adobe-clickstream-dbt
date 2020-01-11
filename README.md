# Adobe Analytics Clickstream & dbt on BigQuery
Basic introduction on building models based on Adobe clickstream data. This repository is complementary to the guide at XXXX.

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
- Clone the repository and copy the profile-sample.yml file to ~/.dbt/. This will ensure your configuration settings for the purposes of this guide will 
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

## Reading
For a general introduction on dbt and backfilling clickstream data, check https://analyticsmayhem.com/adobe-analytics/model-data-bigquery-dbt/.
