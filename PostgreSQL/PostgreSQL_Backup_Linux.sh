#!/bin/bash
#backup directory can be a file server share that the PgAgent daemon account has access to
BACKUPDIR="/path/to/backup"
PGHOST="localhost"
PGUSER="postgres"
PGBIN="/usr/bin"
thedate=`date --date="today" +%Y%m%d%H`
themonth=`date --date="today" +%Y%m`

#create a full backup of the server databases
$PGBIN/pg_dumpall -h $PGHOST -U $PGUSER | gzip > $BACKUP_DIR/fullbackup-$themonth.sql.gz 

#put the names of the databases you want to create an individual backup below
dbs=(db1 db2 db3)
#iterate thru dbs in dbs array and backup each one
for db in ${dbs[@]}
do
	$PGBIN/pg_dump -i -h $PG_HOST -U $PGUSER -F c -b -v -f $BACKUPDIR/$db-$thedate.compressed $db
done

#this section deletes the previous month of same day backup except for the full server backup
rm -f $BACKUPDIR/*`date --date="last month" +%Y%m%d`*.compressed
