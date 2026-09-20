{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p01__hierarchy__v2_3',
    'version': '2.3',
    'message_type': 'BAR_P01',
    'group': 'PROCEDURE'
} %}

{{ easyhl7.parse_group(args) }}
