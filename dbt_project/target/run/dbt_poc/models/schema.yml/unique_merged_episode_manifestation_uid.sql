select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    manifestation_uid as unique_field,
    count(*) as n_records

from "dev_db"."public"."merged_episode"
where manifestation_uid is not null
group by manifestation_uid
having count(*) > 1



      
    ) dbt_internal_test