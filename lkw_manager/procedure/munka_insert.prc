create or replace procedure munka_insert(p_id                 number,
                                         p_rakomany           varchar2,
                                         p_indulasi_hely      varchar2,
                                         p_erkezesi_hely      varchar2,
                                         p_indulasi_datum     date,
                                         p_erkezesi_datum     date,
                                         p_rakomany_suly      number,
                                         p_kamion_id          number,
                                         p_szerelveny_id      number,
                                         p_fuvarszervezo_id   number,
                                         p_tavolsag           number) is

begin
  insert into munka(id,
                    rakomany,
                    indulasi_hely,
                    erkezesi_hely,
                    indulasi_datum,
                    erkezesi_datum,
                    rakomany_suly,
                    kamion_id,
                    szerelveny_id,
                    fuvarszervezo_id,
                    tavolsag)
                    values(p_id,
                           p_rakomany,
                           p_indulasi_hely,
                           p_erkezesi_hely,
                           p_indulasi_datum,
                           p_erkezesi_datum,
                           p_rakomany_suly,
                           p_kamion_id,
                           p_szerelveny_id,
                           p_fuvarszervezo_id,
                           p_tavolsag);
end;
/
