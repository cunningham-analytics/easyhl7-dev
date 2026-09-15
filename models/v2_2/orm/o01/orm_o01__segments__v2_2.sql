{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'orm_o01_sample__v2_2',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}