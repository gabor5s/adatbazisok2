create or replace procedure telep_update(p_telep_id number,
                                         p_telepules varchar2,
                                         p_utca varchar2,
                                         p_hazszam number,
                                         p_iranyitoszam number) is

v_telep telep%rowtype;
begin
  begin
    select * into v_telep from telep t where t.id = p_telep_id;
    exception
      when no_data_found then
        raise_application_error(pkg_exception.gc_no_telep_found_exc_code, 'Nem talalhato ilyen id-ju telep.');
  end;
  
  if p_telepules is not null
    then
      v_telep.telepules := p_telepules;
      end if;
  
  if p_utca is not null
    then
      v_telep.utca := p_utca;
      end if;
  
  if p_hazszam is not null
    then
      v_telep.hazszam := p_hazszam;
      end if;
      
  if p_iranyitoszam is not null
    then
      v_telep.iranyitoszam := p_iranyitoszam;
      end if;
      
  update telep t set t.telepules = v_telep.telepules,
                     t.utca = v_telep.utca,
                     t.hazszam = v_telep.hazszam,
                     t.iranyitoszam = v_telep.iranyitoszam
                     where t.id = p_telep_id;
end;
/
