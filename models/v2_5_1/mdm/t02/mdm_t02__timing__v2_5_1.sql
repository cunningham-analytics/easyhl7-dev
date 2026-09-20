{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'mdm_t02__hierarchy__v2_5_1',
    'version': '2.5.1',
    'message_type': 'MDM_T02',
    'group': 'TIMING'
} %}

{{ easyhl7.parse_group(args) }}
