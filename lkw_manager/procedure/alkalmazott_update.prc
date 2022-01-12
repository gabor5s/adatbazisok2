create or replace procedure alkalmazott_update(p_alkalmazott_id number,
                                               p_vezeteknev varchar2,
                                               p_keresztnev varchar2,
                                               p_lakhely varchar2) is

v_alkalmazott alkalmazott%rowtype;
begin
  begin
    select * into v_alkalmazott from alkalmazott a where a.id = p_alkalmazott_id;
    exception
      when no_data_found then
        raise_application_error(pkg_exception.gc_no_person_found_exc_code, 'Nem talalhato ilyen id-jú alkalmazott.');
  end;
  
  if p_vezeteknev is not null
    then
      v_alkalmazott.vezeteknev := p_vezeteknev;
    end if;
  
  if p_keresztnev is not null
    then
      v_alkalmazott.keresztnev := p_keresztnev;
    end if;
  
  if p_lakhely is not null
    then
      v_alkalmazott.lakhely := p_lakhely;
    end if;
    
  update alkalmazott a set a.vezeteknev = v_alkalmazott.vezeteknev,
                           a.keresztnev = v_alkalmazott.keresztnev,
                           a.lakhely = v_alkalmazott.lakhely
                           where a.id = p_alkalmazott_id;
end;
/
