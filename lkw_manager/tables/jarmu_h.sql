create table jarmu_h(
       id                        number,
       jarmu_tipus               varchar2(50),
       rendszam                  varchar2(6),
       vasarlasi_datum           date,
       forgalomba_helyezes       date,
       evjarat                   number,
       futott_km                 number,
       teherbiras                number,
       teljesitmeny              int,
       sofor_id                  number,
       telep_id                  number,
       last_mod                  timestamp(6),
       created                   timestamp(6),
       mod_user                  varchar2(300),
       dml_flag	                 varchar2(1),
       version	                 number
);
