{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'bar_p05_sample__v2_5',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
