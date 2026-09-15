{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'orm_o01_sample2__hierarchy',
    'version': '2.1',
    'message_type': 'ORM_O01',
    'group': 'ORDER'
} %}

{{ easyhl7.parse_group(args) }}