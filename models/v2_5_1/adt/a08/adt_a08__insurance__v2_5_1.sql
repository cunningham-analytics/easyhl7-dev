{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'adt_a08__hierarchy__v2_5_1',
    'version': '2.5.1',
    'message_type': 'ADT_A08',
    'group': 'INSURANCE'
} %}

{{ easyhl7.parse_group(args) }}
