select
    id as student_course_admission_id,
    student_id,
    course_id,
    course_admission_status,
    status_effective_date,
    admission_year


from {{ source('mq','student_course_admission')}}