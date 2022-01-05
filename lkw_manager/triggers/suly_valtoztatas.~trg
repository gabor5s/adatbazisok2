create or replace trigger suly_valtoztatas
before update or insert on munka
for each row

declare
  v_max_suly number;
  
begin
  select sz.teherbiras into v_max_suly from szerelveny sz where sz.id = :new.szerelveny_id;  
  IF :new.rakomany_suly > v_max_suly
  THEN
    raise_application_error(pkg_exception.gc_cargo_too_heavy_exc_code, 'A megadott suly meghaladja a potkocsi teherbirasat!');
  END IF;
end;
/
