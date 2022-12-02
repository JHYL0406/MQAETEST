select
    id as unit_id,
    unit_code,
    unit_title,
    unit_credit_point

from {{source('mq','unit')}}