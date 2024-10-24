{% macro create_snowflake_database() %}
    {%- set branch_name = env_var('DBT_CLOUD_GIT_BRANCH') -%}
    {%- set project_name = project_name -%}  {# Directly using dbt's project_name variable #}
    {%- set role_name = target.role -%}

    {%- if not branch_name %}
        {%- set branch_name = 'default_branch' -%}  {# Default fallback #}
    {%- endif -%}

    {%- if not role_name %}
        {%- set role_name = 'DEFAULT_ROLE' -%}  {# Default role fallback in case it's missing from target #}
    {%- endif -%}

    {%- set database_name = project_name + '_' + branch_name | replace('-', '_') | upper -%}

    -- Create the database if it doesn't exist
    {% do run_query("CREATE DATABASE IF NOT EXISTS " ~ database_name) %}

    -- Grant usage and access to the specified role
    {% do run_query("GRANT ALL PRIVILEGES ON DATABASE " ~ database_name ~ " TO ROLE " ~ role_name) %}

    {% do log("Database " ~ database_name ~ " has been created and granted to role " ~ role_name, info=True) %}
{% endmacro %}
