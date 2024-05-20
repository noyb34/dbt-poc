
    
    

with child as (
    select uid as from_field
    from "dev_db"."public"."merged_episode"
    where uid is not null
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


