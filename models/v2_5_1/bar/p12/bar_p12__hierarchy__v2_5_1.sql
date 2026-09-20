{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'bar_p12__segments__v2_5_1',
    'version': '2.5.1',
    'message_type': 'BAR_P12'
} %}

{{ easyhl7.apply_config(args) }}
