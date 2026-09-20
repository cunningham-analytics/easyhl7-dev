{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'adt_a08__segments__v2_4',
    'version': '2.4',
    'message_type': 'ADT_A08'
} %}

{{ easyhl7.apply_config(args) }}
