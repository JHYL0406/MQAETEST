SELECT
    id as student_unit_id,
    student_course_admission_id,
    unit_id,
    enrolment_date,
    enrolment_status,
    fee_amount,
    unit_mark


FROM {{ source('mq','student_unit_enrolment')}}
