{{ config(materialized='table') }}

select
    p.msg_control_id,

    p.patient_seq,
    p.pid ->> '3' as patient_id,
    p.pid -> '5' ->> '1' as patient_last_name,
    p.pid -> '5' ->> '2' as patient_first_name,

    v.visit_seq,
    v.pv1 ->> '2' as patient_class,

    o.order_observation_seq,
    o.orc ->> '1' as order_control,
    o.orc ->> '2' as placer_order_number,

    o.obr ->> '2' as obr_placer_order_number,
    o.obr ->> '3' as filler_order_number,
    o.obr ->> '4' as test_code,

    obs.observation_seq,
    obs.obx ->> '2' as value_type,
    obs.obx -> '3' ->> '1' as observation_code,
    obs.obx -> '3' ->> '2' as observation_description,
    obs.obx ->> '5' as observation_value,
    obs.obx ->> '6' as units,
    obs.nte

from {{ ref('oru_r01__patient') }} p

left join {{ ref('oru_r01__visit') }} v
    on p.msg_control_id = v.msg_control_id
    and p.patient_seq = v.patient_seq

left join {{ ref('oru_r01__order_observation') }} o
    on p.msg_control_id = o.msg_control_id

left join {{ ref('oru_r01__observation') }} obs
    on o.msg_control_id = obs.msg_control_id
    and o.order_observation_seq = obs.order_observation_seq