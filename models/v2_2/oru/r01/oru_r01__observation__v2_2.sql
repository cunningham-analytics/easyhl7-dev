{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'oru_r01__hierarchy__v2_2',
    'version': '2.2',
    'message_type': 'ORU_R01',
    'group': 'OBSERVATION'
} %}

{{ easyhl7.parse_group(args) }}