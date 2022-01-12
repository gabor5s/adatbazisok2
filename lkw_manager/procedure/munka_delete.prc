create or replace procedure munka_delete(p_munka_id number) is

begin
  delete from munka m where m.id = p_munka_id;
end;
/
