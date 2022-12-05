{% snapshot student_unit_enrolment %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='mqae',
      target_schema=new_schema,
      unique_key='skey_unit_enrolment',

      strategy='check',
      check_cols=['status', 'enrolment_status', 'mark'],
    )
}}

select * from mqae.{{ target.schema }}.dim_student_unit_enrolment

{% endsnapshot %}