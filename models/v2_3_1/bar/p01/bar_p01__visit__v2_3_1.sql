{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p01__hierarchy__v2_3_1',
    'version': '2.3.1',
    'message_type': 'BAR_P01',
    'group': 'VISIT'
} %}

{{ easyhl7.parse_group(args) }}
