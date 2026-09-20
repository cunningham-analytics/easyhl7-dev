{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p05__hierarchy__v2_5_1',
    'version': '2.5.1',
    'message_type': 'BAR_P05',
    'group': 'VISIT'
} %}

{{ easyhl7.parse_group(args) }}
