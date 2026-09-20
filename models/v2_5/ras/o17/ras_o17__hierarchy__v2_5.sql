{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'ras_o17__segments__v2_5',
    'version': '2.5',
    'message_type': 'RAS_O17'
} %}

{{ easyhl7.apply_config(args) }}
