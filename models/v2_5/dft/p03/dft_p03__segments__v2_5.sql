{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'dft_p03_sample__v2_5',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
