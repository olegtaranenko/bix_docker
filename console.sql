create collation german (LOCALE = 'de_DE.utf8');

create user dvb_manage;
create user dvb_license;
create user dvb_pentaho;

CREATE TABLESPACE tbs_dvb_manage
  OWNER dvb_manage
  LOCATION '/var/lib/postgresql/data/tbs/manage';

CREATE TABLESPACE tbs_dvb_pentaho
  OWNER dvb_pentaho
  LOCATION '/var/lib/postgresql/data/tbs/pentaho';

CREATE TABLESPACE tbs_dvb_license
  OWNER dvb_license
  LOCATION '/var/lib/postgresql/data/tbs/license';

CREATE DATABASE dvb_manage
WITH OWNER = dvb_manage
ENCODING = 'UTF8'
TABLESPACE = tbs_dvb_manage
-- LC_COLLATE = 'de_DE.UTF-8'
-- LC_CTYPE = 'de_DE.UTF-8'
CONNECTION LIMIT = -1;