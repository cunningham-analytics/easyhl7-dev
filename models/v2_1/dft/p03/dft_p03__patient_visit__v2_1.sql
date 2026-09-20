{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'dft_p03__hierarchy__v2_1',
    'version': '2.1',
    'message_type': 'DFT_P03',
    'group': 'PATIENT_VISIT'
} %}

{{ easyhl7.parse_group(args) }}
