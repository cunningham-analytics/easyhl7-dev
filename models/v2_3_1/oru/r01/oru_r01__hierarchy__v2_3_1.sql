{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'oru_r01__segments__v2_3_1',
    'version': '2.3.1',
    'message_type': 'ORU_R01'
} %}

{{ easyhl7.apply_config(args) }}