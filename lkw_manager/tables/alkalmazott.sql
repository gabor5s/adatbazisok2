create table alkalmazott(
       id               number   not null primary key,
       vezeteknev       varchar2(20) not null,
       keresztnev       varchar2(20) not null,
       szuletesi_datum  date,
       lakhely          varchar2(30),
       beosztas         varchar2(30) not null,
       telep_id         number not null,
       last_mod         timestamp(6),
       created          timestamp(6),
       mod_user         varchar2(300),
       dml_flag	        varchar2(1),
       version	        number
)
tablespace users;


