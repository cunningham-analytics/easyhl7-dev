{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'orm_o01__hierarchy__v2_5',
    'version': '2.5',
    'message_type': 'ORM_O01',
    'group': 'ORDER_DETAIL_SEGMENT'
} %}

{{ easyhl7.parse_group(args) }}
