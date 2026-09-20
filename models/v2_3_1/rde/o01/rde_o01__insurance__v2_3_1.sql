{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'rde_o01__hierarchy__v2_3_1',
    'version': '2.3.1',
    'message_type': 'RDE_O01',
    'group': 'INSURANCE'
} %}

{{ easyhl7.parse_group(args) }}
