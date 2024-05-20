-- tests/merged_episode_test.sql https://docs.getdbt.com/docs/build/unit-tests
-- tests/merged_episode_test.sql
{% test not_null_episode_id(model) %}
SELECT uid, COUNT(*)
FROM {{ ref('episode') }}
GROUP BY uid
HAVING COUNT(*) > 1;
{% endtest %}
-- -- Test for unique combination of episode_id and manifestation_eidrid
-- {% test unique_episode_manifestation_combination(model) %}
-- select episode_uid, manifestation_eidrid, count(*) as count
-- from {{ model }}
-- group by episode_uid, manifestation_eidrid
-- having count(*) > 1
-- {% endtest %}

-- Test for non-null values in episode_id column
-- {% test not_null_episode_id(model) %}
-- {{ config(model='merged_episode') }}
-- select *
-- from {{ model }}
-- where episode_uid is null
-- {% endtest %}

-- -- Test for non-null values in manifestation_eidrid column
-- {% test not_null_manifestation_eidrid(model) %}
-- {{ config(model='merged_episode') }}
-- select *
-- from {{ model }}
-- where manifestation_eidrid is null
-- {% endtest %}

-- -- Test for referential integrity with manifestation table
-- {{ config(model='merged_episode') }}
-- {% test manifestation_referential_integrity(model) %}
-- select me.*
-- from {{ model }} me
-- left join {{ ref('manifestation') }} m on me.manifestation_eidrid = m.eidrid
-- where m.eidrid is null
-- {% endtest %}

-- Test for referential integrity with episode table
-- {{ config(model='merged_episode') }}
-- {% test episode_referential_integrity(model) %}
-- select me.*
-- from {{ model }} me
-- left join {{ ref('episode') }} e on me.episode_uid = e.uid
-- where e.uid is null
-- {% endtest %}


-- tests/test_uid_match.sql
-- {{ config(model='merged_episode') }}
-- {% test uid_match(model) %}
-- select *
-- from {{ ref('merged_episode') }}
-- where uid != episode_uid
-- {% endtest %}


