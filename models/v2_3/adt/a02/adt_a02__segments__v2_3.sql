{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'adt_a02_sample__v2_3',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
