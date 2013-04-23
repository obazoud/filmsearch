select
    t.id,
    t.title,
    t.production_year,
    ln.info as language,
    cn.info as country,
    array_agg(distinct(dr_n.name)) as directors,
    array_agg(distinct(coalesce(am_n.name, af_n.name))) as cast,
    array_agg(distinct(lc.info)) as locations
from title as t
left join movie_info as ln on ln.movie_id = t.id and ln.info_type_id = 4
left join movie_info as cn on cn.movie_id = t.id and cn.info_type_id = 8
left join movie_info as lc on lc.movie_id = t.id and lc.info_type_id = 18 and lc.note is null
join cast_info as dr on dr.movie_id = t.id and dr.role_id = 8
left join cast_info as am on am.movie_id = t.id and am.role_id = 1 and am.nr_order <= 10
left join cast_info as af on af.movie_id = t.id and af.role_id = 2 and af.nr_order <= 10
join name as dr_n on dr_n.id = dr.person_id
left join name as am_n on am_n.id = am.person_id
left join name as af_n on af_n.id = af.person_id
where t.kind_id = 1
and t.title = 'Brazil'
and t.production_year = 1985
group by
    t.id,
    t.title,
    t.production_year,
    ln.info,
    cn.info;
