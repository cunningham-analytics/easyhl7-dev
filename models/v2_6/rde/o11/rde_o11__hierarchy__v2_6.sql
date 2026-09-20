{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'rde_o11__segments__v2_6',
    'version': '2.6',
    'message_type': 'RDE_O11'
} %}

{{ easyhl7.apply_config(args) }}
