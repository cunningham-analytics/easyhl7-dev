{% macro orm_o01_sample2_config_override() %}

    {{ return({
        "ORDER": {
            "anchor": "OBR"
        }
    }) }}

{% endmacro %}