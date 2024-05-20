select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select manifestation_published_status
from "dev_db"."public"."merged_episode"
where manifestation_published_status is null



      
    ) dbt_internal_test