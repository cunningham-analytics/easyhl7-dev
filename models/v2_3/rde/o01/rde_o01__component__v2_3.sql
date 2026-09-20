{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'rde_o01__hierarchy__v2_3',
    'version': '2.3',
    'message_type': 'RDE_O01',
    'group': 'COMPONENT'
} %}

{{ easyhl7.parse_group(args) }}
