{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'dft_p03__segments__v2_3_1',
    'version': '2.3.1',
    'message_type': 'DFT_P03'
} %}

{{ easyhl7.apply_config(args) }}
