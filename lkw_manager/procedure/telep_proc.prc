create or replace procedure telep_proc(p_telep_id number) is
cursor cur is
       select t.id,
              j.jarmu_tipus,
              j.rendszam,
              j.futott_km,
              j.teljesitmeny
       from telep t inner join jarmu j on t.id = j.telep_id
       where t.id = p_telep_id;

begin
  for i in cur
    loop
      dbms_output.put_line('Telep ID: ' || i.id || ', J�rm� t�pusa: ' || i.jarmu_tipus || 
      ', j�rm� rendsz�ma: ' || i.rendszam || ', Kil�m�ter�ra �ll�sa: '|| i.futott_km || ', Teljes�tm�nye(LE): ' || i.teljesitmeny);
    end loop;
end;
/
