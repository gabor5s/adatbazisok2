create or replace procedure jarmu_telep_change(p_jarmu_id number,
                                               p_telep_id number) is
         
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
  
  update jarmu j set j.telep_id = p_telep_id where j.id = p_jarmu_id;
end;
/
