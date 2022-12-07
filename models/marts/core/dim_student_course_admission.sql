with student_course_admission as (
    select * from {{ ref('int_student_course_admission') }}
),

final as (
    select
        skey_course_admission,
        student_course_admission_id,
        course_code,
        course_title,
        course_admission_status,
        status_effective_date,
        admission_year

    from student_course_admission
)

select * from final