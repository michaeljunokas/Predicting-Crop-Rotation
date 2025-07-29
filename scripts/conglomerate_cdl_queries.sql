select ct.*, f.value as "2014", f.geoid, co.stasd, co.stusps, co.name from crosstab(
        'select distinct on (gid, year) gid, year, value
        from cdl_fields_all_crops_history
        order by gid asc, year asc, pixel_count desc nulls last, value asc'
    ) as ct ("gid" int, "2008" int, "2009" int, "2010" int, "2011" int, "2012" int, "2013" int, "2014" int, "2015" int, "2016" int, "2017" int, "2018" int)
    join cdl_fields_all_crops f on (f.gid = ct.gid) join conus_counties co on (co.geoid = f.geoid)
    where f.calcacres >= 10 and f.pa_ratio <= 100

-- we have back to 2008 but there seems to be an odd memory thing when
-- pulling this much data (?)

select ct.*, f.value as "2014", co.stasd from crosstab(
        'select distinct on (gid, year) gid, year, value
        from cdl_fields_all_crops_history
        order by gid asc, year asc, pixel_count desc nulls last, value asc'
    ) as ct ("gid" int, "2012" int, "2013" int, "2014" int, "2015" int, "2016" int, "2017" int, "2018" int, "2019" int, "2020" int, "2021" int)
    join cdl_fields_all_crops f on (f.gid = ct.gid) join conus_counties co on (co.geoid = f.geoid)
    where f.calcacres >= 10 and f.pa_ratio <= 100
