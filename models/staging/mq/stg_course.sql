select 
    id AS course_id,
    course_code,
    course_title

from {{source('mq','course')}}