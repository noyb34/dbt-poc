select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    uid as unique_field,
    count(*) as n_records

from "dev_db"."public"."merged_episode"
where uid is not null
group by uid
having count(*) > 1



      
    ) dbt_internal_test