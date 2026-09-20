{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'bar_p02_sample__v2_5_1',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
