select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select release_date
from "dev_db"."public"."merged_episode"
where release_date is null



      
    ) dbt_internal_test