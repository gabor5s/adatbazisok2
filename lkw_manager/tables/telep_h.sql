create table telep_h(
       id                   number,
       jarmu_kapacitas      number,
       szerelveny_kapacitas number,
       telepules            varchar2(30),
       utca                 varchar2(30),
       hazszam              int,
       iranyitoszam         int,
       last_mod             timestamp(6),
       created              timestamp(6),
       mod_user             varchar2(300),
       dml_flag	            varchar2(1),
       version	            number
);
