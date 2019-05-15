create collation german (LOCALE = 'de_DE.UTF-8');

create user dvb_manage;
create user dvb_license;
create user dvb_license_ro;
create user pentaho;
create user group_manage_reader;
create role group_shipment_writer;

drop user dvb_pentaho;

drop tablespace tbs_dvb_manage;
drop tablespace tbs_dvb_license;
drop tablespace tbs_dvb_pentaho;

-- required by restore dvb_manage
create user amahdini;

/*CREATE TABLESPACE tbs_dvb_identity
  OWNER dvb_manage
  LOCATION '/Volumes/pgdata/tbls/identity';

CREATE DATABASE dvb_identity
WITH OWNER = dvb_manage
ENCODING = 'UTF8'
TABLESPACE = tbs_dvb_identity
LC_COLLATE = 'de_DE.UTF-8'
LC_CTYPE = 'de_DE.UTF-8'
CONNECTION LIMIT = -1
    TEMPLATE template0 ;

drop database dvb_identity;
drop tablespace tbs_dvb_identity;
*/
-- at dvb_identity need to create a table for base table of the dvb_manage.v_users

create schema if not exists dvb_identity;
alter schema dvb_identity owner to dvb_manage;

drop table if exists dvb_identity.mv_users;

create table dvb_identity.mv_users
(
    id integer
        constraint pk_mv_users
            primary key,
    urn                       varchar(1000),
    user_name                 varchar(60),
    created                   timestamp,
    description             varchar(255),
    name                    varchar(255),
    email                   varchar(100),
    firstname               varchar(60),
    gender                  varchar(5),
    lastname                varchar(60),
    organization_id         integer
);
alter table dvb_identity.mv_users
    owner to dvb_manage;
grant all on table dvb_identity.mv_users to dvb_manage;

create table dvb_manage.mng_supplier_price
(
    supplier_price_id  integer,
    package_license_id integer,
    valid_since        date,
    basic_price        real,
    price              real,
    currency_type_id   integer,
    status_type_id     integer,
    region_id          integer
);
alter table dvb_manage.mng_supplier_price owner to dvb_manage;
drop table dvb_manage.mng_supplier_price cascade;

create table dvb_manage.mng_frontend_media_version
(
    version_id            integer,
    library_id            integer,
    title_id              integer,
    media_version_type_id integer,
    publisher_name        varchar(100),
    small_cover_image     varchar(1000),
    large_cover_image     varchar(1000),
    sample_content        varchar(1000),
    status_date           date,
    status_type_id        integer,
    reference_id          integer
);
alter table dvb_manage.mng_frontend_media_version owner to dvb_manage;




create schema if not exists dvb_shipment;
alter schema dvb_shipment owner to dvb_manage;

create table dvb_shipment.shp_library_shipment
(
    shop_order_id integer,
    library_order_id integer
);
alter table dvb_shipment.shp_library_shipment owner to dvb_manage;


create table dvb_shipment.shp_library_shipment_item
(
    shop_order_item_id integer,
    library_order_item_id integer
);
alter table dvb_shipment.shp_library_shipment_item owner to dvb_manage;











create schema dvb_external_shop;
alter schema dvb_external_shop owner to dvb_manage;

create function dvb_external_shop.match_media_version2product4number_code()
    returns trigger
    language plpgsql
as
$$
BEGIN
    return new;
END
$$;

alter function dvb_external_shop.match_media_version2product4number_code() owner to dvb_manage;
drop procedure dvb_external_shop.match_media_version2product4number_code;



-- create materialized view dvb_manage.mv_product_current_customer_price
create table dvb_manage.mv_product_current_customer_price
(
    region_id integer,
    package_license_id integer,
    single_price_pretax real
);
alter table dvb_manage.mv_product_current_customer_price owner to dvb_manage;


CREATE TABLESPACE tbs_dvb_manage
    OWNER dvb_manage
    LOCATION '/Volumes/pgdata/tbls/manage';

CREATE TABLESPACE tbs_pentaho
    OWNER pentaho
    LOCATION '/Volumes/pgdata/tbls/pentaho';

CREATE TABLESPACE tbs_dvb_license
    OWNER dvb_license
    LOCATION '/Volumes/pgdata/tbls/license';



CREATE DATABASE dvb_manage
    WITH OWNER = dvb_manage
    ENCODING = 'UTF8'
    TABLESPACE = tbs_dvb_manage
    LC_COLLATE = 'de_DE.UTF-8'
    LC_CTYPE = 'de_DE.UTF-8'
    CONNECTION LIMIT = -1
    TEMPLATE template0 ;

CREATE DATABASE pentaho
    WITH OWNER = pentaho
    ENCODING = 'UTF8'
    TABLESPACE = tbs_pentaho
    LC_COLLATE = 'de_DE.UTF-8'
    LC_CTYPE = 'de_DE.UTF-8'
    CONNECTION LIMIT = -1
    TEMPLATE template0 ;

CREATE DATABASE dvb_license
    WITH OWNER = dvb_license
    ENCODING = 'UTF8'
    TABLESPACE = tbs_dvb_license
    LC_COLLATE = 'de_DE.UTF-8'
    LC_CTYPE = 'de_DE.UTF-8'
    CONNECTION LIMIT = -1
    TEMPLATE template0 ;


CREATE EXTENSION tablefunc
    SCHEMA public
    VERSION "1.0";

CREATE EXTENSION dblink;

