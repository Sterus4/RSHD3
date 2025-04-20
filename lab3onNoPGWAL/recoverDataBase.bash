export PGDATA=$HOME/afl4
export newhgj96=$HOME/hgj96new
pg_ctl stop
sleep 3
mkdir $PGDATA/pg_wal
tar -xf reserve/pg_wal.tar -C $PGDATA/pg_wal/
sleep 3

pg_ctl start

# TODO Убрать ли sleep?
sleep 3
pg_ctl stop
sleep 3

mkdir $newhgj96
tar -xf reserve/16384.tar -C $newhgj96
rm $PGDATA/pg_tblspc/16384
ln -s $newhgj96 $PGDATA/pg_tblspc/16384
sleep 3
pg_ctl start
sleep 3
bash lab2/outAll.bash