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
      dbms_output.put_line('Telep ID: ' || i.id || ', Jármû típusa: ' || i.jarmu_tipus || 
      ', jármû rendszáma: ' || i.rendszam || ', Kilóméteróra állása: '|| i.futott_km || ', Teljesítménye(LE): ' || i.teljesitmeny);
    end loop;
end;
/
