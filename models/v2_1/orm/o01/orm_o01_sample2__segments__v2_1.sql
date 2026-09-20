{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'orm_o01_sample2__v2_1',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}