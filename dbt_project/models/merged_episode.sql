-- models/merged_episode.sql
with manifestation as (
    select * from {{ ref('manifestation') }}
    where is_deleted = FALSE
),
episode as (
    select * from {{ ref('episode') }}
    where is_deleted = FALSE
)

select
    e.uid,
    jsonb_build_object( -- Aggregate episode metadata into a JSONB object
        'title', e.title,
        'title19', e.title19,
        'titlelong', e.titlelong,
        'episode_number', e.episode_number,
        'distribution_number', e.distribution_number,
        'episodeclass', e.episodeclass,
        'entity_type', e.entity_type,
        'series_uid', e.series_uid,
        'season_uid', e.season_uid,
        'countryoforigin', e.countryoforigin,
        'primarygenre', e.primarygenre,
        'secondarygenre', e.secondarygenre,
        'keyword_mood', e.keyword_mood,
        'keyword_theme', e.keyword_theme,
        'keyword_setting', e.keyword_setting,
        'keyword_characters', e.keyword_characters,
        'keyword_subject', e.keyword_subject,
        'keyword_time_period', e.keyword_time_period,
        'keyword_general', e.keyword_general,
        'approximate_length', e.approximate_length,
        'eidrid', e.eidrid,
        'primary_language', e.primary_language,
        'secondary_language', e.secondary_language,
        'synopsisshort', e.synopsisshort,
        'synopsislong', e.synopsislong,
        'published_status', e.published_status,
        'release_date', e.release_date
    ) as episode,
    (select jsonb_agg(jsonb_build_object( -- Aggregate manifestation metadata into a JSONB array
        'title', m.title,
        'actual_length', m.actual_length,
        'edit_use', m.edit_use,
        'edit_class', m.edit_class,
        'video_ei', m.video_ei,
        'published_status', m.published_status,
        'video_hidef', m.video_hidef,
        'release_date', m.release_date
    )) from manifestation m where m.episode_uid = e.uid and m.title is not null) as manifestations -- Each element in the array is a JSONB object that contains the metadata for one manifestation
from
    episode e
group by
    e.uid, -- Group by episode uid to ensure one row per episode
    e.title,
    e.title19,
    e.titlelong,
    e.episode_number,
    e.distribution_number,
    e.episodeclass,
    e.entity_type,
    e.series_uid,
    e.season_uid,
    e.countryoforigin,
    e.primarygenre,
    e.secondarygenre,
    e.keyword_mood,
    e.keyword_theme,
    e.keyword_setting,
    e.keyword_characters,
    e.keyword_subject,
    e.keyword_time_period,
    e.keyword_general,
    e.approximate_length,
    e.eidrid,
    e.primary_language,
    e.secondary_language,
    e.synopsisshort,
    e.synopsislong,
    e.published_status,
    e.release_date



-- -- models/merged_episode.sql
-- with manifestation as (
--     select * from {{ ref('manifestation') }}
--     where is_deleted = FALSE
-- ),
-- episode as (
--     select * from {{ ref('episode') }}
--     where is_deleted = FALSE
-- )

-- select
--     e.*, -- Include all columns from episode
--     m.title as manifestation_title,
--     m.entity_type as manifestation_entity_type,
--     m.eidrid as manifestation_eidrid,
--     -- Exclude m.structuraltype as manifestation_structuraltype,
--     -- Exclue m.referenttype as manifestation_referenttype,
--     m.actual_length as manifestation_actual_length,
--     m.edit_use as manifestation_edit_use,
--     m.edit_class as manifestation_edit_class,
--     -- Exclude m.audio_closedcaption,
--     -- Exclude m.audio_type,
--     -- Exclude m.video_vchip,
--     m.video_ei as manifestation_video_ei,
--     m.published_status as manifestation_published_status,
--     -- m.deletedatetime as manifestation_deletedatetime,
--     -- m.is_deleted as manifestation_is_deleted,
--     -- m.title_old as manifestation_title_old,
--     -- m.title_old2 as manifestation_title_old2,
--     m.video_hidef as manifestation_video_hidef,
--     m.release_date as manifestation_release_date
-- from
--     episode e
-- left join
--     manifestation m
-- on
--     e.uid = m.episode_uid

