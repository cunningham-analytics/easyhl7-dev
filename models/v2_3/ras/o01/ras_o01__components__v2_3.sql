{{ config(materialized='table') }}

{% set args = {
    'hierarchy_ref': 'ras_o01__hierarchy__v2_3',
    'version': '2.3',
    'message_type': 'RAS_O01',
    'group': 'COMPONENTS'
} %}

{{ easyhl7.parse_group(args) }}
