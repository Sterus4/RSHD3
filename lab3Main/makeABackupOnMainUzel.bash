#!/bin/bash
export PGDATA=$HOME/afl4
mkdir $HOME/reserve
pg_basebackup -p 9130 --checkpoint=fast -D $HOME/reserve -U postgres1 -Ft -P -v -T /var/db/postgres1/hgj96=/var/db/postgres3/hgj96
scp -r -J s368581@helios.cs.ifmo.ru:2222 $HOME/reserve postgres3@pg154:~/
#rm -r $HOME/reserve