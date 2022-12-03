with student_unit_enrolment as (
    select * from {{ ref('int_student_unit_enrolment')}}
),

final as (
    select *


    from student_unit_enrolment
)

select * from student_unit_enrolment