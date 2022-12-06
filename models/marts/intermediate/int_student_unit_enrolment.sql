with student_unit_enrolment as (
    select * from {{ ref('stg_student_unit_enrolment')}}
),

unit as (
    select * from {{ ref('stg_unit')}}
),

final as (
    select
       {{ dbt_utils.surrogate_key('student_unit_enrolment_id') }} as skey_unit_enrolment,
       student_unit_enrolment.student_unit_enrolment_id,
       student_unit_enrolment.student_course_admission_id,
       unit.unit_code,
       unit.unit_title,
       unit.unit_credit_point,
       student_unit_enrolment.census_date,

       case
        when student_unit_enrolment.enrolment_status = 'Passed' 
            and student_unit_enrolment.census_date = '1900-01-01' 
            and student_unit_enrolment.unit_mark = '0'
            then 'Exempt'
        when student_unit_enrolment.enrolment_status = 'Passed'
            and student_unit_enrolment.census_date = '1900-01-01'
            and student_unit_enrolment.unit_mark != '0'
            then 'Designated'
        else student_unit_enrolment.enrolment_status
       end as enrolment_status,
       
       student_unit_enrolment.fee_amount,
       student_unit_enrolment.unit_mark

    from student_unit_enrolment
    
    join unit using (unit_id)

    where student_unit_enrolment.enrolment_status != 'Planned'
)

select * from final