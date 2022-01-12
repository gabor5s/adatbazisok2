create or replace procedure jarmu_update(p_jarmu_id number,
                                         p_futott_km number,
                                         p_teherbiras number,
                                         p_teljesitmeny int) is
v_jarmu jarmu%rowtype;
begin
  begin
    select * into v_jarmu from jarmu j where j.id = p_jarmu_id;
    exception
      when no_data_found then
        raise_application_error(pkg_exception.gc_no_jarmu_found_exc_code, 'Nem talalhato ilyen id-ju jarmu.');
  end;
  
  if p_futott_km is not null
    then
      v_jarmu.futott_km := p_futott_km;
      end if;
  
  if p_teherbiras is not null
    then
      v_jarmu.teherbiras := p_teherbiras;
      end if;
      
  if p_teljesitmeny is not null
    then
      v_jarmu.teljesitmeny := p_teljesitmeny;
      end if;
      
  update jarmu j set j.futott_km = v_jarmu.futott_km,
                     j.teherbiras = v_jarmu.teherbiras,
                     j.teljesitmeny = v_jarmu.teljesitmeny
                     where j.id = p_jarmu_id;
end;
/
