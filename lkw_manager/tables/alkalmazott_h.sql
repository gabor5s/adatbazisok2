create table alkalmazott_h(
       id               number,
       vezeteknev       varchar2(20),
       keresztnev       varchar2(20),
       szuletesi_datum  date,
       lakhely          varchar2(30),
       beosztas         varchar2(30),
       telep_id         number,
       last_mod         timestamp(6),
       created          timestamp(6),
       mod_user         varchar2(300),
       dml_flag	        varchar2(1),
       version	        number
);
