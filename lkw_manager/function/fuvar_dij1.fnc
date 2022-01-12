create or replace function fuvar_dij1(p_munka_id number)
return ty_fuvar_dij is res ty_fuvar_dij;
   
begin
  res := ty_fuvar_dij();
  
  select j.jarmu_tipus,
              j.rendszam,
              m.rakomany,
              m.indulasi_hely,
              m.erkezesi_hely,
              (m.tavolsag * (select p.ertek from parameter_tabla p where p.id = 1) * m.rakomany_suly)
              into res.jarmu_tipus,
                   res.rendszam,
                   res.rakomany,
                   res.indulasi_hely,
                   res.erkezesi_hely,
                   res.fuvar_dija
       from munka m inner join jarmu j on m.kamion_id = j.id
       where m.id = p_munka_id;
 
    return res;
end;
/
