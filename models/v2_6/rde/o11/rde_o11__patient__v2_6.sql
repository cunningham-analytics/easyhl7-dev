{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'rde_o11__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'RDE_O11',
    'group': 'PATIENT'
} %}

{{ easyhl7.parse_group(args) }}
