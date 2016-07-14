.mode csv
.output querydata.csv

select records.id,
records.age,
records.workclass_id,
case when wc.name is null then '?' else wc.name end as workclass,
records.education_level_id,
case when el.name is null then '?' else el.name end as education_level,
records.education_num,
records.marital_status_id,
case when ms.name is null then '?' else ms.name end as marital_status,
records.occupation_id,
case when occ.name is null then '?' else occ.name end as occupation,
records.relationship_id,
case when rel.name is null then '?' else rel.name end as relationship,
records.race_id,
case when races.name is null then '?' else races.name end as race,
records.sex_id,
case when s.name is null then '?' else s.name end as sex,
records.capital_gain,
records.capital_loss,
records.hours_week,
records.country_id,
case when c.name is null then '?' else c.name end as country,
records.over_50k
from records 
left outer join workclasses as wc 
    on wc.id = records.workclass_id
left outer join education_levels as el
    on el.id = records.education_level_id
left outer join marital_statuses as ms
    on ms.id = records.marital_status_id    
left outer join occupations as occ
    on occ.id = records.occupation_id
left outer join relationships as rel 
    on rel.id = records.relationship_id
left outer join races 
    on races.id = records.race_id
left outer join sexes as s
    on s.id = records.sex_id
left outer join countries as c 
    on c.id = records.country_id;

.output stdout
.exit

