{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- if target.name == 'personal_dev' -%}
        {%- set default_schema = target.schema -%}
    {%- else -%}
        {%- set default_schema = var('schema_name', target.schema) -%}
    {%- endif -%}
    
    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}

{%- endmacro %}