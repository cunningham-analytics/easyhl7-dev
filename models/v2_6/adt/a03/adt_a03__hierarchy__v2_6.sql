{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'adt_a03__segments__v2_6',
    'version': '2.6',
    'message_type': 'ADT_A03'
} %}

{{ easyhl7.apply_config(args) }}
