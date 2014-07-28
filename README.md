In search of the 10 most popular wikipedia pages by language.

Using HIVE to output the 10 most popular wikipedia pages by language.

####Infrastructure Deployment####

Use Jenkins to build an RPM (of the attached code) to lay down files onto a client/gateway server that sits in front of Hadoop.

Use Puppet or Chef to install the RPM.
<pre><code>package { “MostPopularWikipedia":    ensure => “latest"}</code></pre>

If job needs to run on a schedule to pull down each hour from Wikipedia, the job can be scheduled via oozie.

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

Generalize and parameterize all scripts.

