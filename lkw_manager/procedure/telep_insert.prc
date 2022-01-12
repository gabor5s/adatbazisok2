create or replace procedure telep_insert(p_id                   number,
                                         p_jarmu_kapacitas      number,
                                         p_szerelveny_kapacitas number,
                                         p_telepules            varchar2,
                                         p_utca                 varchar2,
                                         p_hazszam              int,
                                         p_iranyitoszam         int) is
                                         
begin
  insert into telep(id,
                    jarmu_kapacitas,
                    szerelveny_kapacitas,
                    telepules,
                    utca,
                    hazszam,
                    iranyitoszam)
                    values(p_id,
                           p_jarmu_kapacitas,
                           p_szerelveny_kapacitas,
                           p_telepules,
                           p_utca,
                           p_hazszam,
                           p_iranyitoszam);
end;
/
