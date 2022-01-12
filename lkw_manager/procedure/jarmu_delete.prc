create or replace procedure jarmu_delete(p_jarmu_id number) is

begin
  delete from jarmu j where j.id = p_jarmu_id;
end;
/
