
    
    

select
    uid; episode_uid as unique_field,
    count(*) as n_records

from "dev_db"."public"."merged_episode"
where uid; episode_uid is not null
group by uid; episode_uid
having count(*) > 1


