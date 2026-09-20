{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'mdm_t02__segments__v2_6',
    'version': '2.6',
    'message_type': 'MDM_T02'
} %}

{{ easyhl7.apply_config(args) }}
