{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'bar_p02__segments__v2_2',
    'version': '2.2',
    'message_type': 'BAR_P02'
} %}

{{ easyhl7.apply_config(args) }}
