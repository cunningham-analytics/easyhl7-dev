{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'mdm_t02__segments__v2_3',
    'version': '2.3',
    'message_type': 'MDM_T02'
} %}

{{ easyhl7.apply_config(args) }}
