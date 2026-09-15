{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'oru_r01_sample__v2_3',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}