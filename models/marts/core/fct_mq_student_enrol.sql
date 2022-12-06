with student as (
    select * from {{ ref('int_student')}}
),

student_course_admission as (
    select * from {{ ref('int_student_course_admission') }}
),

student_unit_enrolment as (
    select * from {{ ref('int_student_unit_enrolment') }}
),

final as (
    select
        s.skey_student as skey_student,
        c.skey_course_admission as skey_course_admission,
        u.skey_unit_enrolment as skey_unit_enrolment
    
    
    from student s
      join student_course_admission c
      on s.student_id=c.student_id
    
      join student_unit_enrolment u
      on c.student_course_admission_id=u.student_course_admission_id

)

select * from final
