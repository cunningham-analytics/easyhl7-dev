{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'adt_a02__segments__v2_3_1',
    'version': '2.3.1',
    'message_type': 'ADT_A02'
} %}

{{ easyhl7.apply_config(args) }}
