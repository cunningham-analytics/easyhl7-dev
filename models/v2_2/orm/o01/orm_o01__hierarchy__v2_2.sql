{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'orm_o01__segments__v2_2',
    'version': '2.2',
    'message_type': 'ORM_O01'
} %}

{{ easyhl7.apply_config(args) }}