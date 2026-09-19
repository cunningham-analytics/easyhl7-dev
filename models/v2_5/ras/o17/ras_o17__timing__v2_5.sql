{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'ras_o17__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'RAS_O17',
    'group': 'TIMING'
} %}

{{ easyhl7.parse_group(args) }}
