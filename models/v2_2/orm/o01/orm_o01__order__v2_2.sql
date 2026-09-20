{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'orm_o01__hierarchy__v2_2',
    'version': '2.2',
    'message_type': 'ORM_O01',
    'group': 'ORDER'
} %}

{{ easyhl7.parse_group(args) }}