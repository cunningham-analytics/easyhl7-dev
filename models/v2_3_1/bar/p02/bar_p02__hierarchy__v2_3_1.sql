{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'bar_p02__segments__v2_3_1',
    'version': '2.3.1',
    'message_type': 'BAR_P02'
} %}

{{ easyhl7.apply_config(args) }}
