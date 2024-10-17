{% macro generate_database_name(custom_database_name=none, node=none) -%}
    
    {%- if custom_database_name is not none -%}
        {{ custom_database_name | trim }}
    {%- else -%}
        {%- if target.name == 'personal_dev' -%}
            {{ project_name }}_{{ env_var('DBT_CLOUD_GIT_BRANCH', '') | replace('/', '_') | replace('-', '_') }}
        {%- elif target.name == 'dev' -%}
            {{ project_name }}_DEV
        {%- elif target.name == 'qa' -%}
            {{ project_name }}_QA
        {%- elif target.name == 'prod' -%}
            {{ project_name }}_PROD
        {%- else -%}
            {{ target.database }}
        {%- endif -%}
    {%- endif -%}

{%- endmacro %}