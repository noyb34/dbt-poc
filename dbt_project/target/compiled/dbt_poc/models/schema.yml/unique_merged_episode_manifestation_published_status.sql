
    
    

select
    manifestation_published_status as unique_field,
    count(*) as n_records

from "dev_db"."public"."merged_episode"
where manifestation_published_status is not null
group by manifestation_published_status
having count(*) > 1


