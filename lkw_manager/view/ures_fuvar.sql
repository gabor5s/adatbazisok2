create or replace view ures_fuvar as
       select m.indulasi_hely || '-' || m.erkezesi_hely as fuvar,
              j.jarmu_tipus,
              a.vezeteknev || ' ' || a.keresztnev as nev 
       from munka m
       inner join jarmu j on m.kamion_id = j.id
       inner join alkalmazott a on j.sofor_id = a.id 
       where m.rakomany = '-';
