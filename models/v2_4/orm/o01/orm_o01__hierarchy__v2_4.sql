{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'orm_o01__segments__v2_4',
    'version': '2.4',
    'message_type': 'ORM_O01'
} %}

{{ easyhl7.apply_config(args) }}
