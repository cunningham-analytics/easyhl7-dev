{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'dft_p03__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'DFT_P03',
    'group': 'FINANCIAL_COMMON_ORDER'
} %}

{{ easyhl7.parse_group(args) }}
