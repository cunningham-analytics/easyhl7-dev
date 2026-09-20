{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'adt_a03__hierarchy__v2_4',
    'version': '2.4',
    'message_type': 'ADT_A03',
    'group': 'PROCEDURE'
} %}

{{ easyhl7.parse_group(args) }}
