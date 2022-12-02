with student_unit_enrolment as (
    select * from {{ ref('stg_student_unit_enrolment')}}
),

unit as (
    select * from {{ ref('stg_unit')}}
),

final as (
    select
       student_unit_enrolment.student_unit_id,
       student_unit_enrolment.student_course_admission_id,
       unit.unit_code,
       unit.unit_title,
       unit.unit_credit_point,
       student_unit_enrolment.enrolment_date,
       student_unit_enrolment.enrolment_status,
       student_unit_enrolment.fee_amount,
       student_unit_enrolment.unit_mark

    from student_unit_enrolment
    
    join unit using (unit_id)

    where student_unit_enrolment.enrolment_status != 'Planned'
)

select * from final