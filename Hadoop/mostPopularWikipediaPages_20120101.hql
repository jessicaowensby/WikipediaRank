------------------------------------
-- author: jessica.owensby@gmail.com
-- description: recreates the page_rank table
-- page_rank contains the list of the top 10 wikipedia pages for each language
-- based on non-unique page views 
-- 07.27.14
-------------------------------------
DROP TABLE IF EXISTS page_rank;

set hive.exec.parallel=true;
CREATE TABLE page_rank AS
SELECT language, 
page_name, 
rank
FROM (
SELECT 
page_name,
language, 
non_unique_views,
rank() over (PARTITION BY language ORDER BY non_unique_views DESC) as rank
FROM wikipedia.page_counts
WHERE Not(page_name RLIKE '.*Special:.*') AND
Not (page_name RLIKE '.*User:.*') AND
Not (page_name RLIKE '.*File:.*')
order by non_unique_views DESC
) A
WHERE rank <= 10
ORDER BY language, rank;
