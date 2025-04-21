ssh -J s368581@helios.cs.ifmo.ru:2222 -T postgres3@pg154 'bash lab3LogicErrorReserveUzel/makeADumpScript.bash && exit'
echo 'done'
psql -p 9130 -d postgres -f dumpScripts/postgres_data.sql
psql -p 9130 -d fakegraydisk -f dumpScripts/fakegraydisk_data.sql