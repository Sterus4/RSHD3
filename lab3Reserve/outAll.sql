\db
\l+
\c postgres
\dt
select * from airlinesonmain;
\c fakegraydisk
set role sterus;
\dt
select * from airlines;