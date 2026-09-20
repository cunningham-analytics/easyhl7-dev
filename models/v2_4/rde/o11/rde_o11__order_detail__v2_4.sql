{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'rde_o11__hierarchy__v2_4',
    'version': '2.4',
    'message_type': 'RDE_O11',
    'group': 'ORDER_DETAIL'
} %}

{{ easyhl7.parse_group(args) }}
