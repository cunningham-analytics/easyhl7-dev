{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'oru_r01__hierarchy',
    'version': '2.1',
    'message_type': 'ORU_R01',
    'group': 'PATIENT'
} %}

{{ easyhl7.parse_group(args) }}