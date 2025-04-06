export PGDATA=$HOME/afl4
export LC_ALL=ru_RU.UTF-8
mkdir $HOME/hmo85
mkdir $HOME/hgj96
initdb
cp lab2/pg_hba.conf $PGDATA
cp lab2/pg_ident.conf $PGDATA
cp lab2/postgresql.conf $PGDATA