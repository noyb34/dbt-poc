select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select uid
from "dev_db"."public"."episode"
where uid is null



      
    ) dbt_internal_test