{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'rde_o11__hierarchy__v2_5_1',
    'version': '2.5.1',
    'message_type': 'RDE_O11',
    'group': 'TIMING_ENCODED'
} %}

{{ easyhl7.parse_group(args) }}
