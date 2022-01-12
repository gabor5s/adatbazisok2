create or replace procedure jarmu_insert(p_id                        number,
                                         p_jarmu_tipus               varchar2,
                                         p_rendszam                  varchar2,
                                         p_vasarlasi_datum           date,
                                         p_forgalomba_helyezes       date,
                                         p_evjarat                   number,
                                         p_futott_km                 number,
                                         p_teherbiras                number,
                                         p_teljesitmeny              int,
                                         p_sofor_id                  number,
                                         p_telep_id                  number) is

v_kapacitas number;
v_kamion_darab number;

begin
  SELECT t.jarmu_kapacitas
    INTO v_kapacitas
    FROM telep t
   WHERE t.id = p_telep_id;
   
  SELECT COUNT(*)
    INTO v_kamion_darab
    FROM jarmu j
   WHERE j.telep_id = p_telep_id;
   
  IF v_kamion_darab >= v_kapacitas
  THEN
    raise_application_error(pkg_exception.gc_no_capacity_exc_code,
                            'Nincs tobb hely a telepen.');
  END IF;

  insert into jarmu(id,
                    jarmu_tipus,
                    rendszam,
                    vasarlasi_datum,
                    forgalomba_helyezes,
                    evjarat,
                    futott_km,
                    teherbiras,
                    teljesitmeny,
                    sofor_id,
                    telep_id)
                    values(p_id,                        
                           p_jarmu_tipus,               
                           p_rendszam,                  
                           p_vasarlasi_datum,           
                           p_forgalomba_helyezes,       
                           p_evjarat,                   
                           p_futott_km,                 
                           p_teherbiras,                
                           p_teljesitmeny,              
                           p_sofor_id,                  
                           p_telep_id);                  
end;
/
