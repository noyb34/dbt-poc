select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select episode_uid as from_field
    from "dev_db"."public"."manifestation"
    where episode_uid is not null
),

parent as (
    select uid as to_field
    from "dev_db"."public"."episode"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test