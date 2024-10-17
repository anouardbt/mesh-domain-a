{% macro generate_database_name(custom_database_name=none, node=none) -%}
    
    {%- if custom_database_name is not none -%}
        {{ custom_database_name | trim }}
    {%- else -%}
        {%- set file_path_parts = node.original_file_path.split('/') %}
        {%- set folder_name = file_path_parts[1] if file_path_parts | length > 2 else project_name %}

        {%- if target.name == 'personal_dev' -%}
            {{ folder_name }}_{{ env_var('DBT_CLOUD_GIT_BRANCH', '') | replace('/', '_') | replace('-', '_') }}
        {%- elif target.name == 'dev' -%}
            {{ folder_name }}_DEV
        {%- elif target.name == 'qa' -%}
            {{ folder_name }}_QA
        {%- elif target.name == 'prod' -%}
            {{ folder_name }}_PROD
        {%- else -%}
            {{ target.database }}
        {%- endif -%}
    {%- endif -%}

{%- endmacro %}
