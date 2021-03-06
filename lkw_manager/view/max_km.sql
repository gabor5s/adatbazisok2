create or replace view max_km as
       SELECT j.jarmu_tipus
             ,j.rendszam
             ,j.teljesitmeny
             ,j.futott_km
             ,a.vezeteknev || ' ' || a.keresztnev AS nev
         FROM jarmu j
        INNER JOIN alkalmazott a
           ON j.sofor_id = a.id
        WHERE rownum = 1
        ORDER BY j.futott_km DESC;
