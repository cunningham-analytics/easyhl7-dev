{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'dft_p03__hierarchy__v2_4',
    'version': '2.4',
    'message_type': 'DFT_P03',
    'group': 'OBSERVATION'
} %}

{{ easyhl7.parse_group(args) }}
