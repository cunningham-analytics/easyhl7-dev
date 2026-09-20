{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'bar_p12__segments__v2_6',
    'version': '2.6',
    'message_type': 'BAR_P12'
} %}

{{ easyhl7.apply_config(args) }}
