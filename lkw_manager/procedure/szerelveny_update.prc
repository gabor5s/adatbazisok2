create or replace procedure szerelveny_update(p_szerelveny_id number,
                                              p_futott_km number,
                                              p_rakomany_tipus varchar2) is

v_szerelveny szerelveny%rowtype;                                              
begin
  begin
    select * into v_szerelveny from szerelveny sz where sz.id = p_szerelveny_id;
    exception
      when no_data_found then
        raise_application_error(pkg_exception.gc_no_szerelveny_exc_code, 'Nem talalhato ilyen id-ju szerelveny.');
  end;
  
  if p_futott_km is not null
    then
      v_szerelveny.futott_km := p_futott_km;
      end if;
      
  if p_rakomany_tipus is not null
    then
      v_szerelveny.rakomany_tipus := p_rakomany_tipus;
      end if;
      
  update szerelveny sz set sz.futott_km = v_szerelveny.futott_km,
                           sz.rakomany_tipus = v_szerelveny.rakomany_tipus
                           where sz.id = p_szerelveny_id;
end;
/
