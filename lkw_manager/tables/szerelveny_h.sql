create table szerelveny_h(
       id                         number,
       szerelveny_tipus           varchar2(50),
       rendszam                   varchar2(6),
       vasarlasi_datum            date,
       forgalomba_helyezes        date,
       evjarat                    number,
       futott_km                  number,
       teherbiras                 number,
       rakomany_tipus             varchar2(30),
       last_mod                   timestamp(6),
       created                    timestamp(6),
       mod_user                   varchar2(300),
       dml_flag	                  varchar2(1),
       version	                  number
);
