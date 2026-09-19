{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'adt_a03_sample__v2_5',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
