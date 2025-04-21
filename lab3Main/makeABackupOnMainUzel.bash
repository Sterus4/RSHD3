#!/bin/bash
export newFileName=backup-$(date +%Y-%m-%d_%H-%M-%S)
export PGDATA=$HOME/afl4
mkdir $HOME/reserve
mkdir $HOME/reserve/$newFileName
pg_basebackup -p 9130 --checkpoint=fast -D $HOME/reserve/$newFileName -U postgres1 -Ft -P -v -T /var/db/postgres1/hgj96=/var/db/postgres3/hgj96
scp -r -J s368581@helios.cs.ifmo.ru:2222 $HOME/reserve/$newFileName postgres3@pg154:~/reserve
#rm -r $HOME/reserve