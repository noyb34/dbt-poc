
    
    

select
    episode_id as unique_field,
    count(*) as n_records

from "dev_db"."public"."merged_episode"
where episode_id is not null
group by episode_id
having count(*) > 1


