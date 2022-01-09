create or replace function sofor_kamion_tipus(kamion_sofor_id varchar2)
return varchar2 is

v_tipus varchar2(30);
begin
  begin
    select j.jarmu_tipus into v_tipus from alkalmazott a inner join jarmu j on a.id = j.sofor_id where a.id = kamion_sofor_id;
    exception
    when no_data_found then
      raise_application_error(pkg_exception.gc_no_data_found_exc_code, 'Nem található a sofõr id');
  end;
  
  return v_tipus;
end;
/
