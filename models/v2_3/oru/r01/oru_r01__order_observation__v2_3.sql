{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'oru_r01__hierarchy__v2_3',
    'version': '2.3',
    'message_type': 'ORU_R01',
    'group': 'ORDER_OBSERVATION'
} %}

{{ easyhl7.parse_group(args) }}