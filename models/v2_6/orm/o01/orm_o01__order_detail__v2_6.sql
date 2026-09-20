{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'orm_o01__hierarchy__v2_6',
    'version': '2.6',
    'message_type': 'ORM_O01',
    'group': 'ORDER_DETAIL'
} %}

{{ easyhl7.parse_group(args) }}
