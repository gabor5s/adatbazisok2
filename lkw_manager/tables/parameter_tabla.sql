create table parameter_tabla(
       id                 number primary key,
       nev                varchar2(50),
       ertek              number,
       last_mod           timestamp(6),
       created            timestamp(6),
       mod_user           varchar2(300),
       dml_flag	          varchar2(1),
       version	          number
)
tablespace users;
