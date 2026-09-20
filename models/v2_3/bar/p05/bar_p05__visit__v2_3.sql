{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p05__hierarchy__v2_3',
    'version': '2.3',
    'message_type': 'BAR_P05',
    'group': 'VISIT'
} %}

{{ easyhl7.parse_group(args) }}
