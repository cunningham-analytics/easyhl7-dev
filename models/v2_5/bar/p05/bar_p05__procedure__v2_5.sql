{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p05__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'BAR_P05',
    'group': 'PROCEDURE'
} %}

{{ easyhl7.parse_group(args) }}
