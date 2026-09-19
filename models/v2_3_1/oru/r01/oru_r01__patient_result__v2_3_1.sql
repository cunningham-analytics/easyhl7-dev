{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'oru_r01__hierarchy__v2_3_1',
    'version': '2.3.1',
    'message_type': 'ORU_R01',
    'group': 'PATIENT_RESULT'
} %}

{{ easyhl7.parse_group(args) }}
