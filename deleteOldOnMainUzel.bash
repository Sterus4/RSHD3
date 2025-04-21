find $HOME/reserve -mindepth 1 -maxdepth 1 -type d -mtime +7 -exec rm -rf {} \;
#0 8,20 * * * 'bash /var/db/postgres1/deleteOldOnMainUzel.bash'
/var/db/postgres1/lab3Main/makeABackupOnMainUzel.bash