create table telep(
       id                   number not null primary key,
       jarmu_kapacitas      number not null,
       szerelveny_kapacitas number not null,
       telepules            varchar2(30),
       utca                 varchar2(30),
       hazszam              int,
       iranyitoszam         int,
       last_mod             timestamp(6),
       created              timestamp(6),
       mod_user             varchar2(300),
       dml_flag	            varchar2(1),
       version	            number
)
tablespace users;
