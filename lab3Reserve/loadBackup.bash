export PGDATA=$HOME/afl4
export backupName=$(ls -t $HOME/reserve | head -n 1)
pg_ctl stop
rm -r $PGDATA
rm -r hgj96
mkdir -v $PGDATA
mkdir -v hgj96
tar -xf reserve/$backupName/base.tar -C $PGDATA
tar -xf reserve/$backupName/16384.tar -C hgj96/
tar -xf reserve/$backupName/pg_wal.tar -C afl4/pg_wal/
chmod 0750 $PGDATA

pg_ctl start
sleep 5
pg_ctl stop

rm $PGDATA/pg_tblspc/16384
ln -s $HOME/hgj96 $PGDATA/pg_tblspc/16384
pg_ctl start
bash lab3Reserve/outAll.bash