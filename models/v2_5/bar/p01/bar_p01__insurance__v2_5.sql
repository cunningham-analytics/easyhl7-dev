{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p01__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'BAR_P01',
    'group': 'INSURANCE'
} %}

{{ easyhl7.parse_group(args) }}
