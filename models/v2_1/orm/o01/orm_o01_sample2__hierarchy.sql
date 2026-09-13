{{ config(materialized='table') }}

{% set args = {
    'segment_ref': 'orm_o01_sample2__segments',
    'version': '2.1',
    'message_type': 'ORM_O01',
    'config_override': orm_o01_sample2_config_override()
} %}

{{ easyhl7.apply_config(args) }}