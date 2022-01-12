create or replace procedure szerelveny_insert(p_id                         number,
                                              p_szerelveny_tipus           varchar2,
                                              p_rendszam                   varchar2,
                                              p_vasarlasi_datum            date,
                                              p_forgalomba_helyezes        date,
                                              p_evjarat                    number,
                                              p_futott_km                  number,
                                              p_teherbiras                 number,
                                              p_rakomany_tipus             varchar2) is

begin
  insert into szerelveny(id,
                         szerelveny_tipus,
                         rendszam,
                         vasarlasi_datum,
                         forgalomba_helyezes,
                         evjarat,
                         futott_km,
                         teherbiras,
                         rakomany_tipus)
                         values(p_id,
                                p_szerelveny_tipus,
                                p_rendszam,
                                p_vasarlasi_datum,
                                p_forgalomba_helyezes,
                                p_evjarat,
                                p_futott_km,
                                p_teherbiras,
                                p_rakomany_tipus);
end;
/
