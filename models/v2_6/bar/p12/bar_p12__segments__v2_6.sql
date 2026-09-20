{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'bar_p12_sample__v2_6',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
