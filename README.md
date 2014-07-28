In search of the 10 most popular wikipedia pages by language.

Using HIVE to output the 10 most popular wikipedia pages by language.

####Infrastructure Deployment####

Use Jenkins to build an RPM (of the attached code) to lay down files onto a client/gateway server that sits in front of Hadoop.  All paths are relative, but could be parameterized or absolute for the RPM install.

Use Puppet or Chef to install the RPM.
<pre><code>package { “MostPopularWikipedia":    ensure => “latest"}</code></pre>

The RPM will call the initWikipediaPages.sh script upon installation.
<pre>
<code>
./Hadoop/initWikipediaPages.sh
</code>
</pre>

If job needs to run on a schedule to pull down each hour from Wikipedia, the job can be scheduled via oozie.
Users can run the load job manually by executing the loadWikipediaPages.sh script from the project's root directory (cd WikipediaRank). 

<pre>
<code>
./Hadoop/loadWikipediaPages.sh
</code>
</pre>

Once the job has completed, the rank data will be available in HIVE in the wikipedia database in the page_rank table.

<pre>
<code>
select * from wikipedia.page_rank where lanaguage = 'en';
</code>
</pre>

####Design Enhancements####

There will be approximately be ~5TB of compressed wikipedia data for 8 Years of data to date.  If we can assume that the data will always be accessed by date, then we can partition the hive table by hour or date.

Gz is _not_ splitable. As an improvement, not implemented in this code, we should load the files as sequence (or ORC, depending on the version of Hadoop) files to allow Hadoop to assign multiple mappers to read the page_counts data.
<pre>
<code>
--CREATE TABLE IF NOT EXISTS page_counts_sequence(
--language STRING,
--page_name STRING,
--non_unique_views INT,
--bytes_transferred INT)
--STORED AS SEQUENCEFILE;
--LOAD DATA LOCAL INPATH 'pagecounts-20120101-000000.gz' INTO TABLE page_counts;
--SET hive.exec.compress.output=true;
--SET io.seqfile.compression.type=BLOCK;
--INSERT OVERWRITE TABLE page_counts_sequence SELECT * FROM page_counts;
</code>
</pre>

Build out the Beetest test suite to unit test pre-canned data.

Generalize and parameterize all scripts.
# Date: year, month, day, hour
# database
# table name

HIVE performance tuning needed.

Alternatively, call HIVE via JDBC.  This would allow for use of increased code reuse and workflow orchestration, as well as, the ability to dynamically generate more complex pieces of SQL using templating frameworks.

