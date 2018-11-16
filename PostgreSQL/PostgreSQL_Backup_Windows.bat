@echo off
REM - backup directory can be a file server share that the PgAgent windows service account has access to
set BACKUPDIR="D:\"
set PGHOST="DIN80005035"
set PGUSER="postgres"
set PGBIN="C:\Program Files\edb\as9.6\bin\"
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
 set dow=%%i
 set month=%%j
 set day=%%k
 set year=%%l
)
for /f "tokens=1-3 delims=: " %%i in ("%time%") do (
 set hh=%%i
 set nn=%%j
)

REM - It would be nice to use gzip in the pg_dumpall call (or if pg_dumpall supported compression as does the pg_dump)
REM here as we do on the linux/unix script
REM - but gzip is not prepackaged with windows so requires a separate install/download. 
REM Our favorite all purpose compression/uncompression util for Windows is 7Zip which does have a command-line
%PGBIN%pg_dumpall -h %PGHOST% -U %PGUSER% -f %BACKUPDIR%fullpgbackup-%year%%month%.sql 
%PGBIN%pg_dump -i -h %PGHOST% -U %PGUSER% -F c -b -v -f "%BACKUPDIR%db1-%year%%month%%day%%hh%.compressed" db1
%PGBIN%pg_dump -i -h %PGHOST% -U %PGUSER% -F c -b -v -f "%BACKUPDIR%db2-%year%%month%%day%%hh%.compressed" db2
