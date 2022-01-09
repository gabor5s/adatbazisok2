create or replace procedure fuvar_dij(p_munka_id number) is
cursor cur is
       select j.jarmu_tipus,
              j.rendszam,
              m.rakomany,
              m.indulasi_hely,
              m.erkezesi_hely,
              (m.tavolsag * 25 * m.rakomany_suly) as dij
       from munka m inner join jarmu j on m.kamion_id = j.id
       where m.id = p_munka_id;

begin
  for i in cur
    loop
      dbms_output.put_line('Jármû típus: ' || i.jarmu_tipus || chr(10) || 
      'Rendszám: ' || i.rendszam || chr(10) || 
      'Indulási hely: ' || i.indulasi_hely || chr(10) || 
      'Érkezési hely: ' || i.erkezesi_hely || chr(10) || 
      'Rakomány: ' || i.rakomany || chr(10) ||
      'Fuvar díja: ' || i.dij || 'Ft');
    end loop;
end;
/
