{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'orm_o01__segments',
    'version': '2.1',
    'message_type': 'ORM_O01'
} %}

{{ easyhl7.apply_config(args) }}