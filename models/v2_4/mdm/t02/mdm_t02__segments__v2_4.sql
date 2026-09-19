{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'mdm_t02_sample__v2_4',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
