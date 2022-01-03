create or replace view jarmu_munka as
       select m.id,
              m.rakomany,
              j.jarmu_tipus,
              j.rendszam,
              a.vezeteknev || ' ' || a.keresztnev as nev  
       from munka m inner join jarmu j on m.kamion_id = j.id
                    inner join alkalmazott a on j.sofor_id = a.id
                    
                    where j.rendszam like '%M%';
