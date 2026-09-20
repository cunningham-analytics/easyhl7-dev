{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'dft_p03__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'DFT_P03',
    'group': 'FINANCIAL_PROCEDURE'
} %}

{{ easyhl7.parse_group(args) }}
