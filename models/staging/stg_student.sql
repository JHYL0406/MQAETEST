WITH STUDENT AS (

    SELECT 
        ID AS student_id,
        first_name,
        last_name,
        email

    from MQAE.STUDENTDATA.STUDENT


)

SELECT * from STUDENT;