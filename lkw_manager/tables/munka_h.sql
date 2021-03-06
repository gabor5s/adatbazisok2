create table munka_h(
       id                 number,
       rakomany           varchar2(50),
       indulasi_hely      varchar2(30),
       erkezesi_hely      varchar2(30),
       indulasi_datum     date,
       erkezesi_datum     date,
       rakomany_suly      number,
       kamion_id          number,
       szerelveny_id      number,
       fuvarszervezo_id   number,
       tavolsag           number,
       last_mod           timestamp(6),
       created            timestamp(6),
       mod_user           varchar2(300),
       dml_flag	          varchar2(1),
       version	          number
);
