\db
\l+
\c postgres
set role sterus;
\dt
select * from airlinesonmain;
\c fakegraydisk
set role sterus;
\dt
select * from airlines;