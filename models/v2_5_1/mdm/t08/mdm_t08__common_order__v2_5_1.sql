{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'mdm_t08__hierarchy__v2_5_1',
    'version': '2.5.1',
    'message_type': 'MDM_T08',
    'group': 'COMMON_ORDER'
} %}

{{ easyhl7.parse_group(args) }}
