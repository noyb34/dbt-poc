select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select episode_id
from "dev_db"."public"."merged_episode"
where episode_id is null



      
    ) dbt_internal_test