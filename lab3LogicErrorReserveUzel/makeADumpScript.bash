export PGDATA=$HOME/afl4
bash lab3Reserve/loadBackup.bash
rm -r $HOME/dumpScripts
mkdir $HOME/dumpScripts
pg_dump -p 9130 -U postgres1 -d postgres --data-only --inserts -f $HOME/dumpScripts/postgres_data.sql
pg_dump -p 9130 -U postgres1 -d fakegraydisk --data-only --inserts -f $HOME/dumpScripts/fakegraydisk_data.sql

scp -r -J s368581@helios.cs.ifmo.ru:2222 $HOME/dumpScripts postgres1@pg147:~/
rm -r $HOME/dumpScripts