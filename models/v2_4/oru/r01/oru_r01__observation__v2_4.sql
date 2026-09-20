{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'oru_r01__hierarchy__v2_4',
    'version': '2.4',
    'message_type': 'ORU_R01',
    'group': 'OBSERVATION'
} %}

{{ easyhl7.parse_group(args) }}
