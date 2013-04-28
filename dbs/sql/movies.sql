select
    t.id,
    t.title,
    t.production_year,
    ln.info as language,
    cn.info as country,
    (
        select array_agg(n.name)
        from cast_info as dr
        join name as n on n.id = dr.person_id
        where dr.movie_id = t.id
        and dr.role_id = 8
    ) as directors,
    (
        select array_agg(n.name)
        from cast_info as ac
        join name as n on n.id = ac.person_id
        where ac.movie_id = t.id
        and ac.role_id in (1, 2)
        and ac.nr_order <= 10
    ) as cast/*,
    (
        select array_agg(lc.info)
        from movie_info as lc
        where lc.movie_id = t.id
        and lc.info_type_id = 18
        and lc.note is null
    ) as locations,
    (
        select array_agg(k.keyword)
        from  movie_keyword as mk
        join keyword as k on k.id = mk.id
        where mk.movie_id = t.id
    ) as keywords*/
from title as t
join movie_info as ln on ln.movie_id = t.id and ln.info_type_id = 4
join movie_info as cn on cn.movie_id = t.id and cn.info_type_id = 8
where t.kind_id = 1;
