{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'adt_a01__hierarchy__v2_4',
    'version': '2.4',
    'message_type': 'ADT_A01',
    'group': 'INSURANCE'
} %}

{{ easyhl7.parse_group(args) }}
