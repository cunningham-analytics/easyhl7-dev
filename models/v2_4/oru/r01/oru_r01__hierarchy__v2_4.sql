{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'oru_r01__segments__v2_4',
    'version': '2.4',
    'message_type': 'ORU_R01'
} %}

{{ easyhl7.apply_config(args) }}
