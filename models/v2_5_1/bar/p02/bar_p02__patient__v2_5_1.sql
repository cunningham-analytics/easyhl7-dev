{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p02__hierarchy__v2_5_1',
    'version': '2.5.1',
    'message_type': 'BAR_P02',
    'group': 'PATIENT'
} %}

{{ easyhl7.parse_group(args) }}
