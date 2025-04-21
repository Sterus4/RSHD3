find $HOME/reserve -mindepth 1 -maxdepth 1 -type d -mtime +30 -exec rm -rf {} \;
#0  8,20 * * * 'bash /var/db/postgres3/deleteOldOnReserveUzel.bash'
