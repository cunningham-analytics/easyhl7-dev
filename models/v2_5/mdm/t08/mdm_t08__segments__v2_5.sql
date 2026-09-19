{{ config(materialized='table') }}

{% set args = {
    'message_ref': 'mdm_t08_sample__v2_5',
    'message_column': 'message'
} %}

{{ easyhl7.split_segments(args) }}
