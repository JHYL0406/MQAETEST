select 
    id AS student_id,
    first_name,
    last_name,
    email

from {{ source('mq','student') }}
