export PGDATA=$HOME/afl4
pg_ctl stop
rm -r $PGDATA
mkdir -v $PGDATA
mkdir -v hgj96
tar -xf reserve/base.tar -C $PGDATA
tar -xf reserve/16384.tar -C hgj96/
tar -xf reserve/pg_wal.tar -C afl4/pg_wal/
chmod 0750 $PGDATA

pg_ctl start
sleep 5
pg_ctl stop

rm $PGDATA/pg_tblspc/16384
ln -s $HOME/hgj96 $PGDATA/pg_tblspc/16384
pg_ctl start
./lab3Reserve/outAll.bash