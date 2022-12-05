{% snapshot student_course_admission %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='mqae',
      target_schema=new_schema,
      unique_key='skey_course_admisison',

      strategy='check',
      check_cols=['course_admission_status','status_effective_date'],
    )
}}

select * from mqae.{{ target.schema }}.dim_student_course_admission

{% endsnapshot %}