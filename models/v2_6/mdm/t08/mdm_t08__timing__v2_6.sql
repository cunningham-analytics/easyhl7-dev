{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'mdm_t08__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'MDM_T08',
    'group': 'TIMING'
} %}

{{ easyhl7.parse_group(args) }}
