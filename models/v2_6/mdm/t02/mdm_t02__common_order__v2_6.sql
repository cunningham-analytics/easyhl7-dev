{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'mdm_t02__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'MDM_T02',
    'group': 'COMMON_ORDER'
} %}

{{ easyhl7.parse_group(args) }}
