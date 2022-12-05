SELECT
    id as student_unit_enrolment_id,
    student_course_admission_id,
    unit_id,
    enrolment_date as census_date,
    enrolment_status,
    fee_amount,
    unit_mark


FROM {{ source('mq','student_unit_enrolment')}}

