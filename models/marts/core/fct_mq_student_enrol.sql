with student as (
    select * from {{ ref('dim_student')}}
),

student_course_admission as (
    select * from {{ ref('dim_student_course_admission') }}
),

student_unit_enrolment as (
    select * from {{ ref('dim_student_unit_enrolment') }}
),

final as (
    select
        s.student_id as student_key,
        c.student_course_admission_id as student_course_admission_key,
        u.student_unit_enrolment_id as student_unit_enrolment_key
    from student s

    join student_course_admission c
    on s.student_id=c.student_id
    
    join student_unit_enrolment u
    on c.student_course_admission_id=u.student_course_admission_id

)

select * from final