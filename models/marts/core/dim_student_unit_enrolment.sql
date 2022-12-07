with student_unit_enrolment as (
    select * from {{ ref('int_student_unit_enrolment')}}
),

final as (
    select
        skey_unit_enrolment,
        student_unit_enrolment_id,
        unit_code,
        unit_title,
        unit_credit_point,
        census_date,
        enrolment_status,
        fee_amount,
        unit_mark

    from student_unit_enrolment
)

select * from student_unit_enrolment