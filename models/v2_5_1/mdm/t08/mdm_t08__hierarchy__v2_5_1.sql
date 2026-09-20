{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'mdm_t08__segments__v2_5_1',
    'version': '2.5.1',
    'message_type': 'MDM_T08'
} %}

{{ easyhl7.apply_config(args) }}
