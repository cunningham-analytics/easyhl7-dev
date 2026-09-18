{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'dft_p03__hierarchy__v2_3',
    'version': '2.3',
    'message_type': 'DFT_P03',
    'group': 'FINANCIAL'
} %}

{{ easyhl7.parse_group(args) }}
