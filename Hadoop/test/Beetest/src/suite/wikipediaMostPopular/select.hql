SELECT language, page_name, rank
FROM (
SELECT
page_name,
language,
non_unique_views,
rank() over (PARTITION BY language ORDER BY non_unique_views DESC) as rank
FROM pc_test
WHERE Not(page_name RLIKE '.*Special:.*') AND
Not (page_name RLIKE '.*User:.*') AND
Not (page_name RLIKE '.*File:.*')
order by non_unique_views DESC
) A
WHERE rank < 10
ORDER BY language, rank;
