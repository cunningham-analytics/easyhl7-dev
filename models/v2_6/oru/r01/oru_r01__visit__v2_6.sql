{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'oru_r01__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'ORU_R01',
    'group': 'VISIT'
} %}

{{ easyhl7.parse_group(args) }}
