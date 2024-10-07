{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- set branch_name = env_var('DBT_CLOUD_GIT_BRANCH') | replace('-', '_') -%}
    
    {%- if target.name == 'personal_dev' -%}
        {%- if custom_schema_name is none -%}
            {{ branch_name }}_FB_BRANCH
        {%- else -%}
            {{ custom_schema_name | trim }}_FB_BRANCH
        {%- endif -%}
    {%- else -%}
        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ default_schema }}_{{ custom_schema_name | trim }}
        {%- endif -%}
    {%- endif -%}

{%- endmacro %}