#!/usr/bin/env bash


sed -i '/de_DE.UTF-8/s/^#//' /etc/locale.gen
cat /etc/locale.gen | grep de_DE
docker ps
docker exec -it bix_postgresql_1 bash

mkdir /Volumens/pgdata/tbls/identity


/Applications/Postgres.app/Contents/Versions/11/bin/pg_restore -h localhost -p 5433 -W -s -v -c -d dvb_license -U dvb_license -O dvb_license_2019-05-09.backup
/Applications/Postgres.app/Contents/Versions/11/bin/pg_restore -h localhost -p 5433 -W -s -v -c -d dvb_manage -U dvb_manage -O dvb_manage_2019-05-09.backup
/Applications/Postgres.app/Contents/Versions/11/bin/pg_restore -h localhost -p 5433 -W -s -v -c -d pentaho -U pentaho -O dvb_pentaho_2019-05-08.backup

/Applications/Postgres.app/Contents/Versions/11/bin/pg_restore -h localhost -p 5433 -W -v -c -d dvb_license -U dvb_license -O dvb_license_2019-05-09.backup
/Applications/Postgres.app/Contents/Versions/11/bin/pg_restore -h localhost -p 5433 -W -v -c -d dvb_manage -U dvb_manage -O dvb_manage_2019-05-09.backup
/Applications/Postgres.app/Contents/Versions/11/bin/pg_restore -h localhost -p 5433 -W -v -c -d pentaho -U pentaho -O dvb_pentaho_2019-05-08.backup


export PATH=/Applications/Postgres.app/Contents/Versions/11/bin:$PATH