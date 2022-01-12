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

type fuvar_dij_list is table of ty_fuvar_dij;
fuvar_dij ty_fuvar_dij;
begin
  for i in cur
    loop
      fuvar_dij_list.extend(1);
      fuvar_dij_list(fuvar_dij_list.count) := ty_fuvar_dij(jarmu_tipus   => i.jarmu_tipus,
                                                           rendszam      => i.rendszam,
                                                           indulasi_hely => i.indulasi_hely,
                                                           erkezesi_hely => i.erkezesi_hely,
                                                           rakomany      => i.rakomany,
                                                           fuvar_dija    => i.dij);
    end loop;
end;
/
