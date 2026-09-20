{{
    config(
        materialized='table'
    )
}}

{%
    set args = {
        'message_ref': 'oru_r01_sample__v2_1',
        'message_column': 'message'
    }
%}

{{ easyhl7.split_segments(args) }}