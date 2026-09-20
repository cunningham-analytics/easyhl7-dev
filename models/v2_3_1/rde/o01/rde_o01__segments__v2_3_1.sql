{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'rde_o01_sample__v2_3_1',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
