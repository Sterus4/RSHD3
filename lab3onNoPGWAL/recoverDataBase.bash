export PGDATA=$HOME/afl4
export newhgj96=$HOME/hgj96new
export backupName=$(ls -t $HOME/reserve | head -n 1)
pg_ctl stop
sleep 2
mkdir $PGDATA/pg_wal
rm -r newhgj96
tar -xf reserve/$backupName/pg_wal.tar -C $PGDATA/pg_wal/
sleep 2

pg_ctl start

# TODO Убрать ли sleep?
sleep 2
pg_ctl stop
sleep 2

mkdir $newhgj96
tar -xf reserve/$backupName/16384.tar -C $newhgj96
rm $PGDATA/pg_tblspc/16384
ln -s $newhgj96 $PGDATA/pg_tblspc/16384
sleep 2
pg_ctl start
sleep 2
bash lab2/outAll.bash