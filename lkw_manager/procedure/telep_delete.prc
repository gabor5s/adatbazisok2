create or replace procedure telep_delete(p_telep_id number) is

begin
  delete from telep t where t.id = p_telep_id;
end;
/
