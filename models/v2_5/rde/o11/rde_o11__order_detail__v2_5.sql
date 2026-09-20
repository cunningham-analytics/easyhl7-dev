{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'rde_o11__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'RDE_O11',
    'group': 'ORDER_DETAIL'
} %}

{{ easyhl7.parse_group(args) }}
