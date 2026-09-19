{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'ras_o17__hierarchy__v2_5_1',
    'version': '2.5.1',
    'message_type': 'RAS_O17',
    'group': 'ORDER_DETAIL_SUPPLEMENT'
} %}

{{ easyhl7.parse_group(args) }}
