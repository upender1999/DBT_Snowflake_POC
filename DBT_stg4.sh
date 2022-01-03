#Install the latest pip
pip install dbt --user
echo $(pwd)
cd _upender1999_DBT_Snowflake_POC
dbt deps
dbt compile
dbt seed
#dbt run
dbt run -t sys4
dbt test
dbt docs generate
dbt docs serve --port 8001
# End of the program.
