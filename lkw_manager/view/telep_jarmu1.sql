create or replace view telep_jarmu1 as
       select j.jarmu_tipus,
              j.rendszam,
              j.teljesitmeny,
              a.vezeteknev || ' ' || a.keresztnev as nev 
              from jarmu j inner join alkalmazott a on j.sofor_id = a.id
                           inner join telep t on a.telep_id = t.id
                           where t.id = 1;
