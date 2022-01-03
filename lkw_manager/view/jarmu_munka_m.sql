create or replace view jarmu_munka as
       select m.id, m.rakomany, j.jarmu_tipus, j.rendszam  
       from munka m inner join jarmu j on m.kamion_id = j.id
       where j.rendszam like '%M%';
       
       select * from jarmu_munka_m;
