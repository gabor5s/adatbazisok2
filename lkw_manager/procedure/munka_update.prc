create or replace procedure munka_update(p_munka_id number,
                                         p_indulasi_datum date,
                                         p_erkezesi_datum date) is
                                         
v_munka munka%rowtype;
begin
  begin
    select * into v_munka from munka m where m.id = p_munka_id;
    exception
      when no_data_found then
        raise_application_error(pkg_exception.gc_no_munka_found_exc_code, 'Nem talalhato ilyen id-ju munka.');
  end;
  
  if p_indulasi_datum is not null
    then
      v_munka.indulasi_datum := p_indulasi_datum;
      end if;
  
  if p_erkezesi_datum is not null
    then
      v_munka.erkezesi_datum := p_erkezesi_datum;
      end if;
  
  update munka m set m.indulasi_datum = v_munka.indulasi_datum,
                     m.erkezesi_datum = v_munka.erkezesi_datum
                     where m.id = p_munka_id; 
end;
/
