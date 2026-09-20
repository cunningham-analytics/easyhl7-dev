{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'orm_o01__hierarchy__v2_1',
    'version': '2.1',
    'message_type': 'ORM_O01',
    'group': 'PATIENT'
} %}

{{ easyhl7.parse_group(args) }}