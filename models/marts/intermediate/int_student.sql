with student as (
    
    select *
    from {{ ref('stg_student') }}
),

final as (
    select
        {{ dbt_utils.surrogate_key( 'student_id' )}} as skey_student,
        student.*

    from student
)

select * from final