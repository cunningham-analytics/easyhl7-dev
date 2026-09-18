{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'adt_a01__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'ADT_A01',
    'group': 'PROCEDURE'
} %}

{{ easyhl7.parse_group(args) }}
