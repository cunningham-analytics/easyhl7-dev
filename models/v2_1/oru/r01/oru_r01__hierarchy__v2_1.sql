{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'oru_r01__segments',
    'version': '2.1',
    'message_type': 'ORU_R01'
} %}

{{ easyhl7.apply_config(args) }}