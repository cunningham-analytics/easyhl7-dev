{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'bar_p12__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'BAR_P12',
    'group': 'PROCEDURE'
} %}

{{ easyhl7.parse_group(args) }}
