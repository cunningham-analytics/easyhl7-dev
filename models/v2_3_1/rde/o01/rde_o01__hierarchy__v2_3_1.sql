{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'rde_o01__segments__v2_3_1',
    'version': '2.3.1',
    'message_type': 'RDE_O01'
} %}

{{ easyhl7.apply_config(args) }}
