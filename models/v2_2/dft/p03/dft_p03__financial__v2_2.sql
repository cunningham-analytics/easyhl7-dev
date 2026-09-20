{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'dft_p03__hierarchy__v2_2',
    'version': '2.2',
    'message_type': 'DFT_P03',
    'group': 'FINANCIAL'
} %}

{{ easyhl7.parse_group(args) }}
