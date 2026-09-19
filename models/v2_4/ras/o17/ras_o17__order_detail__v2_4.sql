{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'ras_o17__hierarchy__v2_4',
    'version': '2.4',
    'message_type': 'RAS_O17',
    'group': 'ORDER_DETAIL'
} %}

{{ easyhl7.parse_group(args) }}
