{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'ras_o17__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'RAS_O17',
    'group': 'ORDER_DETAIL'
} %}

{{ easyhl7.parse_group(args) }}
