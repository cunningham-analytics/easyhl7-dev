{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'adt_a03__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'ADT_A03',
    'group': 'INSURANCE'
} %}

{{ easyhl7.parse_group(args) }}
