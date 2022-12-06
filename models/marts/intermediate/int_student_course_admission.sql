with student_course_admission as (
    select * from {{ ref('stg_student_course_admission') }}
),

course as (
    select * from {{ ref('stg_course') }}
),

final as (
    select
        {{ dbt_utils.surrogate_key('student_course_admission_id') }} as skey_course_admission,
        student_course_admission.student_course_admission_id,
        student_course_admission.student_id,
        course.course_code,
        course.course_title,
        student_course_admission.course_admission_status,
        student_course_admission.status_effective_date,
        student_course_admission.admission_year


    from student_course_admission
    join course using (course_id)

)

select * from final