\c postgres
delete from airlinesonmain where id in (SELECT id FROM airlinesonmain WHERE id % 2 = 0);
\c fakegraydisk
delete from airlines where id in (SELECT id FROM airlines WHERE id % 2 = 0);