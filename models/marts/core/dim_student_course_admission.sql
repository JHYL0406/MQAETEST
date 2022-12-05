with student_course_admission as (
    select * from {{ ref('int_student_course_admission') }}
),

final as (
    select *

    from student_course_admission
)

select * from final