{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p01__hierarchy__v2_2',
    'version': '2.2',
    'message_type': 'BAR_P01',
    'group': 'INSURANCE'
} %}

{{ easyhl7.parse_group(args) }}
