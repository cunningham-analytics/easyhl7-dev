{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'orm_o01__hierarchy__v2_4',
    'version': '2.4',
    'message_type': 'ORM_O01',
    'group': 'ORDER_DETAIL_SEGMENT'
} %}

{{ easyhl7.parse_group(args) }}
