{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'mdm_t02__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'MDM_T02',
    'group': 'OBSERVATION'
} %}

{{ easyhl7.parse_group(args) }}
